# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.4.0
pkgrel=2
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64')
license=('Apache')
source=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}-0.debian-buster_amd64.deb"
        "sysbox-ipc-fix-build-on-protobuf-1.5.0-plus.patch"
        "sysbox-fs-use-local-sysbox-libs-formatter.patch"
        "sysbox-runc-use-local-sysbox-libs-formatter.patch"
        "git://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git://github.com/nestybox/dockerfiles.git#commit=4036dce15537570b20a9595487b13a1aeffaf28a"
        "git://github.com/nestybox/sysbox-fs.git#commit=394d51110fe23bd64b7be8fb9b217dc9cff16032"
        "git://github.com/nestybox/fuse.git#commit=76fedf6163b9a7411d029805a23729ffc07f7df1"
        "git://github.com/nestybox/sysbox-ipc.git#commit=fec26526a49d31bd0080c9b51a6b59f3e683c387"
        "git://github.com/nestybox/sysbox-libs.git#commit=1ea69f2f6dbb43872e58723b923d8a57a30f206c"
        "git://github.com/nestybox/libseccomp.git#commit=605460263e5b9d15a2f62fb9a76d6c8f7e3ed486"
        "git://github.com/nestybox/libseccomp-golang.git#commit=bcff2d4628f0faab6798c1499f8a45da7aeb2150"
        "git://github.com/nestybox/sysbox-mgr.git#commit=8b13c261d1eb3a7a0c632b7f13c3cd19a447d14b"
        "git://github.com/nestybox/sysbox-runc.git#commit=9e55c35e249f753c7d31e987c21d4ca4a2ddacfb")
sha256sums=('1b21cb19544a8e594a49ddce35f914035445a55e55f1cd4ba398a42e08ff86aa'
            '6606edfb1e693d6f506bd914f6c4bbac26c8079466adfbb917fda9e4a79ba69d'
            'ffc50d14b00a807bba5b3553fb554830823fdde7034db7efdf4b6ab6b47c1dcd'
            'ab0a41dc162b4bbae4b2302a88f66e32a020f8afe280480c9c75a4f9a6ea4345'
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

	# Buildfix for newer protobuf versions
	patch -d sysbox/sysbox-ipc -Np1 -i "$srcdir/sysbox-ipc-fix-build-on-protobuf-1.5.0-plus.patch"

	# Use locally built sysbox-libs/formatter instead of downloading it like the official build does,
	# this is necessary to fix the build due to '-mod=readonly' GOFLAGS (also default in Go 1.16+)
	# The official Dockerized build appears to depend on the import lookup feature to resolve it
	patch -d sysbox/sysbox-fs -Np1 -i "$srcdir/sysbox-fs-use-local-sysbox-libs-formatter.patch"
	patch -d sysbox/sysbox-runc -Np1 -i "$srcdir/sysbox-runc-use-local-sysbox-libs-formatter.patch"

	# Get some non-binary files from the Debian package as they don't seem to be uploaded anywhere else
	mkdir -p data
	tar xf data.tar.xz -C data
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
