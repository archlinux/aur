# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=nanosaur2
pkgver=2.1.0
pkgrel=1
pkgdesc='Sequel to the original Nanosaur'
arch=('x86_64')
url='https://github.com/jorio/Nanosaur2'
license=('custom:CC-BY-NC-SA-4.0')
depends=(
  'glibc'
  'gcc-libs'
  'libglvnd'
  'sdl2'
  'hicolor-icon-theme'
)
makedepends=('git' 'cmake')
_commit='3739005d3a505f6072b6b4e5b2d1874a4bd34acb'
source=(
  "$pkgname::git+https://github.com/jorio/Nanosaur2.git#commit=$_commit"
  'git+https://github.com/jorio/Pomme.git'
  "$pkgname.desktop"
  "$pkgname.sh"
)
sha512sums=('SKIP'
            'SKIP'
            '1ce25c64507b08c6ca9075a56a75f93efc19f1aa9e1e86fbe9f5967940aae438bc4839e4b47326fc8c0f3ba6211ceecff32982582bae9896c5ef05bcdf8ab410'
            '64f7eb3572774ad58608bf0de5e3a9994fe14ba6b2065225540f02e0b7f4ff5ff308d81a730970eaae97c17efc85904dc559ce4e84bc445b37a69e529ddc6696')
b2sums=('SKIP'
        'SKIP'
        'e41fd1bc5e7aa9af7f7bc5c13400f947c9837a54d716ea6cfcb1319a539ed20e7cc9775a6add851a6bc9670ebb34db2191576ebde240a49be23766e5274fe3f5'
        'cfa74a2b52b6b45a10c9f30e7f0bc4e81add9eab68aa9c83ba58737fdfb2dd881151ab72e2bfe87abd1a302fbfce5a813d0c3c77781e6c164049d6bb3c7ab549')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.Pomme.url ../Pomme
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake \
    -S "$pkgname" \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build build
}

package() {
  # binary & assets
  install -dv "$pkgdir/usr/lib/$pkgname"
  cp -vr build/{Data,Nanosaur2} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 \
    -t "$pkgdir/usr/share/applications" \
    "$pkgname.desktop"
  install -vDm644 \
    "$pkgname/packaging/nanosaur2-desktopicon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  cd "$pkgname"

  # documentation
  install -vDm644 \
    -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,README,SECRETS}.md screenshot.webp
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
  sed -e "s/@PROJECT_VERSION@/$pkgver/" \
    packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$pkgname/ReadMe.txt"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
