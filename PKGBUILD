# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='tinyssh'
pkgver='20150501'
pkgrel='1'
pkgdesc='Small SSH server using NaCl / TweetNaCl'
url='http://tinyssh.org'
arch=('x86_64' 'i686' 'arm')
license=('Public Domain')
install='tinyssh.install'
source=("http://mojzis.com/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	tinyssh@.socket tinyssh@.service tinysshgenkeys.service)
sha512sums=('780e4aa87fc5afbd0818f1c815c0e95a9ec5b096efedbc49d54492195725bbdf3fe860cc4b84a5e9b15b9b568fd0398e48601da3af22b3dfd64e4214d4797fbe'
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
