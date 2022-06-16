# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.7.39
pkgrel=1
pkgdesc='Original Xbox Emulator'
arch=('x86_64')
url='https://xemu.app'
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
  'python-yaml'
  'samurai'
  'xxhash'
  'tomlplusplus'
)
optdepends=(
  'fancy-mouse-boot-rom: first-stage xbox bootrom'
)
_commit='3a6907b0eab6b5856dbe9f3f8c46fb77c7d6945c'
source=(
  "$pkgname::git+https://github.com/mborgerson/xemu.git#commit=$_commit"
  'gitlab.com-qemu-project-berkeley-testfloat-3::git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git'
  'gitlab.com-qemu-project-berkeley-softfloat-3::git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git'
  'github.com-ocornut-imgui::git+https://github.com/ocornut/imgui.git'
  'github.com-epezent-implot::git+https://github.com/epezent/implot.git'
  'gitlab.com-qemu-project-keycodemapdb::git+https://gitlab.com/qemu-project/keycodemapdb.git'
  'github.com-mborgerson-genconfig::git+https://github.com/mborgerson/genconfig.git'
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//'
}

prepare() {
  cd "$pkgname"

  # manage git submodules
  git submodule init \
    tests/fp/berkeley-testfloat-3 \
    tests/fp/berkeley-softfloat-3 \
    ui/thirdparty/imgui \
    ui/thirdparty/implot \
    ui/keycodemapdb \
    genconfig

  git config submodule.tests/fp/berkeley-testfloat-3.url "$srcdir/gitlab.com-qemu-project-berkeley-testfloat-3"
  git config submodule.tests/fp/berkeley-softfloat-3.url "$srcdir/gitlab.com-qemu-project-berkeley-softfloat-3"
  git config submodule.ui/thirdparty/imgui.url "$srcdir/github.com-ocornut-imgui"
  git config submodule.ui/thirdparty/implot.url "$srcdir/github.com-epezent-implot"
  git config submodule.ui/keycodemapdb.url "$srcdir/gitlab.com-qemu-project-keycodemapdb"
  git config submodule.genconfig.url "$srcdir/github.com-mborgerson-genconfig"

  git submodule update

  # generate license file
  python scripts/gen-license.py > XEMU_LICENSE

  # use system xxhash
  sed -i 's/"util\/xxHash\/xxh3\.h"/<xxh3.h>/' util/fast-hash.c

  # use system tomlplusplus
  sed -i 's/<toml\.hpp>/<toml++\/toml.h>/' genconfig/cnode.h toml.cpp ui/xemu-settings.cc

  # patch build info
  sed \
    -i scripts/xemu-version.sh \
    -e 's/\$XEMU_BRANCH/master/'
}

build() {
  cd "$pkgname"

  ./configure \
    --audio-drv-list="sdl" \
    --disable-debug-info \
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
