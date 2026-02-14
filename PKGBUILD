# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=billy-frontier
pkgver=1.1.1
pkgrel=1
pkgdesc='An arcade action game with a "cowboys in space" theme'
arch=(x86_64 aarch64)
url='https://github.com/jorio/BillyFrontier'
license=(CC-BY-NC-SA-4.0)
depends=(
  sh
  sdl2-compat
  glibc
  libgcc
  libstdc++
  libglvnd
  hicolor-icon-theme
)
makedepends=(cmake git)
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  wrapper.sh
)
b2sums=('2cc29582bc97cad2c8a9d5e3b067a93c1334b533b7ff136efb830c67dca3c5a6a2dab07676f2b32bf52ef618f0481e5e174f131b19419a5198b95d7296b00340'
        'SKIP'
        '5e869bf7f7d0fcf646ae1652b71d032f28e7aac1edc62f0c99aa6285983500ba5f8f95d4d0f6af54b4d892edbd791a8fc7b5819c2f3877e1626ea46027ce20f0')

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.extern/Pomme.url "$srcdir/github.com-jorio-Pomme"
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
  mv -v build/{Data,BillyFrontier} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$srcdir/wrapper.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop files
  install -vDm644 -t "$pkgdir/usr/share/applications" packaging/io.jor.billyfrontier.png
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/512/apps" packaging/io.jor.billyfrontier.png
  install -vDm644 -t "$pkgdir/usr/share/metainfo" packaging/io.jor.billyfrontier.appdata.xml

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.md README.md Instructions.pdf
  sed -e "s/@PROJECT_VERSION@/$pkgver/" packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$pkgname/README"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
