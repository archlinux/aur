# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.3.0
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64')
license=('Apache')
source=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}-0.debian-buster_amd64.deb"
        "sysbox-ipc-fix-build-on-protobuf-1.5.0-plus.patch"
        "git://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git://github.com/nestybox/dockerfiles.git#commit=4bb4b114a7776cd687e2f873ae92c933f908988e"
        "git://github.com/nestybox/sysbox-fs.git#commit=bb001b7fe2a0a234fe86ab20045677470239e248"
        "git://github.com/nestybox/fuse.git#commit=76fedf6163b9a7411d029805a23729ffc07f7df1"
        "git://github.com/nestybox/sysbox-ipc.git#commit=28165ef823eebcd85c7827dc32542294fbdca920"
        "git://github.com/nestybox/sysbox-libs.git#commit=8eeb72b735540aaa166f99ddd57c8e42fc782048"
        "git://github.com/nestybox/libseccomp.git#commit=bb94b24efc970fc91a239785900c89b3d28ea4b5"
        "git://github.com/nestybox/libseccomp-golang.git#commit=bcff2d4628f0faab6798c1499f8a45da7aeb2150"
        "git://github.com/nestybox/sysbox-mgr.git#commit=6ae5668e797ee1bb88fd5f5ae663873a87541ecb"
        "git://github.com/nestybox/sysbox-runc.git#commit=df952e5276cb6e705e0be331e9a9fe88f372eab8")
sha256sums=('02aa4b3ab3e823d91e01c742875a4ece9d6415c9915c5f08df918725361b928e'
            '6606edfb1e693d6f506bd914f6c4bbac26c8079466adfbb917fda9e4a79ba69d'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
install=install.sh
depends=('rsync' 'fuse2')
makedepends=('git' 'go' 'protobuf' 'protobuf-go')
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

	# Yet-unreleased Arch Linux fixes
	git -C sysbox/sysbox-libs cherry-pick -n 16033800cb3d18b361928376da196322cad8e055
	git -C sysbox/sysbox-mgr cherry-pick -n 2f343c4728e53d3ebeabbe15c9953d422ddf0168 \
	                                        eff741183ef9865580d7ae256e57a37859523815 \
	                                        eb797f6166b2725c4d507632737739b2a92a486f

	# Get some non-binary files from the Debian package as they don't seem to be uploaded anywhere else
	mkdir -p data
	tar xf data.tar.xz -C data
	cd data

	find lib/systemd -type f -exec sed -i 's|/usr/local/sbin|/usr/bin|g' {} +
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
	(cd etc/modules-load.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/etc/modules-load.d/{}" \; )
	(cd lib/sysctl.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/sysctl.d/{}" \; )
	(cd lib/systemd && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/systemd/{}" \; )
	(cd usr/share/doc && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/{}" \; )
}
