# Maintainer: duanluan <duanluan@outlook.com>

pkgname=alma-desktop
_appname=alma
pkgver=0.4.1121
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
# upstream sha512 x86_64=lwnApd66H1yQAM9I32Y4TM7k+Zb04dpO+t15R2M4Tzv7hTyHVjO2qBfPrVOnUOrzkwbYts/jhAAuvcFAdy7OrQ==
# upstream sha512 aarch64=dDxQRi+50zr3Pcza+5MFrVmDcAZM4w2OEDYx7oAdFKMsp/4WxX+CFRSCQF83FucIMOrF8FjBYN93X7l26MusHQ==
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
sha256sums_x86_64=('00f32e90424102d0c8e08ed990ac287b0aa8f020a1ea46d66ffff1eaa95060a6')
sha256sums_aarch64=('3a89060ff2828874e9f2552c35fe40c86a424f2fe4e9cbc6f2e110c251296328')

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
