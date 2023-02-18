# Maintainer: Aurelien Cedeyn <aurelien.cedeyn@gmail.com>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname="clustershell"
pkgver=1.9.1
pkgrel=1
pkgdesc="Python framework for efficient cluster administration"
arch=(any)
url="http://cea-hpc.github.io/clustershell/"
license=('LGPL')
groups=()
depends=('python')
makedepends=('python' 'python-setuptools')
optdepends=('openssh: Secure SHell client to connect to distant machines', 'vim: Vi Improved')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=ChangeLog
source=(https://github.com/cea-hpc/${pkgname}/archive/v${pkgver}.tar.gz)
noextract=()
sha256sums=('f2e206d20012767b4d8405909bde1494820b7ae70e33c8736a2425f1d9357b92')

build() {
	echo "Directory: ${srcdir}/${pkgname}-${pkgver}"
	cd ${srcdir}/${pkgname}-${pkgver}
	python setup.py build
}
package(){
	cd ${srcdir}/${pkgname}-${pkgver}
	python setup.py install -O1 --skip-build --root="${pkgdir}"
	# config files
	install -d ${pkgdir}/etc/clustershell
	install -p -m 0644 conf/*.conf ${pkgdir}/etc/${pkgname}/

	# man pages
	install -d ${pkgdir}/usr/share/man/{man1,man5}
	install -p -m 0644 doc/man/man1/clubak.1 ${pkgdir}/usr/share/man/man1/
	install -p -m 0644 doc/man/man1/clush.1 ${pkgdir}/usr/share/man/man1/
	install -p -m 0644 doc/man/man1/nodeset.1 ${pkgdir}/usr/share/man/man1/
	install -p -m 0644 doc/man/man5/clush.conf.5 ${pkgdir}/usr/share/man/man5/
	install -p -m 0644 doc/man/man5/groups.conf.5 ${pkgdir}/usr/share/man/man5/
	install -D -m 0644 COPYING.LGPLv2.1 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	local vimdatadir=/usr/share/vim/vimfiles
	cd ${srcdir}/${pkgbase}-${pkgver}
	# vim addons
	install -d ${pkgdir}/$vimdatadir/{ftdetect,syntax}
	install -p -m 0644 doc/extras/vim/ftdetect/clustershell.vim ${pkgdir}/${vimdatadir}/ftdetect/
	install -p -m 0644 doc/extras/vim/syntax/clushconf.vim ${pkgdir}/${vimdatadir}/syntax/
	install -p -m 0644 doc/extras/vim/syntax/groupsconf.vim ${pkgdir}/${vimdatadir}/syntax/
}
