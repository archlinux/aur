# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=KernelPatch
pkgname=kernelpatch
pkgver=0.12.0
pkgrel=1
pkgdesc='Patching and hooking the Linux kernel with only a stripped Linux kernel image.'
arch=('x86_64')
url='https://github.com/bmax121/KernelPatch'
license=('GPL-2.0-only')
depends=('glibc' 'zlib')
makedepends=('cmake' 'aarch64-linux-gnu-gcc' 'aarch64-linux-gnu-binutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9053dd60e0d2b1eede62a42602a16c5a94826dcc77bde41f51646447465265d127731f20cb5bf8a18f8938dc73d10153635cf8ef578118c4e4843967af56461b')
provides=('kpimg' 'kptools')
conflicts=('kpimg' 'kptools')

cross_make() {
  CFLAGS='-fno-pic -fno-pie' \
  CXXFLAGS='-fno-pic -fno-pie' \
  LDFLAGS='-fno-pic -fno-pie' \
  TARGET_COMPILE=aarch64-linux-gnu- \
    make $@
}

build() {
  cd $_pkgname-$pkgver

  # Headers (needed by ./tools and ./user)
  echo 'Copying headers...'
  TARGET_COMPILE=placeholder make -Ckernel hdr

  # kptools
  echo 'Building kptools...'
  cmake -S tools -B tools/build -DCMAKE_BUILD_TYPE=None
  cmake --build tools/build

  # kpimg-linux
  echo 'Building kpmg-linux...'
  cp -r kernel{,-linux}
  cross_make -Ckernel-linux kpimg
  echo 'Building kpmg-android...'
  cp -r kernel{,-android}
  cross_make -Ckernel-android kpimg ANDROID=1

  # KPMs
  echo 'Building demo-hello.kpm'
  cross_make -Ckpms/demo-hello
  echo 'Building demo-inlinehook.kpm'
  cross_make -Ckpms/demo-inlinehook
  echo 'Building demo-syscallhook.kpm'
  cross_make -Ckpms/demo-syscallhook
}

package() {
  cd $_pkgname-$pkgver

  # kptools
  install -Dm 755 tools/build/kptools "$pkgdir"/usr/bin/kptools

  # kpimg
  kpimg_dir="$pkgdir"/usr/share/$pkgname/kpimg
  install -dm 755 "$kpimg_dir"
  install -Dm 644 kernel-linux/kpimg       "$kpimg_dir"/kpimg-linux
  install -Dm 644 kernel-linux/kpimg.elf   "$kpimg_dir"/kpimg-linux.elf
  install -Dm 644 kernel-android/kpimg     "$kpimg_dir"/kpimg-android
  install -Dm 644 kernel-android/kpimg.elf "$kpimg_dir"/kpimg-android.elf

  # KPMs
  kpms_dir="$pkgdir"/usr/share/$pkgname/kpms
  install -dm 755 "$kpms_dir"
  install -Dm 644 kpms/demo-hello/hello.kpm              "$kpms_dir"/demo-hello.kpm
  install -Dm 644 kpms/demo-inlinehook/inlinehook.kpm    "$kpms_dir"/demo-inlinehook.kpm
  install -Dm 644 kpms/demo-syscallhook/syscallhook.kpm  "$kpms_dir"/demo-syscallhook.kpm

  # Headers (kpuser)
  install -dm 755 "$pkgdir"/usr/include/$_pkgname
  cp -r user/* "$pkgdir"/usr/include/$_pkgname/

  # Documentation
  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r doc/en/* "$pkgdir"/usr/share/doc/$pkgname/
}
