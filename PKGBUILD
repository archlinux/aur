# Maintainer: mensylisir <710080675@qq.com>
#
# Repack of the official Linux AppImage. Upstream only publishes a mutable
# "latest" zip per architecture; the zip carries an AppImage whose name
# differs between arches (Apifox.AppImage on x86_64, Apifox-<ver>-arm64.AppImage
# on aarch64), so prepare() searches for it instead of globbing a fixed name.
#
# The AppImage bundles its own Electron 37 runtime and native modules are
# built against that ABI, so the whole squashfs tree is installed instead of
# swapping in the distro electron. The electron37 package is no longer in the
# official repositories, which makes the system-runtime approach fragile.
#
# Version note: package versions come from X-AppImage-Version in the AppImage
# desktop entry; the Windows channel manifest (download/latest.yml) shares the
# same version and is what scripts/check-upstream-updates.py reads.

pkgname=apifox-appimage-bin
pkgver=2.8.55
pkgrel=1
pkgdesc='Apifox = Postman + Swagger + Mock + JMeter. API design, debugging, mocking and testing client (official Linux build)'
arch=('x86_64' 'aarch64')
url='https://apifox.com/'
license=('LicenseRef-custom')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxrender'
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
  'java-runtime: run Java-based test scripts and plugins'
  'nodejs: run Node.js-based test scripts and plugins'
  'libappindicator-gtk3: tray icon support'
)
provides=("apifox=${pkgver}")
conflicts=('apifox')
options=('!strip' '!debug')
noextract=("apifox-${pkgver}-x86_64.zip" "apifox-${pkgver}-aarch64.zip")

source_x86_64=("apifox-${pkgver}-x86_64.zip::https://file-assets.apifox.com/download/Apifox-linux-latest.zip")
source_aarch64=("apifox-${pkgver}-aarch64.zip::https://file-assets.apifox.com/download/Apifox-linux-arm64-latest.zip")
sha256sums_x86_64=('2e1e42326dd1193bd0918e213ad1623b3fc41797d9507eeccfcaeccf8c607ec7')
sha256sums_aarch64=('caca59c104b6a6913d5856fb622af19392fc6936a57865a20116be290e4c8dc0')

pkgver() {
  local _v
  _v="$(sed -n 's/^X-AppImage-Version=//p' "${srcdir}/squashfs-root/apifox.desktop" 2>/dev/null | head -n1)"
  echo "${_v:-${pkgver}}"
}

prepare() {
  local _zip="${srcdir}/apifox-${pkgver}-${CARCH}.zip"
  local _desktop _version _appimage
  local -a _appimages

  rm -rf "${srcdir}/squashfs-root" "${srcdir}/.apifox-unpack"
  install -dm755 "${srcdir}/.apifox-unpack"

  # Extract explicitly instead of relying on makepkg's automatic unpacking so
  # a broken archive fails here with a readable message.
  if ! bsdtar -xf "${_zip}" -C "${srcdir}/.apifox-unpack"; then
    echo "error: cannot extract ${_zip}" >&2
    return 1
  fi

  mapfile -t _appimages < <(find "${srcdir}/.apifox-unpack" -maxdepth 2 -type f -name '*.AppImage')
  if (( ${#_appimages[@]} != 1 )); then
    echo "error: expected exactly one AppImage in ${_zip}, found ${#_appimages[@]}" >&2
    find "${srcdir}/.apifox-unpack" -maxdepth 2 -printf '  %p\n' >&2
    return 1
  fi
  _appimage="${_appimages[0]}"
  chmod +x "${_appimage}"

  if ! ( cd "${srcdir}" && "${_appimage}" --appimage-extract >/dev/null ); then
    echo "error: AppImage extraction failed" >&2
    return 1
  fi

  _desktop="${srcdir}/squashfs-root/apifox.desktop"
  if [[ ! -x "${srcdir}/squashfs-root/apifox" || ! -f "${_desktop}" ]]; then
    echo "error: extracted AppImage lacks apifox binary or desktop entry" >&2
    return 1
  fi

  _version="$(sed -n 's/^X-AppImage-Version=//p' "${_desktop}" | head -n1)"
  if [[ "${_version}" != "${pkgver}" ]]; then
    echo "error: AppImage version ${_version:-<none>} does not match pkgver ${pkgver}" >&2
    return 1
  fi

  # AppRun expects to live inside the AppImage mount; launch the real binary.
  sed -i -e 's|^Exec=.*|Exec=apifox %U|' -e 's|^Icon=.*|Icon=apifox|' "${_desktop}"

  # app.asar.unpacked ships 0700 directories, which breaks non-root use.
  find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} +

  rm -rf "${srcdir}/.apifox-unpack"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/apifox" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/usr/lib/apifox/"
  rm -f "${pkgdir}/usr/lib/apifox/AppRun" "${pkgdir}/usr/lib/apifox/.DirIcon"

  ln -s /usr/lib/apifox/apifox "${pkgdir}/usr/bin/apifox"

  # Electron's setuid helper; unprivileged user namespaces are the fallback.
  chmod 4755 "${pkgdir}/usr/lib/apifox/chrome-sandbox"

  install -Dm644 "${srcdir}/squashfs-root/apifox.desktop" \
    "${pkgdir}/usr/share/applications/apifox.desktop"

  local _icon _rel
  while IFS= read -r -d '' _icon; do
    _rel="${_icon#${srcdir}/squashfs-root/}"
    install -Dm644 "${_icon}" "${pkgdir}/usr/${_rel#usr/}"
  done < <(find "${srcdir}/squashfs-root/usr/share/icons" -type f -name 'apifox.png' -print0)

  # Upstream ships only the Electron/Chromium license texts; the Apifox
  # service terms live at https://apifox.com/.
  install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
