# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce
pkgver=0.6.4
pkgrel=3
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache')
source=("git+https://github.com/nestybox/sysbox.git#tag=v$pkgver"
        # On a recursive clone, git submodule foreach --recursive git rev-parse HEAD
        "git+https://github.com/nestybox/dockerfiles.git#commit=5b7ec2230af7fb65eb820277e8c408cfa68f79b7"
        "git+https://github.com/nestybox/sysbox-fs.git#commit=1a678b72ac430009739fa6596b824f29b1f7fe2e"
        "git+https://github.com/nestybox/fuse.git#commit=45cd9a3d884448418546d8eaa54ee7d772e576d6"
        "git+https://github.com/nestybox/sysbox-ipc.git#commit=8ab58c1422bea9fb6c147c032d012e0568695885"
        "git+https://github.com/nestybox/sysbox-libs.git#commit=a33b350b63db747998d4f0108d13f754de8a12e5"
        "git+https://github.com/nestybox/sysbox-mgr.git#commit=03f5d7bc584fdcb2319b2c1831bd58581185fc1c"
        "git+https://github.com/nestybox/sysbox-pkgr.git#commit=a4c76e1348b3bcdddb7847969f99b21f5e9a5f10"
        "git+https://github.com/nestybox/sysbox-runc.git#commit=085502643ea5281652c6984eed9797872f22698a"
        go-get-grpc-v1.63.0-and-tidy-sysbox-fs.patch
        go-get-grpc-v1.63.0-and-tidy-sysbox-ipc.patch
        go-get-grpc-v1.63.0-and-tidy-sysbox-mgr.patch
        go-get-grpc-v1.63.0-and-tidy-sysbox-runc.patch
        Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch)
sha256sums=(4190cb7cbf96fddab352ded0553d2419935a003780aa39d45f762710bc0ad20b
            2b1a7c1af588ee08216a345b5c5ed17d193dc69409464a2f1aa518daf5bc87e9
            6a40e69807d4fff706a08c52aee9d7ff19b581beac388a6997d659bbed606a01
            a15933541960d09d2f6cc857c95982a735294876bbbdc93fcbc879832e35efee
            841a89a2f3c08ae39f036af3ad9609f637ea24c0fda55d68fbc36fba907fddbf
            3cc35f712595acd2868a9ef3afe3a6ed4ae01b2c463f58fe74264a446cb53e0e
            7e7fb434307e5f8848756227d7eab84d9d1b01cd5ef1fcdbf9bc688608536ea0
            79741411d414bad1d7644765357db8dc1642a1d799e0f0335753b1b069a2091d
            2dae82c08b0a084ae1b789ac644cd2f1c78081a00519df72dea4d0a782197ed5
            7789a83d353abe64c2e952aa000ad09a25ccd32dabe9d422911d5eb3d69a70a4
            2be62c1f36a378ee0ea830e0fe5e10e30758047b48d32bc12f5f4c2877f52010
            4d7a5b94b1191131187c605d44348153983ebcca61d981f53b85b6963f558048
            9d904fe997bcd3ba3ba5f5d9855f7fcb2bc91dfe276292c059bd2c74270ad668
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

	# Support for protoc-gen-go-grpc 1.4.0-1
	# Those patches are the result of running "go get -u google.golang.org/grpc@v1.63.0"
	# on sysbox-ipc's folder, and then "go mod tidy" on sysbox-{fs,ipc,mgr,runc} folders
	# We should be able to get rid of this on the next release since sysbox's git also has this update
	patch -d sysbox/sysbox-fs -Np1 -i "$srcdir/go-get-grpc-v1.63.0-and-tidy-sysbox-fs.patch"
	patch -d sysbox/sysbox-ipc -Np1 -i "$srcdir/go-get-grpc-v1.63.0-and-tidy-sysbox-ipc.patch"
	patch -d sysbox/sysbox-mgr -Np1 -i "$srcdir/go-get-grpc-v1.63.0-and-tidy-sysbox-mgr.patch"
	patch -d sysbox/sysbox-runc -Np1 -i "$srcdir/go-get-grpc-v1.63.0-and-tidy-sysbox-runc.patch"

	# Support for protoc-gen-go-rpc 1.5.0-1 / 1.5.1-1
	# https://github.com/grpc/grpc-go/blob/cmd/protoc-gen-go-grpc/v1.5.1/cmd/protoc-gen-go-grpc/grpc.go#L181
	sed -i 's/--go_out=. --go-grpc_out=./--go_out=. --go-grpc_out=. --go-grpc_opt=use_generic_streams_experimental=false/g' \
		sysbox/sysbox-ipc/sysboxFsGrpc/sysboxFsProtobuf/Makefile \
		sysbox/sysbox-ipc/sysboxMgrGrpc/sysboxMgrProtobuf/Makefile
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
