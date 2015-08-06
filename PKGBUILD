# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=serve2d
pkgver=0.2
pkgrel=1
pkgdesc="A protocol detecting server, based off the serve2 library"
url="https://github.com/joushou/serve2d"
license=("MIT")
makedepends=("go")
conflicts=("serve2d-git")
source=("https://github.com/joushou/serve2d/archive/v${pkgver}.tar.gz"
		"git://github.com/joushou/serve2"
		"serve2d@.service")
sha256sums=('54cee701765a2508f2eb553753361f59d5275f3695a149e1cc9ab8119fb9ca58'
            'SKIP'
            'f098dd9b71d21623df02da180fc841b4d9923add17bb1472c732541f3d3c99dc')
arch=("i686" "x86_64")

prepare() {
	mkdir -p ${srcdir}/root/src/github.com/joushou
	ln -fs ${srcdir}/serve2 ${srcdir}/root/src/github.com/joushou
	ln -fs ${srcdir}/serve2d-${pkgver} ${srcdir}/root/src/github.com/joushou
}

build() {
	cd ${srcdir}/root
	export GOPATH=${GOPATH}:${srcdir}/root
	go build github.com/joushou/serve2d-${pkgver}
}

package() {
	mkdir -p ${pkgdir}/etc/serve2d
	install -Dm755 "root/serve2d-${pkgver}" "${pkgdir}/usr/bin/serve2d"
	install -Dm644 "root/src/github.com/joushou/serve2d-${pkgver}/example_conf.json" "${pkgdir}/etc/serve2d/"
	install -Dm644 "${srcdir}/serve2d@.service" "${pkgdir}/usr/lib/systemd/system/serve2d@.service"
}
