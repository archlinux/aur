# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=raccoon
pkgname=$_pkgname-git
pkgver=20171006.r145.9081f22
pkgrel=1
arch=('any')
pkgdesc='Google Play desktop client'
url='http://www.onyxbits.de/raccoon'
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('java-environment' 'git')
source=('git+https://github.com/onyxbits/raccoon4.git' "$_pkgname.desktop")
sha512sums=('SKIP' '37184cacd44f28fb8866fa9fd7c4b6f415462f4715deacecf45f831c2a17d1c2d79e97cfc620d5d6d54735404e7780a77d8d97ae2d84446364f0e318eda61202')

pkgver() {
  cd raccoon4

  printf "%s.r%s.%s" \
    "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd raccoon4
  unset _JAVA_OPTIONS
  GRADLE_USER_HOME="$srcdir" ./gradlew -Pversion="$pkgver" launch4j
}

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 raccoon4/icon.ico "$pkgdir/usr/share/pixmaps/$_pkgname.ico"
  install -Dm644 raccoon4/build/launch4j/lib/Raccoon-desktop-$pkgver.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
  install -d "$pkgdir/usr/bin"

  printf '%s\n\n%s\n%s\n' \
    '#!/usr/bin/env bash' \
    'unset _JAVA_OPTIONS' \
    'java -jar -Draccoon.home="$HOME/.config/Raccoon" -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel /usr/share/'"$_pkgname"'/'"$_pkgname"'.jar "$@"' \
      > "$pkgdir/usr/bin/$_pkgname"

  chmod 755 "$pkgdir/usr/bin/$_pkgname"
}
