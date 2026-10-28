# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgbase=gpu-unlock
pkgname=(gpu-unlock-dkms gpu-unlock-firmware)
pkgver=2.0.0
pkgrel=1
_commit=0532473b4b105ed216948ed9c5aaeab0fa5c734f
_nv=610.43.03
_installer=NVIDIA-Linux-x86_64-$_nv-no-compat32.run
pkgdesc='Lifts the GeForce cap that halves FP16/BF16/TF32 tensor throughput on RTX 20/30/40 cards'
arch=('x86_64')
url='https://github.com/Zagitta/gpu-unlock'
license=('GPL-2.0-only')
makedepends=('python' 'zstd' 'openssl')
options=('!strip' '!debug')
source=("$pkgbase-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
        "https://download.nvidia.com/XFree86/NVIDIA-kernel-module-source/NVIDIA-kernel-module-source-$_nv.tar.xz"
        "https://download.nvidia.com/XFree86/Linux-x86_64/$_nv/$_installer"
        "gpu-unlock-dkms.install")
sha256sums=('a8d30dac52fbc0f0720ef81616effa8c08965afd21873c7a7f26f8c8c55642cd'
            '7e118923c7a23edc36114d63273a46e3e04e9af98695a42203e7ac2dfe9fc1dc'
            'e084451db730a6df29d3d74f655749c4d236e3c945f7d94b5205e84318fe2f90'
            '1b297cece7ea68599661c08540f1fbf7d33bea392c433b9b72822c314b870354')
noextract=("$_installer")

prepare() {
  cd "$pkgbase-$_commit"
  [[ $(< VERSION) == "$pkgver" ]]
}

build() {
  cd "$pkgbase-$_commit"
  python firmware/extract_gsp.py "$srcdir/$_installer" "$srcdir/assets"
  python firmware/extract_boot_assets.py "$srcdir/NVIDIA-kernel-module-source-$_nv" "$srcdir/assets"
}

package_gpu-unlock-dkms() {
  pkgdesc+=' (DKMS module and initramfs hooks)'
  arch=('any')
  depends=('dkms' "gpu-unlock-firmware=$pkgver-$pkgrel")
  backup=('etc/mkinitcpio.conf.d/zz-gpu-unlock.conf')
  install=gpu-unlock-dkms.install

  cd "$pkgbase-$_commit"
  make DESTDIR="$pkgdir" install-dkms install-mkinitcpio install-dracut
  make DESTDIR="$pkgdir" PKG=$pkgname install-licenses
}

package_gpu-unlock-firmware() {
  pkgdesc+=' (firmware assets extracted from the NVIDIA installer)'
  license=('GPL-2.0-only' 'LicenseRef-NVIDIA')

  cd "$pkgbase-$_commit"
  make DESTDIR="$pkgdir" ASSETS="$srcdir/assets" install-firmware
}
