# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codepilot-bin
_pkgname=codepilot
_appname=CodePilot
pkgver=0.67.15
pkgrel=1
pkgdesc='Multi-model AI agent desktop client (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/op7418/CodePilot'
license=('BUSL-1.1')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libgcc'
  'libnotify'
  'libsecret'
  'libstdc++'
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
optdepends=('org.freedesktop.secrets: secret storage backend')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'codepilot-appimage')
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/op7418/CodePilot/v${pkgver}/LICENSE")
source_x86_64=("${_appname}-${pkgver}-amd64.deb::https://github.com/op7418/CodePilot/releases/download/v${pkgver}/${_appname}-${pkgver}-amd64.deb")
source_aarch64=("${_appname}-${pkgver}-arm64.deb::https://github.com/op7418/CodePilot/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.deb")
noextract=("${_appname}-${pkgver}-amd64.deb" "${_appname}-${pkgver}-arm64.deb")
sha256sums=('e77188ca224977d67c57d8c9cfe595b2bfb4146423cb2c016f8502dd15f8b6cf')
sha256sums_x86_64=('1d85bf7d2ca2fa306abd99b1241567304aa9e00bf5ca67a98590db0cdd4b363c')
sha256sums_aarch64=('289f8b333a8c16111bf8267dad9c59b41b96330fe9175ee311a3432dfebcb0da')

package() {
  local deb_arch
  local extract_dir="${srcdir}/deb-extract-${CARCH}"
  local data_archives

  case "${CARCH}" in
    x86_64) deb_arch='amd64' ;;
    aarch64) deb_arch='arm64' ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"
  bsdtar -C "${extract_dir}" -xf \
    "${srcdir}/${_appname}-${pkgver}-${deb_arch}.deb"

  data_archives=("${extract_dir}"/data.tar.*)
  if (( ${#data_archives[@]} != 1 )) || [[ ! -f "${data_archives[0]}" ]]; then
    printf 'unable to locate the Debian data archive\n' >&2
    return 1
  fi
  bsdtar -C "${pkgdir}" -xf "${data_archives[0]}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_appname}/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  chmod 0755 "${pkgdir}/opt/${_appname}/chrome-sandbox"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
