# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgbase=freedoko-git
pkgname=('freedoko-git' 'freedoko-docs-git')
pkgver=0.7.16.r246.gea34e6f2
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (git version)"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
#depends=('gtkmm3' 'gnet' 'freealut')
depends=('gtkmm3' 'freealut') # network currently disabled upstream
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "freedoko-git-archlinux.patch")
sha256sums=('SKIP'
            '4d98598cc9b503583d3521342e94959ff73a5f13398326728bfa0004acf8a0f6')

pkgver() {
  cd FreeDoko
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd FreeDoko

  patch -p1 -i ../freedoko-git-archlinux.patch
  find manual -type f -exec chmod 644 {} \;
}

build() {
  cd FreeDoko

  make compile
  make documentation
}

package_freedoko-git() {
  optdepends=('freedoko-docs-git: HTML manual')
  conflicts=('freedoko')
  provides=('freedoko')

  cd FreeDoko

  make DESTDIR="$pkgdir" install
  install -Dm644 bin/FreeDoko.desktop "$pkgdir"/usr/share/applications/freedoko.desktop
  rm "$pkgdir"/usr/share/doc/freedoko/{de/Windows.txt,de/SuSE,en/Windows,hpux*}
}

package_freedoko-docs-git() {
  pkgdesc="HTML manual for FreeDoko (git version)"
  arch=('any')
  depends=()
  conflicts=('freedoko-docs')
  provides=('freedoko-docs')

  cd FreeDoko

  install -d "$pkgdir"/usr/share/doc/freedoko
  tar -c --exclude={*.sh,Makefile} manual | tar -x -C "$pkgdir"/usr/share/doc/freedoko
}
