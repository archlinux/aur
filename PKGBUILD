# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=freemol-svn
pkgver=r158
pkgrel=1
pkgdesc="FreeMOL is an assembly of free and open source programs forming a framework for computational chemistry, informatics, structural biology and graphics"
arch=(x86_64 i686)
url="http://www.bioinformatics.org/freemol"
license=('custom')
_pythonver=2.7
depends=("python2>=${_pythonver}")
makedepends=('svn' 'gcc' 'patch')
source=("$pkgname::svn://bioinformatics.org/svnroot/freemol/trunk"
        "freemol.patch"
        "freemol.sh")
md5sums=('SKIP'
         'edd96be3ae195bdf622a59aacb9e8bbd'
         '878093e656397ff192b39dcc8b41231f')

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
    cd ${srcdir}/${pkgname}/src/mengine/src

    patch -Np0 -i ${srcdir}/freemol.patch
}

build() {
	cd ${srcdir}/${pkgname}/src/mengine/src

    make
}

package() {
	cd ${srcdir}/${pkgname}

    mkdir -p ${pkgdir}/usr/lib/python${_pythonver}/site-packages/freemol
    install -Dm755 src/mengine/src/mengine ${pkgdir}/usr/bin/mengine
    install -Dm644 freemol/libpy/freemol/__init__.py ${pkgdir}/usr/lib/python${_pythonver}/site-packages/freemol/__init__.py
    install -Dm644 freemol/libpy/freemol/mengine.py ${pkgdir}/usr/lib/python${_pythonver}/site-packages/freemol/mengine.py

    install -Dm644 ${srcdir}/freemol.sh ${pkgdir}/etc/profile.d/freemol.sh
}
