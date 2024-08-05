# Maintainer: Oscillope <hello@oscillope.xyz>
# Based on ctzcls-cups by Petr Cizmar

pkgname=cts4000-cups
pkgver=3.0
pkgrel=3
pkgdesc="Citizen CTS4000 thermal printer driver for CUPS"
arch=('x86_64')
url="https://www.citizen-systems.co.jp/cms/c-s/en/printer/download/driver-cups-source/"
license=('GPL2')
depends=('cups')
makedepends=('libcups')
source=("cups-CTS4000-${pkgver}.tar.gz::https://www.citizen-systems.co.jp/cms/c-s/en/printer/download/driver-cups-source/cups-CTS4000.tar.gz"
        "add_lengths.patch"
        "force_inline.patch")
md5sums=("f244dc47fb39e76164a1d4a5f4816494" SKIP SKIP)

prepare() {
   patch "${srcdir}"/CTS4000.ppd add_lengths.patch
   patch "${srcdir}"/rastertocts801ii.c force_inline.patch
}

build() {
   cd "${srcdir}"
   gcc $CFLAGS -fPIC -o rastertocts801ii rastertocts801ii.c -lcupsimage -lcups
}

package() {
   install -Dm 644 "${srcdir}"/CTS4000.ppd -t "${pkgdir}"/usr/share/cups/model/
   install -Dm 755 "${srcdir}"/rastertocts801ii -t "${pkgdir}"/usr/lib/cups/filter/
}
