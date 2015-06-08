# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=mkscaladocset-hg
_pkgname="mkScalaDocset"
pkgver=17.4db14a8f5bb0
pkgrel=1
pkgdesc="mkScalaDocset is a script and accompanying Scala code to build documentation sets for the Dash documentation browser from documentation that has been produced by ScalaDoc."
arch=("any")
url="https://bitbucket.org/inkytonik/mkscaladocset"
license=('Unkown')
makedepends=('mercurial' 'make')
depends=('sh' 'scala')
source=("${pkgname}"::'hg+https://bitbucket.org/inkytonik/mkscaladocset')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    hg log -r . --template '{latesttagdistance}.{node|short}\n'
}

build() {
    cd "$srcdir/$pkgname"
    make
    sed -i 's!^.*/target$!CLASSPATH=/usr/share/mkScalaDocset!' "${_pkgname}"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"
    cd target
    find . -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/${_pkgname}/{}" \;
    install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
