# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

_pkgname=geelark
_appname=GeeLark
pkgname=${_pkgname}-bin
pkgver=4.5.5
pkgrel=2
pkgdesc='Desktop client for GeeLark cloud phones and antidetect browser profiles'
arch=('x86_64')
url='https://www.geelark.com'
license=('LicenseRef-GeeLark')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libgcc'
  'libnotify'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: tray icon'
  'libsecret: store credentials in the system keyring'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# The app code is V8 bytecode built for the bundled Electron, so it can't run on system electron
options=('!strip' '!debug')

_deb="${_appname}_x64_${pkgver}.deb"
source=("https://appdownload1.geelark.com/app/release/linux/${_deb}"
        'LICENSE')
noextract=("${_deb}")
sha256sums=('b041e9567ff9a1c51fe53e2c199739ef4a368c960be3239520e11cefed6075fb'
            '658a423224047fb431619796254b77ca7ff06b5ef0fd5fb4b8cf7864cf62ee32')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${_deb}" data.tar.xz | bsdtar -xf - -C deb
}

package() {
  cp -a deb/. "${pkgdir}/"

  # The Debian changelog doesn't belong on Arch
  rm -rf "${pkgdir}/usr/share/doc"

  # Arch has unprivileged user namespaces, so the sandbox helper needs no SUID
  chmod 755 "${pkgdir}/opt/${_appname}/chrome-sandbox"

  # Under native Wayland the app runs but never maps a window, so force XWayland
  install -dm755 "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec /opt/%s/%s --ozone-platform=x11 "$@"\n' "${_appname}" "${_pkgname}" \
    > "${pkgdir}/usr/bin/${_pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
  sed -i "s|^Exec=.*|Exec=${_pkgname} %U|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
