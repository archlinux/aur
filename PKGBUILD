# Maintainer: Vyacheslav Razykov <v dot razykov at gmail dot com>

_name=outline-client
pkgname=${_name}-bin
pkgver=1.22.0
pkgrel=1
pkgdesc="The Outline clients use the popular Shadowsocks protocol, and lean on the Cordova and Electron frameworks."
arch=(x86_64)
provides=("${_name}")
conflicts=('outline-client-appimage' 'outline-client-appimage-git')
url="https://getoutline.org"
license=("Apache-2.0")

_deb="outline-client_amd64_${pkgver}.deb"
source=("${_deb}::https://s3.amazonaws.com/outline-releases/client/linux/${pkgver}/1/outline-client_amd64.deb")
options=('!strip' '!debug')
depends=('libnotify' 'libxtst' 'nss' 'libcap' 'libdrm' 'alsa-lib' 'mesa' 'libxdamage' 'libxkbcommon' 'libxrandr' \
         'hicolor-icon-theme' 'dbus' 'gtk3' 'at-spi2-core' 'libxcomposite' 'libcups')
makedepends=('patchelf')
install="${pkgname}.install"

sha256sums=('145ac6763601b4253e6530d061e0207309b59672fc23ba24e4194f0825772cac')

prepare() {
  cd "$srcdir"

  mkdir -p 'deb/root'

  bsdtar -xf "${_deb}" -C 'deb'
  bsdtar -xf 'deb/data.tar.xz' -C 'deb/root'
}

package() {
  local _opt="/opt/${_name}"
  local _executable="${_opt}/Outline"
  local _link="/usr/bin/${_name}"

  # Outline Client files copy
  install -dm755 "${pkgdir}/${_opt}"
  cp -a "${srcdir}/deb/root/opt/Outline/." \
        "${pkgdir}/${_opt}"

  install -dm755 "${pkgdir}/usr/share/applications"
  cp -a "${srcdir}/deb/root/usr/share/applications/." \
        "${pkgdir}/usr/share/applications/"

  install -dm755 "${pkgdir}/usr/share/icons"
  cp -a "${srcdir}/deb/root/usr/share/icons/." \
        "${pkgdir}/usr/share/icons/"

  # Set new executable name for .desktop file
  local _desktop="${pkgdir}/usr/share/applications/Outline.desktop"
  if ! grep -q '^Exec=/opt/Outline/Outline' "${_desktop}"; then
    error "Unexpected Exec entry in Outline.desktop"
    return 1
  fi
  sed -i "s|^Exec=/opt/Outline/Outline|Exec=${_link}|" "${_desktop}"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "${_executable}" "${pkgdir}/${_link}"

  # Fix application RUNPATH
  /usr/bin/patchelf --set-rpath "${_opt}" "${pkgdir}/${_executable}"

  # From electron's hint:
  #   > The SUID sandbox helper binary was found, but is not configured correctly.
  #   > Rather than run without sandboxing I'm aborting now. You need to make sure
  #   > that /opt/Outline/chrome-sandbox is owned by root and has mode 4755.
  #
  # https://github.com/electron/electron/issues/42510
  # Preserve the SUID permissions configured by the original .deb package
  /usr/bin/chmod 4755 "${pkgdir}/${_opt}/chrome-sandbox"
}
