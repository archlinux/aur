# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=cri-o
pkgver=1.13.0
pkgrel=1
pkgdesc='Open Container Initiative-based implementation of Kubernetes Container Runtime Interface'
arch=(x86_64)
url='https://github.com/kubernetes-incubator/cri-o'
license=(Apache)
makedepends=(go go-md2man ostree)
backup=('etc/crio/crio.conf')
source=("git+https://github.com/kubernetes-incubator/cri-o")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"

	git checkout "v$pkgver"
	install -m755 -d "$srcdir/go/src/github.com/kubernetes-incubator"
	cp -a "$srcdir/$pkgname" "$srcdir/go/src/github.com/kubernetes-incubator/cri-o"
}

build() {
	cd "$srcdir/go/src/github.com/kubernetes-incubator/cri-o"
	sed -i 's/$(GO) build -i/$(GO) build/' Makefile
	sed -i 's#../bin/conmon: config.h $(obj) | ../bin#../bin/conmon: $(obj) | config.h ../bin#' conmon/Makefile

	export GOPATH="$srcdir/go"
	make -j1 binaries docs

	./bin/crio --selinux=true \
		--storage-driver=overlay \
		--conmon /usr/libexec/crio/conmon \
		--cni-plugin-dir /usr/libexec/cni \
		--default-mounts /run/secrets \
		--cgroup-manager=systemd config > crio.conf
}

package() {
	cd "$srcdir/go/src/github.com/kubernetes-incubator/cri-o"

	make install install.systemd PREFIX="$pkgdir/usr"

	# fix-up paths pointing to /usr/local to /usr
	sed -i --follow-symlinks -re 's|/usr/local|/usr|g' $pkgdir/usr/lib/systemd/system/*.service

	# install configs
	install -dm755 $pkgdir/etc/crio/
	install -Dm644 crio.conf $pkgdir/etc/crio/crio.conf
	install -Dm644 seccomp.json $pkgdir/etc/crio/seccomp.json
}
