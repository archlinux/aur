# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.6.6
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache')
source=("git+https://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git+https://github.com/nestybox/dockerfiles.git#commit=6f9238079b9b1a9364895da5a429f025528ab033"
        "git+https://github.com/nestybox/sysbox-fs.git#commit=2d853ebf2592f79ae8cb0bfd1524f1163a0a9175"
        "git+https://github.com/nestybox/fuse.git#commit=45cd9a3d884448418546d8eaa54ee7d772e576d6"
        "git+https://github.com/nestybox/sysbox-ipc.git#commit=f05151f4b4c1df63d7fd241577ca032905c1bd0e"
        "git+https://github.com/nestybox/sysbox-libs.git#commit=2ccacbeb20a7095b1ea1b6d2916cd0fc5be498bb"
        "git+https://github.com/nestybox/sysbox-mgr.git#commit=648c6e1d867e09f71bfb1303fa3e5af5cb6ebb54"
        "git+https://github.com/nestybox/sysbox-pkgr.git#commit=95761e2d04ca56c410dd488900de610e60133beb"
        "git+https://github.com/nestybox/sysbox-runc.git#commit=1b440ff266841f3d2d296e664122a9e29ceb9fd8"
        Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch)
sha256sums=(8a491b9a4e96ef16313b784bb6029b3a354b58ecc197c0d3c2b21ebef6f75403
            47885d131f44d8ff855882e22893f6108473480ea08b3f0415b014b5b337b367
            079dc7e44c7f214d02bdc231205f80cd7c1f915028c20084a744acbb934055f0
            a15933541960d09d2f6cc857c95982a735294876bbbdc93fcbc879832e35efee
            7f7e3e0f9acac2ea6ff2d9702fc4006f679cf005cf8abf2dbbb447c133b8455e
            88b1ad675375f17d3c043bb6e56955a4a024cfc6c126eceb98ff65ca763d75ce
            e8b2b75b21cf3cdfc8672024ba0fb4989698d3a0bbb869cad980d394289eb526
            1894ed739f8e028ccd6cbb24b56194aaa5ac7a41c90345d966f9bd1b53767817
            7951a7646cf8e1951d388ecbffea6f1e629de7e4760435d9717ea32f73595484
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
