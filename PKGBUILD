# based on the PKGBUILD from core mkinitcpio by
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>
# this pkg attempts to replace mkinitcpio with a version
# that doesn't depend on systemd

pkgname=mkinitcpio-nosystemd
pkgver=22
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
		)
install=mkinitcpio.install
sha256sums=('54c1fc0fc128ae486e72362f49f52e94acd5fcfea9f44b719dc33250e42664eb'
            'SKIP'
			'4921518d130b73724645b3732ba471005b8755a89a219bb6396e3b082414bb78'
			)

prepare() {
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
