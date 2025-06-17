# Touchégg : Multitouch gesture recogniser
# Maintainer: dreieck
# Original Maintainer: Guillaume Turchini <guillaume.turchini@gmail.com>"

_pkgname=touchegg
pkgname=${_pkgname}-nosystemd-git
pkgver=2.0.18+3.r673.20250614.93f8a28
pkgrel=1
pkgdesc='Linux multi-touch gesture recognizer (without systemd dependency; latest git checkout).'
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/JoseExposito/${_pkgname}"
license=('GPL3')
source=("${_pkgname}::git+${url}.git")
depends=(
  'at-spi2-core'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'libinput'
  'libudev'
  'libx11'
  'libxi'
  'libxrandr'
  'libxtst'
  'pango'
  'pugixml'
  'zlib'
)
makedepends=(
  'cmake'
  'git'
)
optdepends=(
  'touche: For a GUI to touchegg.'
)
sha256sums=('SKIP')
conflicts=(
  "${_pkgname}"
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-nosystemd=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]+$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEMD=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build

  if [ -d "${pkgdir}/lib" ]; then
    mv -v "${pkgdir}/lib" "${pkgdir}/usr/lib"
  fi

  if ! [ -e "${pkgdir}/etc/xdg/autostart/touchegg.desktop" ]; then
    install -Dvm644 "${srcdir}/${_pkgname}/installation/touchegg.desktop" "${pkgdir}/etc/xdg/autostart/touchegg.desktop"
  fi

  cd "${srcdir}/${_pkgname}"
  for _docfile in 'git.log' 'CHANGELOG.md' 'HACKING.md' 'README.md' 'installation'/{README.md,touchegg.service.in}; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in COPYING COPYRIGHT; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
