# Maintainer:
# Contributor: m4dz <code(at)m4dz(dot)net>

_pkgname="scangearmp2-mg7700"
pkgname="$_pkgname"
pkgver=3.20
pkgrel=3
pkgdesc='Canon ScanGear MP (PIXMA MG3640, PIXMA MG3650, PIXMA MG5740, PIXMA MG5750, PIXMA MG6840, PIXMA MG6850, PIXMA MG7740, PIXMA MG7750)'
url='http://support-th.canon-asia.com/contents/TH/EN/0100690502.html'
arch=('i686' 'x86_64')
license=('custom')

provides=("scangearmp2=$pkgver")
install=scangearmp2-mg7700.install
source=("http://gdlp01.c-wss.com/gds/5/0100006905/01/scangearmp2-${pkgver}-1-deb.tar.gz")
sha256sums=('37cad11b1ed7b646b798e0de36585c192ff44849a818f88c0a3daebb4d879dad')

prepare() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="scangearmp2-${pkgver}-1-deb/packages"

  ar -x "${_debdir}/scangearmp2_${pkgver}-1_${_pkgarch}.deb" "data.tar.gz"
  bsdtar -xzf data.tar.gz
}

package() {
  depends+=(
    'gtk2'
    'libusb'
  )

  cp --reflink=auto -r {usr,etc} "${pkgdir}"

  chmod 664 "${pkgdir}/usr/lib/bjlib/canon_mfp2_net.ini"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/scangearmp2"/LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}"

  rm -r "${pkgdir}/usr/share/doc"
}
