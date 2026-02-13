# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bugdom2
pkgver=4.0.0
pkgrel=2
pkgdesc='Sequel to the original Bugdom'
arch=(x86_64)
url='https://github.com/jorio/Bugdom2'
license=(CC-BY-NC-SA-4.0)
depends=(
  sh
  glibc
  libgcc
  libstdc++
  libglvnd
  sdl2-compat
  glu
  hicolor-icon-theme
)
makedepends=(cmake git)
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  wrapper.sh
)
b2sums=('ea8a0adc085b4bd10f258308be3b2a193f9f0a737c976147a44e0bb91892faff20625f7dc290e5c4038060739d79faab3ea5a21d59f06cd8879d3a14fc6390ca'
        'SKIP'
        'd4754dfe099330afddfc9d213ba581276924ca4efe0c15043d25c5881b9b5d34c99ffcce5062d62a1044b858ecf52d6bfde0bae6f76c0a425855ca1e3590061c')

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.Pomme.url "$srcdir/github.com-jorio-Pomme"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  local cmake_options=(
    -B build
    -S .
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

package() {
  cd "$pkgname"

  # move binary & assets
  install -vd "$pkgdir/usr/lib/$pkgname"
  mv -v build/{Data,Bugdom2} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/wrapper.sh" "$pkgdir/usr/bin/Bugdom2"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" packaging/io.jor.bugdom2.desktop
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/512x512/apps" packaging/io.jor.bugdom2.png

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -vr Instructions "$pkgdir/usr/share/doc/$pkgname"
  rm -vf "$pkgdir/usr/share/doc/$pkgname/LICENSE.md"
  sed -e "s/@PROJECT_VERSION@/$pkgver/" packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$pkgname/ReadMe.txt"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
