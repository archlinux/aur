# Maintainer: Ben Mehlow < bmehlow at gmail dot com >
# Contributor: Nora Allen < blackcatgames at protonmail dot com >
# Contributor: Vincent Lee < vincent at vincent dash lee dot net >

_realname=sapling  # Already taken on AUR
pkgname="$_realname-scm"
_realver=0.2.20260522-084851+1e764c94
_realver2=0.2.20260522-084851-1e764c94
pkgver="${_realver//-/.}"  # dashes aren't allowed in pkgver
epoch=1  # Version scheme was changed from YYYYMMDD-.... to prepend a number: 0.1-YYYYMMDD-...
pkgrel=1
pkgdesc="A Scalable, User-Friendly Source Control System"
arch=("x86_64")
url="https://sapling-scm.com"
license=('GPL2')
provides=("$pkgname")
depends=('curl' 'nodejs' 'python312' 'zstd')
# NOTE: namcap(1) reports various missing python libs from scanning the package, but
#  this binary actually vendors them in. The resulting sl(1)
#  program runs fine without those libraries installed systemwide.
# NOTE: python312 (AUR) is a runtime dependency — the binary links against libpython3.12.
# The build also requires python3.12 specifically: cpython 0.7.2 (the python-modules
# build script) only supports Python 3.7–3.12; the system python (3.14) causes a SIGSEGV.
# pick_python.py selects python3.12 automatically when present. PYTHONPATH lets python3.12
# find setuptools from the system python3.14 install — setuptools is pure Python, so safe.
makedepends=("cmake" "openssl" "python-setuptools" "rust" "yarn")
optdepends=("github-cli: for integration with GitHub")
# Cargo uses lld as linker; lld cannot read GCC LTO IR objects produced by -flto=auto.
# All C code compiled via Cargo build scripts (chg, lz4, libssh2, pycext modules, etc.)
# ends up in static archives with GCC LTO bitcode, making symbols invisible to lld.
options=(!lto)
source=("https://github.com/facebook/sapling/archive/refs/tags/$_realver.tar.gz")
sha256sums=('2b2d3023ec10478e3d9d4db3240b71bc4068a63dd11f98f11d399372c62a5f9a')

prepare() {
	cd "$_realname-$_realver2"

	# Pre-compile libevalframe.a for injection into build script compilations (see below).
	# evalframe.c only needs Python.h from python3.12.
	local pre_compiled="$srcdir/pre-compiled"
	mkdir -p "$pre_compiled"
	local python312_inc
	python312_inc=$(python3.12 -c 'import sysconfig; print(sysconfig.get_path("include"))')
	${CC:-gcc} -std=c99 ${CFLAGS} -fPIC \
		-I"$python312_inc" \
		-c eden/scm/lib/backtrace-python/evalframe-sys/src/evalframe.c \
		-o "$pre_compiled/evalframe.o"
	ar rcs "$pre_compiled/libevalframe.a" "$pre_compiled/evalframe.o"

	# pycext's build.rs uses python_sysconfig::add_python_flags() which reads python3.12's
	# sysconfig CFLAGS (baked in at python312 compile time) and passes them via cc::Build::flag().
	# python3.12's sysconfig includes -flto=auto; the pick_flag() filter only strips -W flags.
	# GCC LTO IR in libcextmodules.a / libtraceprofimpl.a is invisible to lld, breaking hgmain.
	sed -i 's/!flag.starts_with("-W")/!flag.starts_with("-W") \&\& !flag.starts_with("-flto")/' \
		eden/scm/lib/util/python-sysconfig/src/lib.rs

	mkdir -p .cargo
	# Cargo's links-override: skip zstd-sys build script and use system libzstd directly.
	# zstd-sys has `links = "zstd"`, but its native link flags aren't propagated through the
	# deep build-dep chain (python-modules → codegen → zstdelta → zstd-sys), causing undefined
	# ZSTD_* symbols when linking the python-modules build script binary.
	cat > .cargo/config.toml << 'EOF'
[target.x86_64-unknown-linux-gnu.zstd]
rustc-link-lib = ["zstd"]
rustc-link-search = ["/usr/lib"]
EOF
}

build() {
	cd "$_realname-$_realver2/eden/scm"
	# TODO `make install-oss` rebuilds the entire project, rendering `make oss`
	# pointless currently. See https://github.com/facebook/sapling/issues/161 for more info.
	# make PREFIX=/usr oss
}

check() {
	cd "$_realname-$_realver2"
}

package() {
	cd "$_realname-$_realver2/eden/scm"
	# OPENSSL_NO_VENDOR: use system OpenSSL instead of vendored build. The vendored build
	# runs `make install` inside cargo, which inherits DESTDIR from package() and installs
	# to $pkgdir/<abs-path>, so openssl-sys can't find the library at its expected path.
	# PYTHONPATH: let python3.12 (chosen by pick_python.py) find setuptools from the
	# system python3.14 install. setuptools is pure Python so this is safe across versions.
	local py3_sitepackages
	py3_sitepackages=$(python3 -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
	# RUSTFLAGS: Cargo does not propagate cargo:rustc-link-lib=static=evalframe to the build
	# script binary of backtrace-python (profile-rustflags is unstable in this Cargo version).
	# RUSTFLAGS reaches all compilations including build script binaries. The duplicate -levalframe
	# for the normal compilation path is harmless: lld only extracts archive symbols once.
	local pre_compiled="$srcdir/pre-compiled"
	OPENSSL_NO_VENDOR=1 SAPLING_VERSION="$_realver" PYTHONPATH="$py3_sitepackages" \
		RUSTFLAGS="${RUSTFLAGS} -L $pre_compiled -l static=evalframe" \
		make PREFIX=/usr DESTDIR="$pkgdir/" install-oss
}

