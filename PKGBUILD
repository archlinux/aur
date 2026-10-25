# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# Credits:
#   qemu-ios (iPod touch 1G / N45AP emulation): Martijn de Vos (devos50) and
#     contributors, https://github.com/devos50/qemu-ios (GPL-2.0)
#   QEMU: the QEMU project, https://www.qemu.org
#   Launcher, QMP helper and packaging: https://github.com/eugenesflanagin-spec/ios-emu-linux (MIT)
# No Apple firmware is included or downloaded by this package.

pkgname=qemu-ios-ipod-git
_pkgname=qemu-ios
pkgver=6.2.50.r92578.g501c85c
pkgrel=1
pkgdesc='iPod touch 1st generation (iPhoneOS 1.0) emulator based on the qemu-ios QEMU fork (system files not included)'
arch=(x86_64)
url='https://github.com/devos50/qemu-ios'
# QEMU itself is GPL-2.0-only as a whole (see LICENSE point 1);
# the launcher, QMP helper and .desktop file are MIT.
license=(GPL-2.0-only MIT)
depends=(
  bash
  dtc
  glib2
  glibc
  hicolor-icon-theme
  libgcc
  libstdc++
  openssl
  pixman
  python
  sdl2-compat
  unzip
  zlib
)
makedepends=(
  git
  meson
  ninja
)
optdepends=('libnotify: desktop notice when the system files are missing')
provides=(qemu-ios-ipod)
conflicts=(qemu-ios-ipod)
# The proven build of this QEMU 6.2-era tree is without LTO.
options=(!lto !debug)
source=(
  "$_pkgname::git+https://github.com/devos50/qemu-ios.git#branch=ipod_touch_1g"
  'keycodemapdb::git+https://gitlab.com/qemu-project/keycodemapdb.git'
  'berkeley-softfloat-3::git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git'
  'berkeley-testfloat-3::git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git'
  0001-keymaps-use-shipped-files.patch
  ipod-touch-qemu
  ipod-input.py
  ipod-touch-qemu.desktop
  LICENSE.MIT
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e9e97c52fea8b29db84703f1d948174577ba4c042a11a932c798c1d30e4e6992'
            'c26faf39bba9ff2b77d96a9f6d1c517361c0ad9d5f1a037459d4d57985d61bd0'
            'c91f9cf1e1f860d3dddb29d6e465f5c487fa0150f9dad1d5e9b929b31043a7fa'
            '31ec52ccf02bf1c2521f1d15d6c035013d1d594ad0c01ca65a8f0e480f975719'
            '3c44a18225aa372bf686cdce8bf44615916a8450af76a409485726cf81037211')

_prefix=/opt/qemu-ios-ipod

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  local _sm
  for _sm in ui/keycodemapdb:keycodemapdb \
             tests/fp/berkeley-softfloat-3:berkeley-softfloat-3 \
             tests/fp/berkeley-testfloat-3:berkeley-testfloat-3; do
    git submodule init "${_sm%%:*}"
    git config "submodule.${_sm%%:*}.url" "$srcdir/${_sm#*:}"
    git -c protocol.file.allow=always submodule update "${_sm%%:*}"
  done

  # Copy the shipped keymaps instead of regenerating them with a system
  # qemu-keymap, which fails on current xkeyboard-config.
  patch -Np1 -i ../0001-keymaps-use-shipped-files.patch
}

build() {
  # This tree does not build with clang; force gcc even if CC is set globally.
  export CC=gcc CXX=g++

  mkdir -p "$_pkgname/build"
  cd "$_pkgname/build"
  ../configure \
    --prefix="$_prefix" \
    --cc=gcc --cxx=g++ --host-cc=gcc \
    --with-git-submodules=ignore \
    --without-default-features \
    --target-list=arm-softmmu \
    --enable-sdl \
    --enable-tcg \
    --enable-fdt=system \
    --enable-pie \
    --disable-capstone \
    --disable-slirp \
    --disable-cocoa \
    --disable-werror \
    --disable-blobs \
    --extra-cflags='-I/usr/include/openssl -Wno-error=int-conversion -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration' \
    --extra-ldflags='-lcrypto'
  make
}

package() {
  cd "$_pkgname"
  make -C build DESTDIR="$pkgdir" install

  # Launcher and QMP helper
  install -Dm755 ../ipod-touch-qemu "$pkgdir/usr/bin/ipod-touch-qemu"
  install -Dm755 ../ipod-input.py "$pkgdir$_prefix/libexec/ipod-input.py"
  ln -s "$_prefix/libexec/ipod-input.py" "$pkgdir/usr/bin/ipod-touch-qmp"

  # Menu entry and icon (the QEMU logo shipped in the source tree)
  install -Dm644 ../ipod-touch-qemu.desktop "$pkgdir/usr/share/applications/ipod-touch-qemu.desktop"
  local _s
  for _s in 16 24 32 48 64 128 256 512; do
    install -Dm644 "ui/icons/qemu_${_s}x${_s}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_s}x${_s}/apps/qemu-ios-ipod.png"
  done
  install -Dm644 ui/icons/qemu.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/qemu-ios-ipod.svg"

  # Drop the generic QEMU .desktop from the private prefix (the icons there
  # stay: the SDL UI loads share/icons/hicolor/32x32/apps/qemu.bmp as window icon).
  rm -rf "$pkgdir$_prefix/share/applications"

  # Licenses
  install -Dm644 LICENSE COPYING COPYING.LIB -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 ../LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
}
