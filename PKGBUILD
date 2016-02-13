# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=serve2d-git
pkgver=2aabb2d
pkgrel=1
pkgdesc="A protocol detecting server, based off the serve2 library"
url="https://github.com/joushou/serve2d"
license=("MIT")
makedepends=("go")
source=("git://github.com/joushou/serve2d"
		"git://github.com/joushou/serve2"
		"serve2d@.service")
sha256sums=('SKIP'
            'SKIP'
            'f098dd9b71d21623df02da180fc841b4d9923add17bb1472c732541f3d3c99dc')
arch=("i686" "x86_64")

pkgver() {
	cd "${srcdir}/serve2d"
	git describe --always | sed 's/-/./g'
}

prepare() {
	mkdir -p ${srcdir}/root/src/github.com/joushou
	ln -fs ${srcdir}/serve2 ${srcdir}/root/src/github.com/joushou
	ln -fs ${srcdir}/serve2d ${srcdir}/root/src/github.com/joushou
}

build() {
	cd ${srcdir}/root
	export GOPATH="${srcdir}/root"
	go build github.com/joushou/serve2d
}

package() {
	mkdir -p ${pkgdir}/etc/serve2d
	install -Dm755 "root/serve2d" "${pkgdir}/usr/bin/serve2d"
	install -Dm644 "root/src/github.com/joushou/serve2d/example_conf.json" "${pkgdir}/etc/serve2d/"
	install -Dm644 "${srcdir}/serve2d@.service" "${pkgdir}/usr/lib/systemd/system/serve2d@.service"
}
