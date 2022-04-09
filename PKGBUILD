# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.6.2.r90.g6f507c80af
pkgrel=1
pkgdesc="Original Xbox Emulator"
arch=('x86_64')
url="https://xemu.app"
license=('GPL2')
depends=(
  'sdl2'
  'libsamplerate'
  'gtk3'
  'libslirp'
)
makedepends=(
  'git'
  'glib2'
  'glu'
  'libepoxy'
  'libpcap'
  'meson'
  'openssl'
  'pixman'
  'python'
  'samurai'
  'xxhash'
)
optdepends=(
  'fancy-mouse-boot-rom: first-stage xbox bootrom'
)
_commit='6f507c80af546e0f5d316622d20f78820423ce6e'
source=(
  "$pkgname::git+https://github.com/mborgerson/xemu.git#commit=$_commit"
  'berkeley-softfloat-3::git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git'
  'berkeley-testfloat-3::git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git'
  'imgui::git+https://github.com/ocornut/imgui.git'
  'implot::git+https://github.com/epezent/implot.git'
  'keycodemapdb::git+https://gitlab.com/qemu-project/keycodemapdb.git'
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's:^gh-release/::' -e 's:-\(.*\)-:.r\1.:'
}

prepare() {
  cd "$pkgname"

  # manage git submodules
  git submodule init tests/fp/berkeley-{soft,test}float-3 ui/{imgui,implot,keycodemapdb}
  git config submodule.tests/fp/berkeley-softfloat-3.url ../berkeley-softfloat-3
  git config submodule.tests/fp/berkeley-testfloat-3.url ../berkeley-testfloat-3
  git config submodule.ui/imgui.url ../imgui
  git config submodule.ui/implot.url ../implot
  git config submodule.ui/keycodemapdb.url ../keycodemapdb
  git submodule update

  # generate license file
  python scripts/gen-license.py > XEMU_LICENSE

  # unbundle xxhash
  sed -i 's/"util\/xxHash\/xxh3\.h"/<xxh3.h>/' util/fast-hash.c

  # patch build info
  sed \
    -i scripts/xemu-version.sh \
    -e 's/\$XEMU_BRANCH/master/'
}

build() {
  cd "$pkgname"

  ./configure \
    --audio-drv-list="sdl" \
    --enable-slirp=system \
    --extra-cflags="-DXBOX=1" \
    --ninja=samu \
    --target-list=i386-softmmu \
    --with-git-submodules=ignore

  make qemu-system-i386
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 build/qemu-system-i386 "$pkgdir/usr/bin/$pkgname"

  # desktop files
  install -vDm644 -t "$pkgdir/usr/share/applications" ui/xemu.desktop
  for size in 24 32 48 256 512; do
    install -vDm644 "ui/icons/xemu_${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" ui/icons/xemu.svg

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" XEMU_LICENSE
}
