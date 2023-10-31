# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Ian D. Scott <ian@perebruin.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>

pkgname=dantalian-git
_pkgname=dantalian
pkgver=78f4cb9
pkgrel=1
pkgdesc="Transparent tag-based file organization system."
arch=('any')
url="http://darkfeline.github.io/dantalian/"
license=('mit')
depends=('python' 'git')
conflicts=("${_pkgname}")
optdepends=('fuse: additional features')
makedepends=('python-sphinx')
source=("git+https://github.com/darkfeline/${_pkgname}.git")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${_gitname}"
	git describe --always | sed 's|-|,|g'
}

build()
{
	cd "${srcdir}/${_pkgname}/doc"
	make man singlehtml
}

package()
{
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}/"

	# license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# man page
	mkdir -p "${pkgdir}/usr/share/man/man1/"
	install -Dm644 doc/_build/man/* "${pkgdir}/usr/share/man/man1/"

	# html documentation
	install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -R doc/_build/singlehtml/* "${pkgdir}/usr/share/doc/${_pkgname}"
}
