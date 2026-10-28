# Maintainer: duanluan <duanluan@outlook.com>

pkgname=pideck-bin
_appname=PiDeck
_binname=pideck
pkgver=0.9.8
pkgrel=1
pkgdesc='Desktop workbench for managing local AI coding agent sessions (prebuilt binary)'
arch=('x86_64')
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
noextract=("${_appname}_${pkgver}_amd64.deb")
sha256sums=('032c3da0b36939e15b0ba21974baeecf2d0afbdf410a66bd76c2ba28e5baccab')
sha256sums_x86_64=('7bd0d6a32538bed4b6bc970d44dbf18eee2dd6a3bcffdcf9c1cbb79c09e79ec7')

package() {
  local extract_dir="${srcdir}/deb-extract"
  local data_archives

  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"
  bsdtar -C "${extract_dir}" -xf "${srcdir}/${_appname}_${pkgver}_amd64.deb"

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
