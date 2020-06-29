_pkgname=cri-o
pkgname=cri-o-git
pkgver=20200629
pkgrel=1
pkgdesc='Open Container Initiative-based implementation of Kubernetes Container Runtime Interface'
arch=(x86_64 aarch64)
url='https://github.com/cri-o/cri-o'
license=(Apache)
provides=('cri-o')
conflicts=('cri-o')
makedepends=(go go-md2man ostree git)
depends=(conmon cni-plugins runc skopeo)
backup=('etc/crio/crio.conf' 'etc/crictl.yaml')
source=("${_pkgname}::git+https://github.com/cri-o/cri-o")
sha256sums=('SKIP')

prepare() {
	mkdir -p $srcdir/go/src/github.com/cri-o
	ln -sf "$srcdir/$_pkgname" "$srcdir/go/src/github.com/cri-o/cri-o"
	cd $srcdir/$_pkgname && git pull origin master
}

build() {
	cd "$srcdir/go/src/github.com/cri-o/cri-o"

	sed -i 's/$(GO) build -i/$(GO) build/' Makefile

	export GOPATH="${srcdir}/go" PATH="${srcdir}/go/bin:${PATH}"

	make

	# Default config is based on paths in already published packages
	./bin/crio --selinux=false \
		--storage-driver=overlay \
		--conmon /usr/bin/conmon \
		--cni-plugin-dir /usr/lib/cni \
		--cgroup-manager=systemd config > crio.conf
}

package() {
	cd "${srcdir}/go/src/github.com/cri-o/cri-o"

	export GOPATH="${srcdir}/go"
	make install.systemd PREFIX="${pkgdir}/usr"
	make install DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# fix-up paths pointing to /usr/local to /usr
	sed -i --follow-symlinks -re 's|/usr/local|/usr|g' "${pkgdir}/usr/lib/systemd/system/"*.service

	# install configs
	install -dm755 "${pkgdir}/etc/crio/"
	install -Dm644 "crio.conf" "${pkgdir}/etc/crio/crio.conf"
}
