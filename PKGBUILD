# Maintainer: czyt <czytcn@gmail.com>
# Official downloads: https://apifox.com/download

pkgname=api-fox-bin
pkgver=2.8.42
pkgrel=1
pkgdesc="Apifox API documentation, debugging, mocking, and automated testing tool"
arch=('x86_64' 'aarch64')
url="https://apifox.com"
license=('LicenseRef-Proprietary')

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)

optdepends=(
  'java-runtime: run the bundled Java database executors'
  'libappindicator-gtk3: system tray icon support'
)
makedepends=('libarchive')
provides=("apifox=${pkgver}")
conflicts=('apifox' 'apifox-bin' 'apifox-appimage')
options=('!debug' '!strip')

_zip_x86_64="apifox-${pkgver}-x86_64.zip"
_zip_aarch64="apifox-${pkgver}-aarch64.zip"
source_x86_64=(
  "${_zip_x86_64}::https://file-assets.apifox.com/download/Apifox-linux-deb-latest.zip"
)
source_aarch64=(
  "${_zip_aarch64}::https://file-assets.apifox.com/download/Apifox-linux-arm64-deb-latest.zip"
)
noextract=("${_zip_x86_64}" "${_zip_aarch64}")
sha256sums_x86_64=('0ba43fd19a309fa9e55ee920e2d95008b34dff3ebd99210be7b54be033bc5761')
sha256sums_aarch64=('fd8127b42e039d559cb52d10a761e897b01cdf7f78e84c320e18b3ce6a54613b')

package() {
  local zip_var="_zip_${CARCH}"
  local zip_file="${!zip_var}"
  local data_member
  local -a deb_files

  mapfile -t deb_files < <(bsdtar -tf "${srcdir}/${zip_file}" | awk '/[.]deb$/')
  [[ ${#deb_files[@]} -eq 1 ]] || {
    printf 'Expected exactly one deb in %s, found %d\n' \
      "${zip_file}" "${#deb_files[@]}" >&2
    return 1
  }

  data_member=$(
    bsdtar -xOf "${srcdir}/${zip_file}" "${deb_files[0]}" |
      bsdtar -tf - |
      awk '/^data[.]tar[.]/ { print; exit }'
  )
  [[ -n "${data_member}" ]] || {
    printf 'Could not find the deb data archive in %s\n' "${zip_file}" >&2
    return 1
  }

  bsdtar -xOf "${srcdir}/${zip_file}" "${deb_files[0]}" |
    bsdtar -xOf - "${data_member}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/Apifox/apifox "${pkgdir}/usr/bin/apifox"
  chmod 4755 "${pkgdir}/opt/Apifox/chrome-sandbox"

  install -Dm644 "${pkgdir}/opt/Apifox/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/Apifox/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  # Debian package-policy files are not used on Arch Linux.
  rm -rf "${pkgdir}/usr/share/doc"
}
