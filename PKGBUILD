# Maintainer: duanluan <duanluan@outlook.com>

pkgname=pideck-bin
_appname=PiDeck
_binname=pideck
pkgver=0.14.0
pkgrel=1
pkgdesc='Desktop workbench for managing local AI coding agent sessions (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/ayuayue/PiDeck'
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
  'git: Git integration'
  'libappindicator: system tray support'
  'org.freedesktop.secrets: secret storage backend'
)
provides=("pideck=${pkgver}" "pi-desktop=${pkgver}")
conflicts=('pideck' 'pi-desktop')
options=('!strip')
source=('LICENSE')
source_x86_64=("${_appname}_${pkgver}_amd64.deb::https://github.com/ayuayue/PiDeck/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
source_aarch64=("${_appname}_${pkgver}_arm64.deb::https://github.com/ayuayue/PiDeck/releases/download/v${pkgver}/${_appname}_${pkgver}_arm64.deb")
noextract=(
  "${_appname}_${pkgver}_amd64.deb"
  "${_appname}_${pkgver}_arm64.deb"
)
sha256sums=('032c3da0b36939e15b0ba21974baeecf2d0afbdf410a66bd76c2ba28e5baccab')
sha256sums_x86_64=('d6a489186a7b2fcf0e505692b715415b7f679100a0edea1cc36195da4d780f7b')
sha256sums_aarch64=('22f0c5e0b9ca0a70fc53a023eaf01f45c8f5592e9279519be8f6897a457e4747')

package() {
  local deb_arch
  local extract_dir="${srcdir}/deb-extract-${CARCH}"
  local data_archives

  case "${CARCH}" in
    x86_64) deb_arch='amd64' ;;
    aarch64) deb_arch='arm64' ;;
  esac

  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"
  bsdtar -C "${extract_dir}" -xf "${srcdir}/${_appname}_${pkgver}_${deb_arch}.deb"

  data_archives=("${extract_dir}"/data.tar.*)
  if (( ${#data_archives[@]} != 1 )) || [[ ! -f "${data_archives[0]}" ]]; then
    printf 'unable to locate the Debian data archive\n' >&2
    return 1
  fi
  bsdtar -C "${pkgdir}" -xf "${data_archives[0]}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_appname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  # 保留旧命令名 pi-desktop，老用户脚本不断档
  ln -s "${_binname}" "${pkgdir}/usr/bin/pi-desktop"

  chmod 0755 "${pkgdir}/opt/${_appname}/chrome-sandbox"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
