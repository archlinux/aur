# based on the PKGBUILD from core mkinitcpio by
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>
# this pkg attempts to replace mkinitcpio with a version
# that doesn't depend on systemd

pkgname=mkinitcpio-nosystemd
pkgver=18
pkgrel=2
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url="https://projects.archlinux.org/mkinitcpio.git/"
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive'
         'coreutils' 'bash' 'findutils' 'grep' 'filesystem>=2011.10-1' 'gzip')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
makedepends=('asciidoc')
provides=("mkinitcpio=${pkgver}-${pkgrel}")
conflicts=('mkinitcpio')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/${pkgname%-nosystemd}/${pkgname%-nosystemd}-$pkgver.tar.gz"{,.sig}
        '0001-avoid-compound-conditional-leading-to-spurious-error.patch'
 		'0002-remove-systemd.patch'
		)
install=mkinitcpio.install
sha256sums=('187bdeeade08996010fbff480ccc91e47722d275c22fd6feb4a4b63061e9fc22'
            'SKIP'
            'f6a77a34a5d97b8c3f3aef21b97da0b5d6992244e28e9b3f71e83cbaa4473341'
			'4921518d130b73724645b3732ba471005b8755a89a219bb6396e3b082414bb78'
			)

prepare() {
  #start removing systemd related stuff
  local d=${srcdir}/${pkgname}-${pkgver}
  [ ! -h "$d" ] && ln -s ${pkgname%-nosystemd}-${pkgver} "$d"
  [ ! -d "$d" ] && echo "!!!!! cannot locate dir '$d'" && exit 666
  rm -rf ${d}/install/sd-vconsole ${d}/install/sd-shutdown ${d}/systemd ${d}/tmpfiles
  patch -d "$pkgname-$pkgver" -Np1 <0002-remove-systemd.patch
  #end removing systemd related stuff
  patch -d "$pkgname-$pkgver" -Np1 <0001-avoid-compound-conditional-leading-to-spurious-error.patch
}

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="$pkgdir" install
}
