# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bugdom2
pkgver=4.0.0
pkgrel=1
pkgdesc='Sequel to the original Bugdom'
arch=('x86_64')
url='https://github.com/jorio/Bugdom2'
license=('custom:CC-BY-NC-SA-4.0')
depends=(
  'glibc'
  'gcc-libs'
  'libglvnd'
  'sdl2'
  'glu'
  'hicolor-icon-theme'
)
makedepends=('cmake' 'git')
_commit='4050d6f97bf5d8b7ac9e91b1b7d4eacf3a4af87c'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  'wrapper.sh'
)
b2sums=('SKIP'
        'SKIP'
        '8c38b79234c0726f24411c622269a123a3a68519064b69dec3f9d859aafbd9d8fd96475ef06404ccde6a5162da2aa186183c28670e00f8a5f7d144c4f0ae440d')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.Pomme.url "$srcdir/github.com-jorio-Pomme"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  cmake \
    -S . \
    -B build \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -W no-dev

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
