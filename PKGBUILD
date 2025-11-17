# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: wget
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.8.49
pkgrel=1
pkgdesc="A powerful proprietary scanning tool developed by Hamrick Software"
arch=(i686 x86_64 aarch64)
url="https://www.hamrick.com/"
license=('custom')
depends=(gtk3) #libsm libusb
makedepends=(wget)
#optdepends=('gtk-engine-murrine: optional theme engine')
options=(!strip) # required to accept registration details
source=(
    "vuescan-LICENSE.txt"
)
source_i686=("vuescan-x32-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuex3298.rpm")
source_x86_64=("vuescan-x64-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuex6498.rpm")
source_aarch64=("vuescan-arm64-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuea6498.rpm")
# To recompute digests for ocr_* files using the same ordering as the Hamrick
# website, use this:
# for i in $(grep  ocr_ PKGBUILD | grep http | cut -d '/' -f 5); do echo "'"$(sha256sum "$i" | cut -d ' ' -f 1)"'"; done
# But we are skipping them
sha256sums=('6dbe377ee83561ef0b12fec64dadb5c81beb1f9ee274284c09184366bad1a6d6')
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
  printf "%s" "$(wget -qO- https://www.hamrick.com/alternate-versions.html | grep -E '<a href.*[0-9]+\.[0-9]+' | head -1 | sed -E 's/^.*([0-9]+[.][0-9]+[.][0-9]+).*$/\1/')"
}

package() {
  cp -a "${srcdir}"/usr "${pkgdir}"/
  cp -a "${srcdir}"/lib "${pkgdir}"/usr

  # ocr files need to be alongside the vuescan executable. Solution: move the
  # vuescan executable to lib and symlink /usr/bin/vuescan to the executable
  # now being in lib.
  install -dm755 "${pkgdir}/usr/lib/vuescan"
  mv "${pkgdir}"/usr/bin/* "${pkgdir}/usr/lib/vuescan"
  ln -s /usr/lib/vuescan/vuescan "${pkgdir}/usr/bin/vuescan"

  install -Dm644 "${srcdir}/vuescan-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
