# Maintainer: meichthys <github.com at meichthys dot com>

pkgname=andbible-dev-bin
_pkgname=andbible
pkgver=6.0.1259
pkgrel=1
# Upstream tags releases as <channel>-<build>, e.g. beta-1257.
_channel=beta
_build=${pkgver##*.}
pkgdesc='Offline Bible study app (beta channel)'
arch=('x86_64')
url='https://andbible.org'
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2'
  'glib2' 'glibc' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libgcc' 'libglvnd'
  'libstdc++' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage'
  'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender'
  'libxtst' 'libxxf86vm' 'mesa' 'nspr' 'nss' 'pango' 'xdg-utils' 'zlib'
)
optdepends=(
  'xdg-desktop-portal: native file chooser and notifications'
  'org.freedesktop.secrets: keep sync account passwords in the system keyring'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# Prebuilt jpackage image with its own Java runtime and Chromium (CEF).
options=('!strip' '!debug')
source=("https://github.com/AndBible/and-bible/releases/download/${_channel}-${_build}/${_pkgname}-desktop-${_channel}-${_build}-amd64.deb")
sha256sums=('63b29464eb527c947172c13288ac97e99af5ff84d7e7edb7f0af441b91ee2672')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"

  local _app="$pkgdir/opt/$_pkgname"

  # The deb registers its desktop entry from a postinst script; ship it directly instead.
  sed -e "s|^Exec=.*|Exec=$_pkgname %F|" \
      -e "s|^Icon=.*|Icon=$_pkgname|" \
      "$_app/lib/$_pkgname-$_pkgname.desktop" > "$_pkgname.desktop"
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_app/lib/$_pkgname.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  rm "$_app/lib/$_pkgname-$_pkgname.desktop"

  # share/doc only holds the GPL text, which the licenses package already provides.
  rm -r "$_app/share"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
