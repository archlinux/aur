# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=snestracker
pkgver=0.2.4
pkgrel=1
pkgdesc='Full-featured music production software for the Super Nintendo Entertainment System'
arch=('x86_64')
url='https://github.com/bazz1tv/snestracker'
license=('GPL3')
depends=(
  'alsa-lib'
  'boost-libs'
  'gtk3'
  'sdl2'
)
makedepends=('git' 'cmake' 'boost' 'gendesk')
options=('!buildflags')
_commit='d463d383026911a6c8c5106f154d81f3bdf9fdb5'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'github.com-bazzinotti-libgme_m::git+https://github.com/bazzinotti/libgme_m'
  'github.com-bazzinotti-wla-dx::git+https://github.com/bazzinotti/wla-dx'
  'github.com-bazzinotti-pcx2snes::git+https://github.com/bazzinotti/pcx2snes'
  'fix-ftbfs-sort.patch'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '4885950a7ba3e8bc3260360553c6fd27b4b9987c808e5c9236e62ca52b38d500f389b24bfa13a255514fd2881af9e61713f2d6a7b0e88f3e0509e7cf96cb4ea3')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # prepare git submodules
  git submodule init
  git config submodule.submodules/libgme_m.url "$srcdir/github.com-bazzinotti-libgme_m"
  git config submodule.submodules/wla-dx.url "$srcdir/github.com-bazzinotti-wla-dx"
  git config submodule.submodules/pcx2snes.url "$srcdir/github.com-bazzinotti-pcx2snes"
  git submodule update

  # use GTK3 instead of GTK2
  sed -e 's/gtk+-2.0/gtk+-3.0/g' -i pc/Makefile

  # fix FTBFS - sort algorithm
  patch -p1 -i "$srcdir/fix-ftbfs-sort.patch"

  # generate desktop file
  gendesk -n \
    --exec "$pkgname" \
    --name "$pkgname" \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --icon "$pkgname" \
    --genericname "SNES Tracker"
}

build() {
  cd "$pkgname"

  # build wla-dx
  pushd submodules/wla-dx
  cmake -S . -B build-wla
  cmake --build build-wla
  popd

  # build pcx2snes
  make -C submodules/pcx2snes

  make
}

package() {
  cd "$pkgname"

  # create required directories
  install -vd "$pkgdir/usr/lib/snestracker" "$pkgdir/usr/bin"
  cp -vr pc/bin/* "$pkgdir/usr/lib/snestracker"
  ln -s /usr/lib/snestracker/snestracker "$pkgdir/usr/bin/snestracker"

  # desktop file
  install -vDm644 -t "$pkgdir/usr/share/applications" snestracker.desktop

  # application icons
  for i in 128 256 512 1024; do
    install -vDm644 \
      "pc/st-icons-png/${i}-stroked.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
}
