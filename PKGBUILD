# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.7.1
pkgrel=1
epoch=2
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
source=("git+https://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git+https://github.com/nestybox/dockerfiles.git#commit=c05538c1e33baf9d49695a9007e87462115d31da"
        "git+https://github.com/nestybox/sysbox-fs.git#commit=c3d2ebc65102e32e74e383675f03b45556326888"
        "git+https://github.com/nestybox/fuse.git#commit=5ce319439091b08f33b149cb2482039f1b0a24fe"
        "git+https://github.com/nestybox/sysbox-ipc.git#commit=f05151f4b4c1df63d7fd241577ca032905c1bd0e"
        "git+https://github.com/nestybox/sysbox-libs.git#commit=cacac19395528afa42b467a980b05d8d1c6d646c"
        "git+https://github.com/nestybox/sysbox-mgr.git#commit=2d45af01bcfd8641e6641f76104c6003bf501cd7"
        "git+https://github.com/nestybox/sysbox-pkgr.git#commit=b8403a90017795f42f02d5b2e1b6752d02ce4b57"
        "git+https://github.com/nestybox/sysbox-runc.git#commit=081856cc5d17e7095f066b08d0eca6bb0b515c47"
        Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch)
sha256sums=(481aea0544efe8b3cb6dac6149e7ec15818e04bf147451e5c6a84dccc9761b2b
            b0de3f8c452d7bf4ea17368794a9db440bdc23a9a04e1f97e6c13ecf4c0c55c3
            67301826664d5e2005e177e918416a3386bea4710f4eafb4e98f24fcd1b48021
            b2070599fd5181520ca6069940de16938f54e8d554c2d88fed06214a75ba0bf2
            7f7e3e0f9acac2ea6ff2d9702fc4006f679cf005cf8abf2dbbb447c133b8455e
            d82f23514e8124cec708c668b8d032676d5dd084e96caa8bad297b54701b8e1c
            95007069e2c73becac2401934de43e825f817a4fa190a5cdbeee7c320aeccf1e
            0ec269e7dd554fc94fd40af22ebb058c44fdc2fbff0ada72386d176cc89552d4
            9674f68d2f2f00816ed36fe4ace8fd0f41b65644b698175c829f058d78edafa8
            5264ed0c448868083a9f1bedc2846d744c9ea90e58f8555c50bbc155008512e5)
install=install.sh
depends=('rsync' 'fuse2')
makedepends=('git' 'go' 'protobuf' 'protoc-gen-go-grpc')
# Those next makedepends are not *actually* needed but the build process tries to launch them anyway
makedepends+=('lsb-release' 'inetutils')
optdepends=('shiftfs: For uid-mapping on very old kernels without idmapped-mounts')

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
