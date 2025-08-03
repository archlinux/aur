# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.6.7
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache')
source=("git+https://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git+https://github.com/nestybox/dockerfiles.git#commit=f27a6f2b4a97377f932968d2897ba1603680036a"
        "git+https://github.com/nestybox/sysbox-fs.git#commit=6a8d71f54e7570e5297af89ff24ed3bafa61659f"
        # FIXME Workaround for https://github.com/nestybox/sysbox/issues/957, undo once fixed.
        "fuse::git+https://github.com/joanbm/sysbox-fuse-workaround-for-issue-957.git#commit=45cd9a3d884448418546d8eaa54ee7d772e576d6"
        "git+https://github.com/nestybox/sysbox-ipc.git#commit=f05151f4b4c1df63d7fd241577ca032905c1bd0e"
        "git+https://github.com/nestybox/sysbox-libs.git#commit=6faf00c74d45f7bdff0d1930fe8590c17a2d0a8b"
        "git+https://github.com/nestybox/sysbox-mgr.git#commit=aaeff6c5dc70c137e62166474a309ca5fc42d044"
        "git+https://github.com/nestybox/sysbox-pkgr.git#commit=2d5e795f5df69b7ead12c2bdad2da4e4704720df"
        "git+https://github.com/nestybox/sysbox-runc.git#commit=c58eba1be027c762c495bc4eeba7c0984beda1ab"
        Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch)
sha256sums=(04222fd028c9c46eaac3377820ba0fda26996844a686d758b69c9fecd6f906f0
            5b08df4010386969b5ebfd911b50dcde66627b2e07e15d5b22e0332ab00ea00e
            a7bf7b4fca9b0c7ad31a77ec69506097915e21852208892fb463057573594c92
            a15933541960d09d2f6cc857c95982a735294876bbbdc93fcbc879832e35efee
            7f7e3e0f9acac2ea6ff2d9702fc4006f679cf005cf8abf2dbbb447c133b8455e
            114f37d313a2519c54f8333fef2d6915f531d03e0823091ff4645fdf60f1f0a7
            2ab79924f5c1b92a53e1d345ca146a55ee26b0429bfc5955b766a95ed042b1ed
            2f862fcf8aef961857b651a4a75a9353a6a4472f1eb08c49c5e8f965e96f7aeb
            d56dc644e73d7fba36c7547781ed8f903a3d1021ed21522da83476ac14005029
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
