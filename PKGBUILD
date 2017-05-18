# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Pavle <xpio at tut.by>
pkgname=klooni1010-git
pkgver=0.6.r0.g583284f
pkgrel=1
pkgdesc="Puzzle game based on the original 1010!"
arch=('any')
url="https://lonamiwebs.github.io/klooni"
license=('MIT')
groups=()
depends=('bash' 'java-environment')
makedepends=('jdk8-openjdk' 'git' 'gendesk')
provides=('klooni1010')
conflicts=('klooni1010')
source=('git://github.com/LonamiWebs/Klooni1010'
        'https://raw.githubusercontent.com/LonamiWebs/Klooni1010/master/LICENSE.md')
md5sums=('SKIP'
         '9f012822c5b039f34a21b07ae1e2a038')

_gitname='Klooni1010'


pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  gendesk -f -n --categories "Game"
}

build() {
  cd "$srcdir/$_gitname"
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ./gradlew desktop:dist
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/java/klooni1010" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses"
  install -m644 desktop/build/libs/desktop-0.6.jar "$pkgdir/usr/share/java/klooni1010"
  # shell script
  echo -e '#!/bin/sh\ncd\nexec /usr/bin/java -jar /usr/share/java/klooni1010/desktop-0.6.jar "$@"' > "$pkgdir/usr/bin/klooni1010"
  chmod 755 "$pkgdir/usr/bin/klooni1010"
  # .desktop file
  install -Dm644 "../klooni1010.desktop" "$pkgdir/usr/share/applications/klooni1010.desktop"
  install -Dm644 "android/assets/ic_launcher/icon128.png" "$pkgdir/usr/share/pixmaps/klooni1010.png"
  # license
  install -Dm644 "../LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
