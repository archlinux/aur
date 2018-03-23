# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=cri-o
pkgver=1.9.10
pkgrel=1
pkgdesc='Open Container Initiative-based implementation of Kubernetes Container Runtime Interface'
arch=(i686 x86_64)
url='https://github.com/kubernetes-incubator/cri-o'
license=(Apache)
makedepends=(go go-md2man ostree)
backup=('etc/crio/crio.conf')
source=("git+https://github.com/kubernetes-incubator/cri-o")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"

	git checkout "v${pkgver}"

	install -m755 -d "${srcdir}/go/src/github.com/kubernetes-incubator"

	cp -a "${srcdir}/${pkgname}" \
		"${srcdir}/go/src/github.com/kubernetes-incubator/cri-o"
}

build() {
	cd "${srcdir}/go/src/github.com/kubernetes-incubator/cri-o"

	GOPATH="${srcdir}/go" make -j1
}

package() {
	cd "${srcdir}/go/src/github.com/kubernetes-incubator/cri-o"

	install -Dm755 bin/crio $pkgdir/usr/bin/crio
	install -Dm755 bin/conmon $pkgdir/usr/libexec/crio/conmon
	install -Dm755 bin/pause $pkgdir/usr/libexec/crio/pause

	# install configs
	install -dm755 $pkgdir/etc/crio/
	install -Dm644 crio.conf $pkgdir/etc/crio/crio.conf
	install -Dm644 seccomp.json $pkgdir/etc/crio/seccomp.json

	# install manpages
	install -d $pkgdir/usr/share/man/man5/
	install -d $pkgdir/usr/share/man/man8/
	install -pm644 docs/crio.conf.5 $pkgdir/usr/share/man/man5
	install -pm644 docs/crio.8 $pkgdir/usr/share/man/man8
}
