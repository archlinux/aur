# Maintainer: fullarnoldostupi

pkgname=espanso-wayland-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A Privacy-first, Cross-platform Text Expander (Wayland, Debian binary)"
arch=('x86_64')
url="https://espanso.org"
license=('GPL-3.0-only')
depends=('wl-clipboard' 'libxkbcommon' 'dbus' 'wxwidgets-gtk3' 'openssl')
optdepends=('kdotool: window activation support on KDE Wayland')
provides=('espanso')
conflicts=('espanso' 'espanso-wayland' 'espanso-wayland-git' 'espanso-x11' 'espanso-x11-bin' 'espanso-x11-git')
source=("https://github.com/espanso/espanso/releases/download/v${pkgver}/espanso-debian-wayland-amd64.deb")
sha256sums=('d7b7c9118b77e5975aebb930836d8cf33f0ef81106daaad3425e327d9755d19d')
install='espanso-wayland-bin.install'

package() {
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}/"

  # Set required capabilities for /dev/input access
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf" <<EOF
g input - -
EOF

  # Remove Debian-specific files
  rm -rf "${pkgdir}/usr/share/doc"
  rm -rf "${pkgdir}/usr/share/lintian"
}

post_install() {
  setcap "cap_dac_override+p" /usr/bin/espanso
}
