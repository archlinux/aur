# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.7.2
pkgrel=2
epoch=2
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
source=("git+https://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git+https://github.com/nestybox/dockerfiles.git#commit=c05538c1e33baf9d49695a9007e87462115d31da"
        "git+https://github.com/nestybox/sysbox-fs.git#commit=201ec1380ba5af0c8a677b718c7c3805af2b280c"
        "git+https://github.com/nestybox/fuse.git#commit=5ce319439091b08f33b149cb2482039f1b0a24fe"
        "git+https://github.com/nestybox/sysbox-ipc.git#commit=2e39ef01a0aace7fb3c599c97a5f82d1e7117773"
        "git+https://github.com/nestybox/sysbox-libs.git#commit=af547406cfca19a8a41f5830e06791d776f9ab7e"
        "git+https://github.com/nestybox/sysbox-mgr.git#commit=a14866548fcbb62aba5052e73c81e7c1b9bfc8b2"
        "git+https://github.com/nestybox/sysbox-pkgr.git#commit=71cf8a015b5e0ef11d35b33ae077a8b949c4c2ff"
        "git+https://github.com/nestybox/sysbox-runc.git#commit=583e8008fcf5018a40201c28505a500292fe2c83"
        Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch)
sha256sums=(f38c78f3d585f226fe4797284f41d5f7ad6f98c5e2338f2b978125424683d33e
            # On a recursive clone, git submodule foreach --recursive sh -c "git -c core.abbrev=no archive --format tar HEAD | sha256sum"
            b0de3f8c452d7bf4ea17368794a9db440bdc23a9a04e1f97e6c13ecf4c0c55c3
            7313ff3a6587308f91eb236e7df49247638e24fc6edd14cd4e55bc0e92d9039d
            b2070599fd5181520ca6069940de16938f54e8d554c2d88fed06214a75ba0bf2
            41310acf2cf2bcbbe7a69351b59608e63a82f209d225013cb7283575bd1f3427
            b5129d17a6c26bdddff1a71a7be96c90fbaf5be92893887c6e4a12b06405dce0
            a16aba4c49656d83cacb9b06a60299a5ef5952c0623b17dc3f659c738bfb039b
            5f212582d5c6176adb3ceafdbb49095a9bf930c55b001631caa5d3f98f0bbd9c
            c416b4f392e6c2d86343572a826d963b64ce89c3f7348aa18036e8e96c4a53ed
            5264ed0c448868083a9f1bedc2846d744c9ea90e58f8555c50bbc155008512e5)
install=install.sh
depends=('rsync' 'fuse3')
makedepends=('git' 'go' 'protobuf' 'protoc-gen-go-grpc')
# Those next makedepends are not *actually* needed but the build process tries to launch them anyway
makedepends+=('lsb-release' 'inetutils')

prepare() {
	# Hook up submodules
	git -C sysbox submodule init
	git -C sysbox config submodule.sysbox-dockerfiles.url "$srcdir/dockerfiles"
	git -C sysbox config submodule.sysbox-fs.url "$srcdir/sysbox-fs"
	git -C sysbox config submodule.sysbox-ipc.url "$srcdir/sysbox-ipc"
	git -C sysbox config submodule.sysbox-libs.url "$srcdir/sysbox-libs"
	git -C sysbox config submodule.sysbox-mgr.url "$srcdir/sysbox-mgr"
	git -C sysbox config submodule.sysbox-pkgr.url "$srcdir/sysbox-pkgr"
	git -C sysbox config submodule.sysbox-runc.url "$srcdir/sysbox-runc"
	git -C sysbox -c protocol.file.allow=always submodule update

	git -C sysbox/sysbox-fs submodule init
	git -C sysbox/sysbox-fs config submodule.bazil.url "$srcdir/fuse"
	git -C sysbox/sysbox-fs -c protocol.file.allow=always submodule update

	git -C sysbox/sysbox-libs submodule init
	git -C sysbox/sysbox-libs -c protocol.file.allow=always submodule update

	# Migrate to the new protoc-gen-go-grpc generator. Set require_unimplemented_servers=false for compatibility:
	# https://github.com/grpc/grpc-go/blob/abff344ead8f49f3a89ae8be68b1538611950ec4/cmd/protoc-gen-go-grpc/README.md
	sed -i 's/--go_out=plugins=grpc:./--go_out=. --go-grpc_out=. --go-grpc_opt=require_unimplemented_servers=false/g' \
		sysbox/sysbox-ipc/sysboxFsGrpc/sysboxFsProtobuf/Makefile \
		sysbox/sysbox-ipc/sysboxMgrGrpc/sysboxMgrProtobuf/Makefile

	patch -d sysbox -Np1 -i "$srcdir/Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch"
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

	install -Dm644 -t "${pkgdir}/usr/lib/sysctl.d/" sysbox/sysbox-pkgr/systemd/99-sysbox-sysctl.conf
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" sysbox/sysbox-pkgr/systemd/*.service
	install -Dm644 -t "${pkgdir}/usr/share/doc/sysbox-ce/" sysbox/CHANGELOG.md sysbox/sysbox-pkgr/deb/sysbox-ce/copyright
}
