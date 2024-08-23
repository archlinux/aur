# Maintainer: BingBong
# Contributor: Alberto Salvia Novella (es20490446e.wordpress.com)
# Contributor: Bryan Malyn <bim9262@gmail.com>
# Contributor: Spider Mario <spidermario@free.fr>
# Contributor: Taras Shpot <mrshpot@gmail.com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgbase=rust-git
pkgname=(rust-git rust-src-git)
epoch=4
pkgver=1.82.0.r1.59a74db3
pkgrel=2
pkgdesc="Systems programming language focused on safety, speed and concurrency"
url="https://www.rust-lang.org"
arch=(x86_64)
license=("Apache-2.0 OR MIT")
options=(!emptydirs !lto)
depends=(
        bash
        curl
        gcc
        gcc-libs
        glibc
        libssh2
        llvm-libs
        openssl
        zlib
)
makedepends=(
        clang
        cmake
        libffi
        lld
        llvm
        ninja
        perl
        python
        git
)
source=(
        "git+https://github.com/rust-lang/rust.git"
        0001-bootstrap-Change-libexec-dir.patch
        0002-bootstrap-Change-bash-completion-dir.patch
        0003-compiler-Change-LLVM-targets.patch
)
b2sums=(
'SKIP'
        'ba3444d558b9428231fd33156fc231b34dc445813c2c849106f0db0a519c26eb8b8f7f2b8b13e9a303949c50611d95b0ffaf4d0bdc7fde640337d04602b03312'
	'b582b6bf142ad574e489d3aec1d8b317b014921fc7d8e28a496576ec08535a595a10491198dd04144bf266cb09cbd6427e313d734f65b04658ca7755051a0997'
	'32be97e6fefb20f3d1f16834d3522e22a79e3928e99817418e1f4599d2b5432a9f2d3c09e962c180bb0146d8725949bae24a0dffa7e5bd948a72ffb92d7ca22f'
)

pkgver() {
        cd ./rust
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
        cd "$srcdir"/rust

        # Patch bootstrap so that rust-analyzer-proc-macro-srv
        # is in /usr/lib instead of /usr/libexec
        patch -Np1 -i ../0001-bootstrap-Change-libexec-dir.patch

        # Put bash completions where they belong
        patch -Np1 -i ../0002-bootstrap-Change-bash-completion-dir.patch

        # Use our *-pc-linux-gnu targets, making LTO with clang simpler
        patch -Np1 -i ../0003-compiler-Change-LLVM-targets.patch

        cat >config.toml <<END
# see src/bootstrap/defaults/
profile = "dist"

[llvm]
link-shared = true

[build]
target = [
  "x86_64-unknown-linux-gnu",
]
locked-deps = true
vendor = false
tools = [
  "cargo",
  "clippy",
  "rustdoc",
  "rustfmt",
  "rust-analyzer-proc-macro-srv",
  "analysis",
  "src",
  "rust-demangler",
]
sanitizers = true
profiler = true
docs = false

[install]
prefix = "/usr"

[rust]
codegen-units-std = 1
debuginfo-level = 1
debuginfo-level-std = 2
channel = "stable"
description = "Arch Linux $pkgbase $epoch:$pkgver-$pkgrel"
rpath = false
frame-pointers = true
deny-warnings = false
backtrace-on-ice = true
remap-debuginfo = false
jemalloc = true

[dist]
compression-formats = ["gz"]

[target.x86_64-unknown-linux-gnu]
cc = "/usr/bin/gcc"
cxx = "/usr/bin/g++"
ar = "/usr/bin/gcc-ar"
ranlib = "/usr/bin/gcc-ranlib"
llvm-config = "/usr/bin/llvm-config"
END
}

_pick() {
        local p="$1" f d; shift
        for f; do
                d="$srcdir/$p/${f#$pkgdir/}"
                mkdir -p "$(dirname "$d")"
                mv "$f" "$d"
                rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
        done
}

build() {
        cd "$srcdir"/rust

        export RUST_BACKTRACE=1
        unset CFLAGS CXXFLAGS LDFLAGS

        DESTDIR="$srcdir/dest-rust" python ./x.py install -j "$(nproc)"

        cd ../dest-rust

        # delete unnecessary files, e.g. files only used for the uninstall script
        rm -v usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
        rm -v usr/lib/rustlib/manifest-*

        # licenses for main rust package
        local ldir="usr/share/licenses/rust" f d
        mkdir -p "$ldir"
        for f in usr/share/doc/*/{COPYRIGHT,LICENSE}*; do
                d="$(dirname "$f")"
                case $f in
                        */LICENSE-APACHE) rm -v "$f" ;;
                        *) mv -v "$f" "$ldir/${f##*/}.${d##*/}" ;;
                esac
                rmdir -p --ignore-fail-on-non-empty "$d"
        done

        # rustbuild always installs copies of the shared libraries to /usr/lib,
        # overwrite them with symlinks to the per-architecture versions
        mkdir -pv usr/lib32
        ln -srvft usr/lib   usr/lib/rustlib/x86_64-unknown-linux-gnu/lib/*.so
        ln -srvft usr/lib32 usr/lib/rustlib/i686-unknown-linux-gnu/lib/*.so

        _pick dest-src  usr/lib/rustlib/src
}

package_rust-git() {
        optdepends=(
                'gdb: rust-gdb script'
                'lldb: rust-lldb script'
        )
        provides=(
                cargo
                "rust=${pkgver}"
                rustfmt
        )
        conflicts=(
                cargo
                rust
                'rust-docs<1:1.56.1-3'
                rustfmt
        )

        cp -a dest-rust/* "$pkgdir"
}

package_rust-src-git() {
        pkgdesc="Source code for the Rust standard library"
        depends=(rust)
        conflicts=(rust-src)
        provides=("rust-src=${pkgver}")

        cp -a dest-src/* "$pkgdir"

        install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
          rustc-$pkgver-src/{COPYRIGHT,LICENSE-MIT}
}
