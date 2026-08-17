# Maintainer: czyt <czytcn@gmail.com>

pkgname=ediary-bin
pkgver=1.0.beta2
pkgrel=2
pkgdesc="A free, time-based diary and personal document manager"
arch=('x86_64')
url="https://www.haoxg.net"
license=('LicenseRef-Proprietary')

depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glibc'
  'gtk3'
  'libx11'
  'pango'
  'zlib'
)
makedepends=('libarchive')
provides=("ediary=${pkgver}")
conflicts=('ediary')
options=('!debug' '!strip')

_debver='1.0~beta2-2'
_deb="ediary_${_debver}_amd64.deb"
source_x86_64=(
  "${_deb}::https://down.haoxg.net/download/ediary/linux/ediary_${_debver}_amd64.deb"
)
source=('ediary-terms.html::https://www.haoxg.net/terms-of-service.php')
noextract=("${_deb}")
sha256sums=('12f5b1c35eedcfc192b6e4a059955946b8635dcabd67e024bd9b0c27edd6b2d1')
sha256sums_x86_64=('4afebc465db89d43629ad4470988493ccc818d1239e96eb317a6b5f04028e80c')

package() {
  local data_member

  data_member=$(
    bsdtar -tf "${srcdir}/${_deb}" |
      awk '/^data[.]tar[.]/ { print; count++ } END { if (count != 1) exit 1 }'
  ) || {
    printf 'Expected exactly one deb data archive in %s\n' "${_deb}" >&2
    return 1
  }

  bsdtar -xOf "${srcdir}/${_deb}" "${data_member}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/ediary/ediary "${pkgdir}/usr/bin/ediary"

  install -Dm644 "${srcdir}/ediary-terms.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/terms-of-service.html"
}
