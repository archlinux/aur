# Maintainer: duanluan <duanluan@outlook.com>

pkgname=alma-desktop
_appname=alma
pkgver=0.4.1226
pkgrel=1
pkgdesc='Desktop AI agent harness and GUI client for herdr, repackaged from the official Linux release'
arch=('x86_64' 'aarch64')
url='https://alma.now/'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsecret'
  'webkit2gtk-4.1'
  'xdg-utils'
)
optdepends=(
  'ffmpeg: H.264 video encoding for remote access'
  'gtk-layer-shell: Wayland layer shell windows'
  'libpulse: PulseAudio audio output'
)
makedepends=('libarchive')
provides=("alma-desktop-bin=${pkgver}")
conflicts=('alma-desktop-bin' 'alma-appimage')
options=('!strip' '!debug' '!lto')
# upstream sha512 x86_64=lunTNJ3dKP6WTmQtfhfmw7SuAM2rbBd8Fv7xZPey03xCnuorl4zp69fcuIDCqClKYhuprerpQPDw0hUrXBCMYg==
# upstream sha512 aarch64=6QJSffzRGMwVVbuYaAg6sUMCPD/5OPZ4/jLh5a/AX9dAaLxpztWDEkZ290AqLNDYucX7OTQyRNN59WWehZ5s5g==
source_x86_64=(
  "${_appname}-${pkgver}-linux-amd64.deb::https://github.com/yetone/alma-releases/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-amd64.deb"
)
source_aarch64=(
  "${_appname}-${pkgver}-linux-arm64.deb::https://github.com/yetone/alma-releases/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-arm64.deb"
)
noextract=(
  "${_appname}-${pkgver}-linux-amd64.deb"
  "${_appname}-${pkgver}-linux-arm64.deb"
)
sha256sums_x86_64=('7627f241be1eefb2459f43a093dc023fe4ab74207fb791997879202f47a76517')
sha256sums_aarch64=('75124b028fcaf152fce16865add46ab0461ee3b3ea77adb4a5d8b755abf75c39')

package() {
  local deb_arch extract_dir

  case "${CARCH}" in
    x86_64) deb_arch='amd64' ;;
    aarch64) deb_arch='arm64' ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  extract_dir="${srcdir}/deb-extract-${CARCH}"
  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"
  bsdtar -C "${extract_dir}" -xf "${srcdir}/${_appname}-${pkgver}-linux-${deb_arch}.deb"
  # The deb also carries /opt/Alma/alma, a symlink to /opt/alma/alma left over
  # from an older install location; it is kept so anything still pointing there
  # keeps working.
  bsdtar -C "${pkgdir}" -xf "${extract_dir}/data.tar.gz"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/opt/alma/alma' "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgdir}/opt/alma/THIRD_PARTY_NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
