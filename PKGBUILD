# Maintainer: duanluan <duanluan@outlook.com>

pkgname=gooeypi-bin
_pkgname=gooeypi
_appname=GooeyPi
pkgver=1.1.17
pkgrel=1
pkgdesc='Desktop workspace for Pi, OMP, and Prime Agent (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/am-will/gooey-pi'
license=('MIT')
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
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'org.freedesktop.secrets: secure storage backend'
  'pipewire: screen sharing under Wayland'
  'kde-cli-tools: file deletion support on KDE'
  'trash-cli: file deletion fallback'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
source=('LICENSE')
source_x86_64=("${_appname}-${pkgver}-linux-x64.pacman::https://github.com/am-will/gooey-pi/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x64.pacman")
source_aarch64=("${_appname}-${pkgver}-linux-aarch64.pacman::https://github.com/am-will/gooey-pi/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-aarch64.pacman")
noextract=("${_appname}-${pkgver}-linux-x64.pacman" "${_appname}-${pkgver}-linux-aarch64.pacman")
sha256sums=('8afbc591f620720580c00279b5d04d6d700398c4f4f53e54217a7c3eeb50689e')
sha256sums_x86_64=('cd0aa433d507567e91fb0d8f3c2f487e1ce219d7e1e01e679b3a58545ab11a7b')
sha256sums_aarch64=('4d73d3310d0327fd29ddf5f2af9743756264cc3a0bea35caf51a62739dbd8e78')

package() {
  local upstream_arch
  local archive

  case "${CARCH}" in
    x86_64) upstream_arch='x64' ;;
    aarch64) upstream_arch='aarch64' ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  archive="${srcdir}/${_appname}-${pkgver}-linux-${upstream_arch}.pacman"
  bsdtar -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.INSTALL' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    -xf "${archive}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_appname}/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  chmod 0755 "${pkgdir}/opt/${_appname}/chrome-sandbox"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
