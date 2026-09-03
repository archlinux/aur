# Maintainer: czyt <czytcn@gmail.com>

pkgname=modbux-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Free open-source Modbus client GUI and server simulator for TCP, RTU, and RTU over TCP"
arch=('x86_64' 'aarch64')
url="https://github.com/ploxc/modbux"
license=('MIT')

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
  'hicolor-icon-theme'
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
optdepends=('libayatana-appindicator: system tray support')
makedepends=('libarchive')
provides=("modbux=${pkgver}")
conflicts=('modbux')
options=('!debug' '!strip')

_deb_x86_64="modbux_${pkgver}_amd64.deb"
_deb_aarch64="modbux_${pkgver}_arm64.deb"
source=('LICENSE')
source_x86_64=(
  "${_deb_x86_64}::https://github.com/ploxc/modbux/releases/download/v${pkgver}/${_deb_x86_64}"
)
source_aarch64=(
  "${_deb_aarch64}::https://github.com/ploxc/modbux/releases/download/v${pkgver}/${_deb_aarch64}"
)
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums=('9dbe8bb5febf603abca49dd6ddf4a7175ecccc91404ff07906ccc036025ddca8')
sha256sums_x86_64=('a809a521d2433aac6e60118f74cdfb6037761f622b1ca30f1330ea433bbd26f8')
sha256sums_aarch64=('a64d27e79222dbc3fd73ebf889e909df59a6d0237e83326f6a0acb03d80d474e')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"
  local data_archive
  local native_prebuild
  local serialport_prebuilds

  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | awk '/^data\.tar\./ { print; exit }')"
  [[ -n "${data_archive}" ]] || {
    printf 'Could not find data.tar.* in %s\n' "${deb}" >&2
    return 1
  }

  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  case "${CARCH}" in
    x86_64) native_prebuild='linux-x64' ;;
    aarch64) native_prebuild='linux-arm64' ;;
  esac
  serialport_prebuilds="${pkgdir}/opt/Modbux/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds"
  find "${serialport_prebuilds}" -mindepth 1 -maxdepth 1 -type d \
    ! -name "${native_prebuild}" -exec rm -rf -- {} +
  find "${serialport_prebuilds}/${native_prebuild}" -type f -name '*.musl.node' -delete

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc"
  chmod -R u=rwX,go=rX "${pkgdir}"
}
