# Maintainer: Luca Stefani <luca.stefani.ge1@gmail.com>

pkgname=mkinitcpio-zstd
pkgver=28
pkgrel=1
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url="https://projects.archlinux.org/mkinitcpio.git/"
license=('GPL')
depends=('mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'awk' 'bash' 'findutils' 'grep' 'filesystem>=2011.10-1' 'systemd' 'gzip')
makedepends=('asciidoc' 'git' 'sed')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'zstd: Use zstd compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=("mkinitcpio=$pkgver" "initramfs")
conflicts=('mkinitcpio')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/${pkgname%-zstd}/${pkgname%-zstd}-$pkgver.tar.gz"
        "0001-mkinitcpio-Add-support-for-the-zstd-compressor.patch")
install=mkinitcpio.install
sha256sums=('bf83a158786d272d8046a4dd48bfcc343ec37de2cae0ae65c59132a45744808c'
            '5586552495dc7cafefea8ccf9f2006194b96ccc7867cf006e1b197279e3ce27f')

prepare() {
  cd ${pkgname%-zstd}-$pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

check() {
  make -C "${pkgname%-zstd}-$pkgver" check
}

package() {
  make -C "${pkgname%-zstd}-$pkgver" DESTDIR="$pkgdir" install
}
