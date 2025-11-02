# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jack Random, <jack(at)random(dot)to>
# previous: csllbr; Popsch <popsch@gmx.net>
# Thanks to the maintainers and contributors of the mu binary package

_reponame=mu
pkgname=mu-git
pkgver=1.12.14.dev2.r7631
pkgrel=1
epoch=2
pkgdesc="mu and mu4e from git"
arch=(i686 x86_64)
url="http://www.djcbsoftware.nl/code/mu"
depends=(xapian-core gmime3 fmt)
makedepends=(git meson)
optdepends=('emacs: mu4e support' 'guile: to script in guile')
license=(GPL)
provides=(mu)
conflicts=(mu)
source=('git+https://github.com/djcb/mu.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_reponame}" || return 1
    _lastversion=$(awk '/  version:/ {print $2}' meson.build |
                       head -n1|tr -d \' | tr -d \, | tr - .)
    printf %s.r%s "${_lastversion}" "$(git rev-list --count HEAD)"
}

build() {
    cd "${srcdir}/${_reponame}" || return 1
    meson setup --prefix=/usr --buildtype=plain build 
    ninja -C build
}

package() {
    cd "${srcdir}/${_reponame}" || return 1
    DESTDIR="${pkgdir}" ninja -C build install
}
