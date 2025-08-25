# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>

pkgname=lib32-ladspa
_name="${pkgname/lib32-}"
pkgver=1.17
pkgrel=4
pkgdesc="Linux Audio Developer's Simple Plugin API"
arch=(x86_64)
url="https://www.ladspa.org/"
license=(LGPL-2.1-or-later)
depends=(
  "$_name=$pkgver"
  lib32-gcc-libs
  lib32-glibc
)
makedepends=(
  lib32-libsndfile
)
source=(
  https://ladspa.org/download/${_name}_sdk_$pkgver.tgz
  $_name-1.17-plugin_underlinking.patch
  $_name-1.17-fix-memleak-in-plugin-scanning.patch
  $_name-1.17-distribution-flags.patch
)
sha512sums=('c096e70d245c50ffad379f2c9aab2735c205dfe7c27b5710cad6e43b39f8accc7b8bd2cd7ebbea2c399ad76018b3d4c701ed271de552d098b12ab218a58f0497'
            '9660937df8cfcd2005f8e6b4d7257a6d295a2d7e06979dd05ff2894461e91fc3f812497878673724ee9209bffd67fbb690fbdc3669ecb5932503d0770454301b'
            'aeb00e9715bc913b20e8ced7a7539486bbde9bfd82c5b1f78a0506e2a5f2d07edd6cfc03e5f8a21897d377e6719e1435e95719aefe45aafe048d1ba6dbd2bba1'
            '0040251fd411ba614ed6e3a027e8e8535fafb5821b316bdb16449dea085fb73050190ab506364f842172efdd6e480fdd89233b261efe85ba8a58411922ddef46')
b2sums=('234f6c42e2736d250259b9473f70def136bcf57c2395d79e3a3cd6da715181dbfa87c1c35e8f0b840e0c5c00c39bfbb93d1ddd73b4c1547140caa080589d91b3'
        'a997afed65bd747c970e0110b1d9d8a3ea69e3ff30c7b9fa65177597661fc2043b252ea90b5eaac24dd5b770480bac7eac1eec31a98ccf0780f69828ca986ffa'
        'ad7d99f12e714c3bb46e785615d606900f4014052eeb221e05078cc1d36227472784a037b0e07c1d7217ae02b5741a4019a2499f40abc21b46edb1f6928b4d21'
        'b9f0c37a7af1afe1b977a5188e39ff10c8ee7f9286efdc8898a7cff1089621ef86e5364f89f48ea9bc21d713f7f5c9586a4451a4607a8590171b28a33f8ad6c5')

prepare() {
  cd ${_name}_sdk_$pkgver
  # fix memory leak when plugin scanning
  patch -Np1 -i ../$_name-1.17-fix-memleak-in-plugin-scanning.patch
  # fix underlinking of plugins
  patch -Np1 -i ../$_name-1.17-plugin_underlinking.patch
  # add LDFLAGS for full RELRO
  patch -Np1 -i ../$_name-1.17-distribution-flags.patch
}

build() {
  local make_options=(
    CC='gcc -m32'
    CPP='g++ -m32'
    LD='ld -m elf_i386'
    targets
    -C ${_name}_sdk_$pkgver/src
  )

  make "${make_options[@]}"
}

package() {
  local make_options=(
    INSTALL_PLUGINS_DIR="$pkgdir/usr/lib32/ladspa/"
    INSTALL_INCLUDE_DIR="$pkgdir/usr/include/"
    INSTALL_BINARY_DIR="$pkgdir/usr/bin/"
    install
    -C ${_name}_sdk_$pkgver/src
  )

  make "${make_options[@]}"
  rm -rf "$pkgdir"/usr/{bin,include}
}

# vim: ts=2 sw=2 et:
