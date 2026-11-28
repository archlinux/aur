# Maintainer: duanluan <duanluan@outlook.com>

pkgname=alma-desktop
_appname=alma
pkgver=0.4.1246
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
# upstream sha512 x86_64=Q9ekQKlhVYnH1IarFwjGc59Vdz64pFxxwL72hg+4uZoihVx7WdPGd1SSWCdHUZ7pPT8HvU5SRc6iv7GyF2MPbg==
# upstream sha512 aarch64=dNgJTUthw1RySadK4pF6i4lPfLoscbulgI+C8U+qbmQj1IXLZK/rB/ISiMsgCRIM6WoEHXgzME/bmk1xV5/e3w==
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
sha256sums_x86_64=('94846c82b29fc21d379fcafb9fdd87f929dafc34b4249036bfd27e8622a2f6a8')
sha256sums_aarch64=('f7186d8c653d23c2baeaedea14258d3f79fc7334a480d7760126c910eaaded44')

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
