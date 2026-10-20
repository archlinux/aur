# Maintainer: y0no <2242427+y0no@users.noreply.github.com>

pkgname=elixiroffice-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Offline office suite with a Microsoft Office-style interface (beta)"
arch=('x86_64')
url="https://github.com/leag1234/elixiroffice"
license=('AGPL-3.0-only')

depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libglvnd'
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
makedepends=('libarchive')
provides=("elixiroffice=${pkgver}")
conflicts=('elixiroffice')
options=('!debug' '!strip')

_deb="ElixirOffice-${pkgver}-linux-amd64.deb"
source_x86_64=("${url}/releases/download/v${pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums_x86_64=('e343307849cfe980193152fb04cb72a252ce270697950dd968c1d649c486bdca')

package() {
  bsdtar -xOf "${srcdir}/${_deb}" data.tar.gz |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # The upstream Debian payload includes group-writable system directories.
  chmod -R go-w "${pkgdir}/opt" "${pkgdir}/usr"
  find "${pkgdir}/opt" "${pkgdir}/usr" -type d -exec chmod 755 {} +

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/ElixirOffice/elixiroffice "${pkgdir}/usr/bin/elixiroffice"
  sed -i 's|^Exec=.*|Exec=elixiroffice %U|' \
    "${pkgdir}/usr/share/applications/org.elixiroffice.desktop.desktop"

  # Keep Chromium sandboxed even when unprivileged user namespaces are disabled.
  chmod 4755 "${pkgdir}/opt/ElixirOffice/chrome-sandbox"
}
