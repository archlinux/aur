# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>

_name=ladspa
pkgname=lib32-ladspa
pkgver=1.17
pkgrel=3
pkgdesc="Linux Audio Developer's Simple Plugin API"
arch=(x86_64)
url="https://www.ladspa.org/"
license=(LGPL2.1)
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
  fix-memleak-in-plugin-scanning.patch
)
sha512sums=('c096e70d245c50ffad379f2c9aab2735c205dfe7c27b5710cad6e43b39f8accc7b8bd2cd7ebbea2c399ad76018b3d4c701ed271de552d098b12ab218a58f0497'
            'e80a575e6afe42f9d0ac1234a7832a29fb9362c7ab7b2d6b14cc3e6da6a9ba67af886cf09f1c0b78c161205084f705049fb4dc22fe2795efaeb7d94da90dc93e')
b2sums=('234f6c42e2736d250259b9473f70def136bcf57c2395d79e3a3cd6da715181dbfa87c1c35e8f0b840e0c5c00c39bfbb93d1ddd73b4c1547140caa080589d91b3'
        'b2235b41d9638cceb93a41452f1f0b710bc3f9264fe735972099244dfc8d98d354c7d15084d79b0bdfc4fa3f437f9368f81aa0ebdb7e39df5900fbbf172927c2')

prepare() {
  cd ${_name}_sdk_$pkgver
  patch -Np0 -i "../fix-memleak-in-plugin-scanning.patch"
  # add LDFLAGS for full RELRO
  sed -e "s#-O2#${CFLAGS} ${LDFLAGS}#" -i src/Makefile
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
