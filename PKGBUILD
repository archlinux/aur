# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='tinyssh'
pkgver='20150301'
pkgrel='4'
pkgdesc='Small SSH server using NaCl / TweetNaCl'
url='http://tinyssh.org'
arch=('x86_64' 'i686' 'arm')
license=('Public Domain')
install='tinyssh.install'
source=("http://mojzis.com/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	tinyssh@.socket tinyssh@.service tinysshgenkeys.service)
sha512sums=('6d9e4cbd2f93ce98a8fa619fe12db0456a39b23c6663500422aa710abca9a342ab18e9133527fa24353549f61b0ec01d903f15d181c90988b9c6bf429bf981b2'
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

	install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m 644 -t "${pkgdir}/usr/lib/systemd/system" \
		"${srcdir}/tinysshgenkeys.service" \
		"${srcdir}/tinyssh@.service" \
		"${srcdir}/tinyssh@.socket"
}
