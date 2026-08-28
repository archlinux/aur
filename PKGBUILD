# Maintainer: Nikita Koptelov <aur@koptelov.me>
pkgname=trustplugin
pkgver=1.4.0.0
pkgrel=1
pkgdesc='Native messaging host for the InfoTeCS electronic signature service'
arch=('x86_64')
url='https://iitrust.ru/trustplugin'
license=('LicenseRef-proprietary')
depends=(
  'bash'
  'dbus'
  'fontconfig'
  'freetype2'
  'glib2'
  'glibc'
  'harfbuzz'
  'libcups'
  'libdrm'
  'libgcc'
  'libglvnd'
  'libice'
  'libinput'
  'libpng'
  'libsm'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxi'
  'libxrender'
  'mesa'
  'mtdev'
  'pcsclite'
  'sqlite'
  'systemd-libs'
  'xdg-utils'
  'zlib'
)
makedepends=('patchelf')
optdepends=(
  'ccid: smart-card reader support'
  'libjpeg6-turbo: JPEG image format support'
  'opensc: additional smart-card tools and drivers'
  'pcsc-tools: smart-card diagnostics'
)
options=('!strip')
source=(
  'trustplugin-linux-debian.deb.sh::https://iitrust.ru/downloads/trustplugin/trustplugin-linux-debian.deb.sh'
  'LICENSE.upstream'
)
noextract=('trustplugin-linux-debian.deb.sh')
sha256sums=(
  'c5ef312bf21116f18a106e43b3228dda0cec8ef99d2575df3563501b1d83c4cb'
  'ade960341b5cc7d662aa44259264410a43b1fdb59e262d32cd050d53571ea618'
)

prepare() {
  local payload_line
  payload_line="$(awk '/^PAYLOAD:$/ { print NR + 1; exit }' "$srcdir/trustplugin-linux-debian.deb.sh")"
  [[ -n "$payload_line" ]]

  tail -n +"$payload_line" "$srcdir/trustplugin-linux-debian.deb.sh" | bsdtar -xf -
  bsdtar -xf "trust-plugin_${pkgver}-1_amd64.deb"
}

package() {
  bsdtar --no-same-owner -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  # $ORIGIN must remain literal for expansion by the dynamic linker.
  # shellcheck disable=SC2016
  patchelf --set-rpath '$ORIGIN/../lib' \
    "$pkgdir/opt/iitrust/trust_plugin/lib/libxml-security-c.so.20.0.4"
  install -Dm644 "$srcdir/LICENSE.upstream" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -rf "$pkgdir/usr/lib64" "$pkgdir/usr/share/mozilla"
}
