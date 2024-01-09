# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.6.3
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64')
license=('Apache')
source=("git+https://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git+https://github.com/nestybox/dockerfiles.git#commit=5b7ec2230af7fb65eb820277e8c408cfa68f79b7"
        "git+https://github.com/nestybox/sysbox-fs.git#commit=ff6e109d64856db9b4bce8d10226371d7797ba96"
        "git+https://github.com/nestybox/fuse.git#commit=45cd9a3d884448418546d8eaa54ee7d772e576d6"
        "git+https://github.com/nestybox/sysbox-ipc.git#commit=8ab58c1422bea9fb6c147c032d012e0568695885"
        "git+https://github.com/nestybox/sysbox-libs.git#commit=a33b350b63db747998d4f0108d13f754de8a12e5"
        "git+https://github.com/nestybox/sysbox-mgr.git#commit=03f5d7bc584fdcb2319b2c1831bd58581185fc1c"
        "git+https://github.com/nestybox/sysbox-pkgr.git#commit=52a0029982f3819d16a60c147b8e72fb1593e67e"
        "git+https://github.com/nestybox/sysbox-runc.git#commit=e6ca9b930c43c0f20bb93ef3ef6af5bd49fd88ce"
        Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
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
