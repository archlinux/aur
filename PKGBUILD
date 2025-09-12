# Maintainer kris57 <kris319[at]protonmail[dot]com>
# Based on PKGBUILD from aur package `readsb-wiedehopf-git`, maintainer was:
# Maintainer: Jonas Wunderlich <aur[at]03j[dot]de>
# Based on PKGBUILD from aur package `readsb-git`, maintainer was:
# Maintainer: Donald Webster <fryfrog[at]gmail[dot]com>
_pkgname=readsb
pkgname="${_pkgname}-adsbx-git"
pkgver=3.14.1631.r22.geea98b1
pkgrel=1
pkgdesc="ADS-B decoder swiss knife. (ADSBexchange fork)"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ADSBexchange/readsb"
license=('GPL3')
depends=(
  'glibc'
  'bash'
  'zlib'
  'zstd'
  'rtl-sdr'
  'ncurses'
)
provides=('readsb'
          'dump1090-fa-git' 'dump1090' 'dump1090-fa')
conflicts=('readsb' 'readsb-weidehopf-git' 'dump1090-fa-git' 'dump1090' 'dump1090-fa')
makedepends=('git')
backup=('etc/default/readsb')

source=('git+https://github.com/ADSBexchange/readsb'
		'readsb.service'
        'readsb.sysusers'
        'readsb-gain'
        'readsb-set-location'
	      'readsb.tmpfiles')

sha256sums=('SKIP'
            '34cfcbae44710d62171edca5838c38e177677659a3c2210fbfa1c67283130eab'
            '3da99128f5a89aef6f9748f1e09f0120940f123e80c007e7d5ac2d0571740a05'
            'dd27b1326d2454d9965e55bcfb7d736e5660123346843a343b28fd901f4ede78'
            'e07e4a59d2739cba531b61d06b2bf52ce2fe3d12f4ffeb2740bdc7de63515e04'
            '39ed9d33054f7e7bb7f97b7ef27bd17f12f8fd01e4f341328ab735474464592b')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --match=v* | sed 's/dev.//g' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
#For patches, see: https://github.com/wiedehopf/readsb/commit/21d399deb79e9c795e8e2ac35292e7f46becc6f9
prepare() {
	sed -i 's/char ais_charset\[64\]/char ais_charset\[65\]/g' "${srcdir}/${_pkgname}/ais_charset.c"
	sed -i 's/char ais_charset\[64\]/char ais_charset\[65\]/g' "${srcdir}/${_pkgname}/ais_charset.h"
	sed -i 's/char base40_alphabet\[40\]/char base40_alphabet\[41\]/g' "${srcdir}/${_pkgname}/uat2esnt/uat_decode.c"
	sed -i 's/char spinner\[4\]/char spinner\[5\]/g' "${srcdir}/${_pkgname}/interactive.c"
}
build() {
  cd "${srcdir}/${_pkgname}"
  make -j$(nproc) AIRCRAFT_HASH_BITS=16 RTLSDR=yes OPTIMIZE="-O2 -march=native"
}

package() {
  install -D -m 755 "${srcdir}/${_pkgname}/readsb" "${pkgdir}/usr/bin/readsb"
  install -D -m 755 "${srcdir}/${_pkgname}/viewadsb" "${pkgdir}/usr/bin/viewadsb"
  install -D -m 644 "${srcdir}/${_pkgname}/debian/readsb.default" "${pkgdir}/etc/default/readsb"
  install -D -m 644 "${srcdir}/${_pkgname}/debian/readsb.service" "${pkgdir}/usr/lib/systemd/system/readsb.service"
  # Following man pages may be obsolete. In upstream, they are deleted.
  install -D -m 644 "${srcdir}/${_pkgname}/debian/readsb.1" "${pkgdir}/usr/share/man/man1/readsb.1"
  install -D -m 644 "${srcdir}/${_pkgname}/debian/viewadsb.1" "${pkgdir}/usr/share/man/man1/viewadsb.1"
  install -D -m 644 readsb.sysusers "${pkgdir}/usr/lib/sysusers.d/readsb.conf"
  install -D -m 644 readsb.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/readsb.conf"
  install -D -m 755 readsb-gain "${pkgdir}/usr/bin/readsb-gain"
  install -D -m 755 readsb-set-location "${pkgdir}/usr/bin/readsb-set-location"
}
