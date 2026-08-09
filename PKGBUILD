# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=pcanview-ncurses-bin
pkgver=0.9.4
pkgrel=1
pkgdesc='CAN/CAN FD monitor for PEAK-System CAN adapters'
arch=('x86_64')
url='https://www.peak-system.com/fileadmin/media/linux/can-pcan-view.php'
license=('LicenseRef-PEAK-PCANView' 'MIT-open-group(libncurses6)')
depends=('ncurses' 'peak-linux-driver-dkms')
makedepends=('patchelf')
options=('!debug')

_libncursesver=6.5+20250216-2
source=(
  "pcanview-ncurses_${pkgver}-0_amd64.deb::https://www.peak-system.com/debian/dists/trixie/non-free/binary-amd64/pcanview-ncurses_${pkgver}-0_amd64.deb"
  "libncurses6_${_libncursesver}_amd64.deb::https://deb.debian.org/debian/pool/main/n/ncurses/libncurses6_${_libncursesver}_amd64.deb"
)
noextract=("pcanview-ncurses_${pkgver}-0_amd64.deb" "libncurses6_${_libncursesver}_amd64.deb")
sha256sums=('967e1334af486e145c99d760ffb9ee350006561dce2938ba61cb0c53b131530b'
            'e00cbcc8c0826993f881f492c05f33ba8d79b5375dc5a2ab59c82e0c7b9179a9')

package() {
  deb="${srcdir}/pcanview-ncurses_${pkgver}-0_amd64.deb"
  ncurses_deb="${srcdir}/libncurses6_${_libncursesver}_amd64.deb"
  compatdir="${pkgdir}/usr/lib/pcanview-ncurses"

  install -d "${compatdir}"
  bsdtar -xOf "${deb}" data.tar.gz | bsdtar --no-same-owner -xzf - -C "${pkgdir}"

  bsdtar -xOf "${ncurses_deb}" data.tar.xz | \
  bsdtar --no-same-owner --strip-components 4 -xJf - -C "${compatdir}" \
    './usr/lib/x86_64-linux-gnu/libncurses.so.6*' \
    './usr/lib/x86_64-linux-gnu/libpanel.so.6*'

  patchelf --set-rpath '$ORIGIN/../lib/pcanview-ncurses' "${pkgdir}/usr/bin/pcanview"

  mv "${pkgdir}/usr/share/doc/pcanview-ncurses" "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "../ncurses/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.ncurses"
  mv "${pkgdir}/usr/share/doc/${pkgname}/changelog.Debian.gz" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.gz"
  rm "${pkgdir}/usr/share/doc/${pkgname}/README.Debian" "${pkgdir}/usr/share/doc/${pkgname}/copyright"
}

# vim: set sw=2 ts=2 et:
