# Maintainer: Pavle <xpio at tut.by>
pkgname=klooni1010-git
pkgver=0.8.6.r5.gec0b9dd
pkgrel=1
pkgdesc="Puzzle game based on the original 1010!"
arch=('any')
url="https://lonamiwebs.github.io/klooni"
license=('GPL-3.0-or-later')
depends=('jre8-openjdk')
makedepends=('git' 'gendesk' 'jdk8-openjdk')
provides=('klooni1010')
conflicts=('klooni1010')
source=('git+https://github.com/LonamiWebs/Klooni1010')
md5sums=('SKIP')

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
  _jarname=$(basename desktop/build/libs/desktop-*.jar)
  mkdir -p "$pkgdir/usr/share/java/klooni1010" "$pkgdir/usr/bin"
  install -m644 desktop/build/libs/$_jarname "$pkgdir/usr/share/java/klooni1010"
  # shell script
  echo -e "#!/bin/sh\ncd\nexec /usr/lib/jvm/java-8-openjdk/jre/bin/java -jar /usr/share/java/klooni1010/$_jarname \"\$@\"" > "$pkgdir/usr/bin/klooni1010"
  chmod 755 "$pkgdir/usr/bin/klooni1010"
  # .desktop file
  install -Dm644 "../klooni1010.desktop" "$pkgdir/usr/share/applications/klooni1010.desktop"
  install -Dm644 "android/assets/ic_launcher/icon128.png" "$pkgdir/usr/share/pixmaps/klooni1010.png"
}

# vim:set ts=2 sw=2 et:
