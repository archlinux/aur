# Maintainer: czyt <czytcn@gmail.com>

pkgname=neoko-terminal-desktop-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Native neoko-terminal client: local and remote terminal with Relay pairing (GTK 4)"
arch=('x86_64')
url="https://github.com/lazycat-contrib/lazycat-neko-webshell"
# The app binary is MIT-licensed but built from a private source repository;
# it embeds ghostty (MIT) and NSH/ZXing (Apache-2.0).
license=('MIT' 'Apache-2.0')
depends=(
  'cairo' 'dbus' 'fontconfig' 'gcc-libs' 'glibc' 'graphene' 'gstreamer'
  'gst-plugins-base-libs' 'gtk4' 'harfbuzz' 'pango'
)
optdepends=('gnome-keyring: credential storage via the Secret Service API')
provides=('neoko-terminal' 'neko-remoted-desktop')
conflicts=('neoko-terminal' 'neko-remoted-desktop')
options=('!strip' '!debug')

_deb="neoko-terminal-${pkgver}-x86_64-unknown-linux-gnu.deb"
source_x86_64=("${_deb}::${url}/releases/download/neoko-terminal-desktop-v${pkgver}/${_deb}")
sha256sums_x86_64=('cbd8fc6eb2a4a735d9e4c9d2052add6cf950ee9fcf8f7b59d1bd72673a8058cf')
noextract=("${_deb}")

package() {
  local _data_archive
  _data_archive=$(bsdtar -tf "${srcdir}/${_deb}" | awk '/^data\.tar(\.|$)/ { print; exit }')
  [[ -n "$_data_archive" ]] || return 1
  bsdtar -xOf "${srcdir}/${_deb}" "$_data_archive" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}" || return 1

  # The upstream licenses (app, ghostty, NSH, ZXing) belong under
  # /usr/share/licenses on Arch; the build metadata stays in .../doc.
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/neoko-terminal/licenses"/* \
     "${pkgdir}/usr/share/licenses/${pkgname}/"
  rmdir "${pkgdir}/usr/share/doc/neoko-terminal/licenses"
}
