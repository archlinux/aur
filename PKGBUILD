# Maintainer: Adrian Perez <aperez@igalia.com>
# Co-Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname='tinyssh'
pkgver='20160727'
pkgrel='1'
pkgdesc='Small SSH server using NaCl / TweetNaCl'
url='http://tinyssh.org'
arch=('x86_64' 'i686' 'arm' 'armv6h')
license=('Public Domain')
makedepends=('gcc' 'make')
install='tinyssh.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/janmojzis/${pkgname}/archive/${pkgver}.tar.gz"
	tinyssh@.socket tinyssh@.service tinysshgenkeys.service)
sha512sums=('ca248975fc0d2813d5a940d4a454bbd7491eb0daeb6ecedc164af6128c2424f7db372838d9aa2c07aaae7e17abc48d83ca33e5f2f54ac18486bb254d3a6d1112'
            '9fbc5ae3b6d1df6d78eedf812fdd8fe115e81fc0811f4799d541e37239d53db22203e691026ed479a38c9f17043e52d43b44054be51ae03c2f12f3f235c5b83a'
            '9c9ba78c5b61f64f42f59cfe556519d9ab2c3e4d45f36d6f78c5e7728b050c494673239630dae66398006f3f20fb3a26f22899cd0728ed17e61c655b372236b3'
            '415cdfe649eedcbb11a263938c0a66bef42432210baa2e2c9e428d5e8e486fb4dedad53b9fdb9086bf97ca506909d3b3054aaca56f02c063e0b8d5fab4e56198')

build () {
	cd "${srcdir}/${pkgname}-${pkgver//./}"
	make
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver//./}"
	make install DESTDIR="${pkgdir}"

	# Nowadays /usr/sbin is a symlink to /usr/bin
	mv "${pkgdir}"/usr/{s,}bin

        install -m 755 -d ${pkgdir}/etc/tinyssh

        install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m 644 -t "${pkgdir}/usr/lib/systemd/system" \
		"${srcdir}/tinysshgenkeys.service" \
		"${srcdir}/tinyssh@.service" \
		"${srcdir}/tinyssh@.socket"
}
