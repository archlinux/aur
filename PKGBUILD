# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=ottomatic
pkgver=4.0.1
pkgrel=3
pkgdesc='Save Earth from the clutches of The Giant Brain from Planet X'
arch=(x86_64 aarch64)
url='https://github.com/jorio/ottomatic'
license=(CC-BY-NC-SA-4.0)
depends=(
  sh
  sdl2-compat
  glibc
  libgcc
  libstdc++
  libglvnd
  glu
  hicolor-icon-theme
)

makedepends=(git cmake)
source=(
  "$pkgname::git+$url.git#tag=$pkgver"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  "$pkgname.desktop"
  "$pkgname.sh"
)
b2sums=('4516ac177cf1bf53af369ad68d126e41c8ecb7f5372605603fca155402f8bc36904e3208b9bd52af86682fa60bfd45ec6aded36902f4a6e8eb34a2b579698ecd'
        'SKIP'
        'b3452a8f143877ab688212ca9bfe4cdcd174667298fedd7cdcba4d7b4a1c49bf86bca0e456bcd2c64039cc322c540a583f9ff2e820e3ef38c0ef15984c348ae8'
        '6b1657ade2b992fdd190daedd861e2579abfe6e1d6adfe5a77cbced22571363167a23088fd76acd5b0b9da7cb771d5712f64ce7c2f76f19b59818ff7cf272cac')

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.Pomme.url "$srcdir/github.com-jorio-Pomme"
  git -c protocol.file.allow=always submodule update

  # ftbfs: gcc 13 & cstdint headers
  cd extern/Pomme
  git cherry-pick --no-commit d57c28e205462e51063e787f9ebddaadff592f1e
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
  mv -v build/{Data,OttoMatic} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -vDm644 packaging/io.jor.ottomatic.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
  rm -vf "$pkgdir/usr/share/doc/$pkgname/LICENSE.md"
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
  sed -e "s/@PROJECT_VERSION@/$pkgver/" packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$pkgname/README"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
