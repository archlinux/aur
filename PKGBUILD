# Maintainer: Bart De Roy <de dot roy dot bart at gmail dot com>

pkgname=mkinitcpio-sign-patch
pkgver=27
pkgrel=2
pkgdesc="Modular initramfs image creation utility (automatically signs kernels and images)"
arch=('any')
url="https://projects.archlinux.org/mkinitcpio.git/"
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'gzip' 'systemd' 'gnupg')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=('initramfs')
conflicts=('mkinitcpio')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/${pkgname%-sign-patch}/${pkgname%-sign-patch}-$pkgver.tar.gz"{,.sig}
        "0001-mkinitcpio-remove-preset-pacsave.patch"
        "gpg.conf" "gpg-agent.conf" "89-mkinitcpio-sign-install.hook" "mkinitcpio-sign-install"
        "0002-mkinitcpio-sign-when-done.patch")
install=mkinitcpio.install
sha256sums=('e6bff1cb78b677538eb9aace900b715fd59de8fc210b74fb9d899dfaa32bc354'
            'SKIP'
            '845569fa760f70c868ecb3dc8ae9667287970526dddaf403fdafcb716e8b3d51'
            'f6eebbd610dcb91288d39b93e4f7f7f47e1c13abaab2d379607d78d417bfd0c7'
            '899983ccc567d84ab5d059e87ea4be322e429a2dd18c33f2e443ff5faf890f3d'
            'cb094c11de6d4ad903484dea41ef456a4a92c788e570ff8f21214021de7e4f14'
            '3f0f42849fbb20c2d74ed9a7192d0e63770db5421377f3f4c227216d4f42a071'
            '5dc8d9ae28979ea09a6b2ba0192a211421b0a40518a8763bdc86c4f841926590')
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'   # Dave Reisner
              '86CFFCA918CF3AF47147588051E8B148A9999C34'   # Evangelos Foutras
              'ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB')  # Giancarlo Razzolini

prepare() {
  cd ${pkgname%-sign-patch}-$pkgver
  # Apply 0001-mkinitcpio-remove-preset-pacsave.patch
  patch -Np1 < $srcdir/0001-mkinitcpio-remove-preset-pacsave.patch
  patch -Np1 < $srcdir/0002-mkinitcpio-sign-when-done.patch
}

check() {
  make -C "${pkgname%-sign-patch}-$pkgver" check
}

package() {
  make -C "${pkgname%-sign-patch}-$pkgver" DESTDIR="$pkgdir" install
  install -m644  $srcdir/89-mkinitcpio-sign-install.hook $pkgdir/usr/share/libalpm/hooks/89-mkinitcpio-sign-install.hook
  install -m755  $srcdir/mkinitcpio-sign-install         $pkgdir/usr/share/libalpm/scripts/mkinitcpio-sign-install
  install -dm700 $pkgdir/usr/lib/initcpio/sign
  install -m600  $srcdir/gpg.conf $pkgdir/usr/lib/initcpio/sign/gpg.conf
}
