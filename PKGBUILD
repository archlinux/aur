# $Id$
# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=adriconf-git
pkgver=v2.5.1.r0.g9a08fc0
pkgrel=1
pkgdesc="Graphical configuration tool for the Direct Rendering Infrastructure"
arch=('any')
url="https://github.com/jlHertel/adriconf"
license=('GPL')
depends=('gtk3' 'libxml++2.6' 'boost')
makedepends=('cmake' 'gtkmm3' 'git' 'gtest')
conflicts=('adriconf')
source=(git+https://gitlab.freedesktop.org/mesa/adriconf.git
	adriconf.desktop
	adriconf-icon.png)
sha256sums=('SKIP'
            '1d13c7efdb9aab23dd963c2ce2cbbb25b32039611e4b7b314684967d7432eea4'
            'd7354c488a3b8dd04d0758569a2268c631475fb07d38eb38e4f5afeea958a5ae')

pkgver() {
  cd adriconf
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd adriconf
}

build() {
  mkdir -p adriconf-build; cd adriconf-build
  cmake ../adriconf
  make
}

package() {
  cd adriconf-build/adriconf
  #make install
  install -d "$pkgdir"/usr/bin
  install -m755 adriconf "$pkgdir"/usr/bin

  install -d "$pkgdir"/usr/share/applications
  install "$srcdir"/adriconf.desktop "$pkgdir"/usr/share/applications

  install -d "$pkgdir"/usr/share/icons
  install "$srcdir"/adriconf-icon.png "$pkgdir"/usr/share/icons
}
