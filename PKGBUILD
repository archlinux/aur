# based on the PKGBUILD from core mkinitcpio by
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>
# this pkg attempts to replace mkinitcpio with a version
# that doesn't depend on systemd

pkgname=mkinitcpio-nosystemd
pkgver=23
pkgrel=2
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url="https://projects.archlinux.org/mkinitcpio.git/"
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive'
         'coreutils' 'bash' 'findutils' 'grep' 'filesystem>=2011.10-1' 'gzip')
makedepends=('asciidoc')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=("mkinitcpio=${pkgver}-${pkgrel}")
conflicts=('mkinitcpio')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/${pkgname%-nosystemd}/${pkgname%-nosystemd}-$pkgver.tar.gz"{,.sig}
 		'remove-systemd.patch'
		'0001-make-ldd-parsing-compatible-with-upstream-glibc-chan.patch'
		)
install=mkinitcpio.install
sha256sums=('80f12a07f0dceef81dfe87200f099bd2149e0990391dda6defebaa5697f8a35a'
            'SKIP'
            '4921518d130b73724645b3732ba471005b8755a89a219bb6396e3b082414bb78'
            'f534892af930abf8164eead271dc012e42a552362fbb459e55e04d4a68b52a66'
		)
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'
              '86CFFCA918CF3AF47147588051E8B148A9999C34')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../0001-make-ldd-parsing-compatible-with-upstream-glibc-chan.patch
  cd ".."

  #start removing systemd related stuff
  local d=${srcdir}/${pkgname}-${pkgver}
  [ ! -h "$d" ] && ln -s ${pkgname%-nosystemd}-${pkgver} "$d"
  [ ! -d "$d" ] && echo "!!!!! cannot locate dir '$d'" && exit 666
  rm -rf ${d}/install/sd-vconsole ${d}/install/sd-shutdown ${d}/systemd ${d}/tmpfiles
  patch -d "$pkgname-$pkgver" -Np1 <remove-systemd.patch
  #end removing systemd related stuff
}
package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
