# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.5.0
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64')
license=('Apache')
source=("https://downloads.nestybox.com/sysbox/releases/v${pkgver}/sysbox-ce_${pkgver}-0.linux_amd64.deb"
        "git+https://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git+https://github.com/nestybox/dockerfiles.git#commit=3ae0877cbfc71d1e17016d9ef4ad3acd5f2be7f7"
        "git+https://github.com/nestybox/sysbox-fs.git#commit=95a773a6ea3920f7ab454f1583465c7aea4c701f"
        "git+https://github.com/nestybox/fuse.git#commit=a499c0dfef7f4306b1d596f0cb11289f3b609c4b"
        "git+https://github.com/nestybox/sysbox-ipc.git#commit=f8d635430d7ce35830ca2a67fa1c95eb79499228"
        "git+https://github.com/nestybox/sysbox-libs.git#commit=f12101feb13996bfadae5db7390038d0d0f13c0a"
        "git+https://github.com/nestybox/libseccomp.git#commit=8249e759351de2c647fa6e4f2e7db6261a624542"
        "git+https://github.com/nestybox/libseccomp-golang.git#commit=34080bdd6320612d64400edce4e51188c0d64d72"
        "git+https://github.com/nestybox/sysbox-mgr.git#commit=bf4140a678de2cdb4d7f02f50c5e71348d2d2335"
        "git+https://github.com/nestybox/sysbox-runc.git#commit=c85420f1d1a426949047eb55e4112a3bc310aec2")
sha256sums=('7fa83a4f3b83018ec3dcef1f547ef25a99645f6c6544276bfbf8831e63a092d7'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
install=install.sh
depends=('rsync' 'fuse2')
makedepends=('git' 'go' 'protobuf' 'protobuf-go')
# Those next makedepends are not *actually* needed but the build process tries to launch them anyway
makedepends+=('lsb-release' 'inetutils')
optdepends=('shiftfs: Operation without userns-remap')

prepare() {
	# Hook up submodules
	git -C sysbox submodule init
	git -C sysbox config submodule.sysbox-dockerfiles.url "$srcdir/dockerfiles"
	git -C sysbox config submodule.sysbox-fs.url "$srcdir/sysbox-fs"
	git -C sysbox config submodule.sysbox-ipc.url "$srcdir/sysbox-ipc"
	git -C sysbox config submodule.sysbox-libs.url "$srcdir/sysbox-libs"
	git -C sysbox config submodule.sysbox-mgr.url "$srcdir/sysbox-mgr"
	git -C sysbox config submodule.sysbox-runc.url "$srcdir/sysbox-runc"
	git -C sysbox submodule update

	git -C sysbox/sysbox-fs submodule init
	git -C sysbox/sysbox-fs config submodule.bazil.url "$srcdir/fuse"
	git -C sysbox/sysbox-fs submodule update

	git -C sysbox/sysbox-libs submodule init
	git -C sysbox/sysbox-libs config submodule.libseccomp.url "$srcdir/libseccomp"
	git -C sysbox/sysbox-libs config submodule.libseccomp-golang.url "$srcdir/libseccomp-golang"
	git -C sysbox/sysbox-libs submodule update

	# Get some non-binary files from the Debian package as they don't seem to be uploaded anywhere else
	mkdir -p data
	tar xf data.tar.zst -C data
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	make -C sysbox sysbox-local
}

package() {
	make -C sysbox DESTDIR="${pkgdir}/usr/bin" install

	cd "data"
	(cd usr/lib/modules-load.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/modules-load.d/{}" \; )
	(cd lib/sysctl.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/sysctl.d/{}" \; )
	(cd lib/systemd && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/systemd/{}" \; )
	(cd usr/share/doc && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/{}" \; )
}
