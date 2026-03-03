# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.7.0
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
source=("git+https://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git+https://github.com/nestybox/dockerfiles.git#commit=c05538c1e33baf9d49695a9007e87462115d31da"
        "git+https://github.com/nestybox/sysbox-fs.git#commit=b70bd38bbf72bf0e759c5f7d8c38925d717068ae"
        # FIXME Workaround for https://github.com/nestybox/sysbox/issues/957, undo once fixed.
        "git+https://github.com/nestybox/fuse.git#commit=5ce319439091b08f33b149cb2482039f1b0a24fe"
        "git+https://github.com/nestybox/sysbox-ipc.git#commit=f05151f4b4c1df63d7fd241577ca032905c1bd0e"
        "git+https://github.com/nestybox/sysbox-libs.git#commit=9b42cd43fad17198c93ff660d9bb269e7c74366d"
        "git+https://github.com/nestybox/sysbox-mgr.git#commit=bff3721f86e737cfa129dfe9fe2e7933692aba26"
        "git+https://github.com/nestybox/sysbox-pkgr.git#commit=b8403a90017795f42f02d5b2e1b6752d02ce4b57"
        "git+https://github.com/nestybox/sysbox-runc.git#commit=a4dd414f7b9b7455c0fbf0d5e5db7bcfe30645bc"
        Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch)
sha256sums=(7d541c015514a85a24b3d687b7f7cafb0dabcfef2e4beb46c9bd1ef002b3269d
            b0de3f8c452d7bf4ea17368794a9db440bdc23a9a04e1f97e6c13ecf4c0c55c3
            3af91046ff24b7b3b8d81d48ed05d2ad4f6b4a6a9502091a00af634d95c09284
            b2070599fd5181520ca6069940de16938f54e8d554c2d88fed06214a75ba0bf2
            7f7e3e0f9acac2ea6ff2d9702fc4006f679cf005cf8abf2dbbb447c133b8455e
            2c3a9be118fb8a704f5579bc0c5245e0d6e0a47a5f70a8b30cf8cc6a1bedb4ae
            483c269bb1c6f9a36eaa599d45f85a4e9b9c30e7a8676176ee8eae3fb9245e94
            0ec269e7dd554fc94fd40af22ebb058c44fdc2fbff0ada72386d176cc89552d4
            b3d9fdafcdaf7d00c17e1866fd3f2cc426695e9097bc85d25b1f05665fbb0963
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
