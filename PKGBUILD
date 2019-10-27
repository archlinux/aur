# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=chestnut-git
_pkgname=chestnut
pkgver=v0.1.0.r5.geaae54b
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="An open-source NLE video editor; fork of Olive-Editor"
url="https://github.com/jonno85uk/chestnut"
license=('GPL3')
depends=('ffmpeg' 'qt5-multimedia' 'qt5-svg')
makedepends=('git')
optdepends=('olive-community-effects-git')
source=("$_pkgname::git+https://github.com/jonno85uk/chestnut.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  qmake CONFIG+=release PREFIX=/usr
  make

  cd "$srcdir/$_pkgname/packaging/appimage/"
  sed -n '/Desktop/,/AudioVideo/p' chestnut.yml | sed 's/\ \ -\ //g' > \
         chestnut.desktop
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm 644 "$srcdir/$_pkgname/packaging/appimage/chestnut.desktop" \
                  "$pkgdir/usr/share/applications/chestnut.desktop"

  install -Dm 644 "$srcdir/$_pkgname/app/icons/chestnut.png" \
                  "$pkgdir/usr/share/pixmaps/chestnut.png"
}
