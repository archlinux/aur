# -*- mode: sh; -*-
# Maintainer: Tom Willemse <tom@ryuslash.org>

_python=python2
_name=DisPass

pkgname=$_python-dispass-git
pkgver=20140926
pkgrel=1
pkgdesc="Generate and disperse/dispell passwords"
depends=('python2')
makedepends=('python2-distribute' 'git')
optdepends=('tk: for gdispass')
arch=('any')
source=("git://github.com/babab/$_name.git")
url="http://dispass.babab.nl/"
license=("custom:ISC")
conflicts=(python2-dispass)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$_name"
    git log -1 --pretty=format:"%cd" --date=short | sed s/-//g
}

build() {
    cd "$srcdir"/"$_name"
    $_python setup.py build || return 1
}

package() {
    cd "$srcdir/$_name"
    $_python setup.py install --root="$pkgdir"

    install -Dm644 "${srcdir}/${_name}/skel/labelfile" \
        "${pkgdir}/etc/skel/.dispass/labels"
    install -Dm644 "${srcdir}/${_name}/dispass.1" \
        "${pkgdir}/usr/share/man/man1/dispass.1"
    install -Dm644 "${srcdir}/${_name}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_name}/README.rst" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -Dm644 "${srcdir}/${_name}/zsh/_dispass" \
        "${pkgdir}/usr/share/zsh/site-functions/_dispass"
}
