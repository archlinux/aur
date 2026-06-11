# Prev Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=man-pages-ja
pkgver=20260515
pkgrel=1
pkgdesc="Man pages for Japanese"
arch=('any')
url="https://linuxjm.sourceforge.io"
license=('LicenseRef-man-pages-ja')
optdepends=('mandoc: makewhatis support')
makedepends=('perl')
conflicts=('man-pages-ja-git')
install="${pkgname}.install"
_url="https://github.com/linux-jm/manual"
source=("$_url/releases/download/v${pkgver}/man-pages-ja-${pkgver}.tar.gz"
        "copyright.html::https://linuxjm.sourceforge.io/copyright.html")
md5sums=('9c282cca5668310da47ead553b61fde2'
         '00000e85f561ecaf82803009e4daaa2f')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cp script/configure.perl script/configure.perl.org

    cat script/configure.perl.org                |
    sed '/until/i$ans = "y";'                    |
    sed "/usr[/]share[/]man[/]/s@/@${pkgdir}/@1" > script/configure.perl
    sed -i 's/$LANG/ja_JP.UTF-8/g' script/configure.perl
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    yes '' | make config
}

package() {
    mkdir -p ${pkgdir}/usr/share/man/ja_JP.UTF-8
    cd ${srcdir}/${pkgname}-${pkgver}
    make install
    install -Dm644 ${srcdir}/copyright.html "${pkgdir}/usr/share/licenses/${pkgname}/copyright.html"
}
