# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com.
# Contributor: Meow King <mr.ziqiyang@gmail.com>

_pkgname="flying-carpet"
pkgname="${_pkgname}-bin"
pkgver=9.0.10
pkgrel=1
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi"
arch=(
  'x86_64'
)
url="https://github.com/spieglt/FlyingCarpet"
license=(
  'GPL-3.0-only'
)
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=(
  "${_pkgname}"
) 
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-LICENSE.txt::${url}/raw/refs/tags/v${pkgver}/LICENSE.txt"
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/linux_FlyingCarpet_${pkgver}_amd64.deb"
)
noextract=(
  "${source_x86_64[@]##*/}"
)
sha256sums=('68fc3b3e41307c4fb2f0174896f9549240e84b60865064f8dd70dffa65f7b5b1'
            'd0ff57d40637314cd2834be84642d741b23f96b1b2e67b9d7bc2449d271c663b')
sha256sums_x86_64=('827f49b73b262ffcf74dc7512980e7463e139d80b62a9855553a67c5afef2848')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.deb}"
  bsdtar -xf "${source_artifact}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${source_artifact%.deb}"
  rm -f data.tar.*
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vd "${pkgdir}/usr"
  cp -vaT --no-preserve=ownership "${source_artifact%.deb}" "${pkgdir}/usr"

  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
