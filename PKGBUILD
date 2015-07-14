# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=esperanza-git
pkgver=r402.1b81dc2
pkgrel=1
pkgdesc="Esperanza is a XMMS2 client written in C++/Qt4 and aims to be fully featured and easy to use"
arch=('i686' 'x86_64')
url="https://xmms2.org/wiki/Client:Esperanza"
license=('GPL')
groups=('xmms2')
depends=('xmms2' 'qt4')
makedepends=('boost' 'git')
provides=('esperanza')
conflicts=('esperanza')
replaces=('esperanza')
source=($pkgname::'git+git://git.xmms2.org/xmms2/esperanza.git'
        'esperanza.desktop'
        'esperanza-DSO.patch')
md5sums=('SKIP'
         '5ae5e46cc596c20f3bf0dbffe9ebef8e'
         '45733bfd31298fed60ec5181e76cd27f')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    # apply DSO patch
    patch -p1 -i ../esperanza-DSO.patch

    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "$srcdir/$pkgname"
    make INSTALL_ROOT="$pkgdir/" install

    install -D -m 644 "$startdir/esperanza.desktop" ${pkgdir}/usr/share/applications/esperanza.desktop
    install -D -m 644 "$srcdir/$pkgname/data/images/esperanza.png" ${pkgdir}/usr/share/icons/hicolor/128x128/apps/esperanza.png
}
