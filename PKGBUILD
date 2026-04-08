# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="meshcore"
pkgname="${_pkgname}-bin"
## For up to date releases, see https://files.liamcottle.net/MeshCore/.
## Upstream versioning: e.g. `1.40.0+64-1abed0d` -- break down the individual elements to reference them later, too.
_releasever=1.42.0
_buildno=67
_githash=5a3c5f1
pkgver="${_releasever}${_buildno:++"${_buildno}"}.g${_githash}"
pkgrel=2
pkgdesc="Closed source reference companion app by Liam Cottle for MeshCore, a LoRa text messaging protocol."
groups=('meshcore')
arch=(
  'x86_64'
)
url="https://meshcore.co.uk/"


license=(
  "LicenseRef-Proprietary" # App itself.
  "CC-BY-SA-4.0"           # MeshCore_Quick_Start_Guide.pdf
  # Licenses of included libraries. They are in `data/flutter_assets/NOTICES.Z`.
  "Apache-2.0"
  "BSD-2-Clause"
  "BSD-3-Clause"
  "MIT"
  "MPL-2.0"
  "OpenSSL"
  "SSLeay-standalone"
)
depends=(
  # glib2
  libglib-2.0.so
  libgio-2.0.so
  libgobject-2.0.so

  # gtk3
  libgdk-3.so
  libgtk-3.so

  glibc
  libgcc_s.so
  libgdk_pixbuf-2.0.so
  libatk-1.0.so  # at-spi2-core
  libfontconfig.so
  libstdc++.so
  libcairo.so
  libcairo-gobject.so
  libharfbuzz.so
  libepoxy.so
  libpango-1.0.so
  libpangocairo-1.0.so
)
makedepends=(
  # To reduce the size of PNG images
  'parallel'
  'zopfli'
)
optdepends=(
  'hicolor-icon-theme: For hicolor theme hierarchy.'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "https://files.liamcottle.net/MeshCore/v${_releasever}/MeshCore-v${_releasever}${_buildno:++"${_buildno}"}-${_githash}-linux-${CARCH}.zip"
  "https://files.liamcottle.net/MeshCore/Documentation/MeshCore_Quick_Start_Guide.pdf"
  "${_pkgname}.desktop"
  "license-info.md"
)
sha256sums=(
  '8fe2a18d63041b804b39761f7449a4c2db58d1f50219d7e0a94a4807780d3c73'  # Binary software package.
  'a8bcb2a147746b1b0a3879220f5d55aac79c6b5f2b100fbc6b1ccea6c9946ca7'  # MeshCore_Quick_Start_Guide.pdf
  '3c212412360ca59e73a11af24b85db2d5414f2d5851f1a60267fca701077c921'  # meshcore.desktop
  '138cfaf059ef5c3fb860d3132291570179bf74cb77e1aaa7927fa766a93ad957'  # license-info.md
)

build() {
  cd "${srcdir}"

  printf '%s\n' " --> size-optimising PNG files ..."
  find -name '*.png' -type f | parallel -j`nproc` zopflipng -m -y {} {}
}

package() {
  printf '%s\n' " --> installing ..."

  cd "${srcdir}"

  install -vm755 -d "${pkgdir}/usr/lib/meshcore"
  cp -rv data lib MeshCore "${pkgdir}/usr/lib/meshcore"/
  install -vm755 -d "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -sv /usr/lib/meshcore/MeshCore MeshCore
  ln -sv MeshCore meshcore


  printf '%s\n' " --> installing icon and desktop file ..."

  cd "${srcdir}"

  install -Dvm644  data/flutter_assets/assets/images/icon.png    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
  install -dvm755  "${pkgdir}/usr/share/pixmaps"
  ln -sv "/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"  "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dvm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  _docfiles=(
    MeshCore_Quick_Start_Guide.pdf
    data/flutter_assets/CHANGELOG.md
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    license-info.md
    data/flutter_assets/NOTICES.Z  # License for included libraries, not for the software itself.
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile[@]}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

# vim: set sw=2 ts=2 et:
