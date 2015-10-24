# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=serve2d
pkgver=0.3.1
pkgrel=1
pkgdesc='A protocol detecting server, based off the serve2 library'
url='https://github.com/joushou/serve2d'
license=('MIT')
makedepends=('go')
conflicts=("${pkgname}-git")
source=("https://github.com/joushou/serve2d/archive/v${pkgver}.tar.gz"
		"https://github.com/joushou/serve2/archive/v${pkgver}.zip"
		"serve2d@.service")
sha256sums=('c3873cfdd36bfe8122cbe0c220975b586716f32645b7c02c6edd4254003083b5'
            '6aa5dcb83aa6b165cf6e26b278eb48fedbaf4c2aaef2ab9c2991929e27d39d9c'
            'f098dd9b71d21623df02da180fc841b4d9923add17bb1472c732541f3d3c99dc')
arch=("i686" "x86_64")

prepare() {
	mkdir -p ${srcdir}/root/src/github.com/joushou
	ln -fs "${srcdir}/serve2-${pkgver}" "${srcdir}/root/src/github.com/joushou/serve2"
	ln -fs "${srcdir}/serve2d-${pkgver}" "${srcdir}/root/src/github.com/joushou/serve2d"
}

build() {
	cd "${srcdir}/root"
	export GOPATH="${srcdir}/root"
	go build "github.com/joushou/serve2d"
}

package() {
	mkdir -p ${pkgdir}/etc/serve2d
	install -Dm755 "root/serve2d" "${pkgdir}/usr/bin/serve2d"
	install -Dm644 "root/src/github.com/joushou/serve2d/example_conf.json" "${pkgdir}/etc/serve2d/"
	install -Dm644 "${srcdir}/serve2d@.service" "${pkgdir}/usr/lib/systemd/system/serve2d@.service"
}
