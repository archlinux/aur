# Maintainer: Amolith <amolith@secluded.site>
pkgname=psono-bin
pkgver=3.3.3
pkgrel=1
pkgdesc='Password manager for securely storing and sharing sensitive data'
arch=('x86_64')
url='https://psono.com/'
license=('Apache-2.0')
depends=(
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'libepoxy'
  'libgcc'
  'libsecret'
  'libsoup3'
  'libstdc++'
  'pango'
  'webkit2gtk-4.1'
  'which'
  'xdotool'
)
makedepends=('patchelf')
provides=("psono=$pkgver")
conflicts=('psono')
options=('!strip')
source_x86_64=(
  "psono-${pkgver}-amd64.deb::https://package.psono.com/linux/deb/pool/stable/main/p/psono/psono_${pkgver}_amd64.deb"
)
noextract=("psono-${pkgver}-amd64.deb")
b2sums_x86_64=('f47a0fb7f28752a6939d040c28a5aa31389806c390668b0180b256934ffe984f5d407973cb63222d102c926072715a2fa097d55ed25468b72684ad4cf2e0b690')

package() {
  set -o pipefail

  bsdtar -O -xf "psono-${pkgver}-amd64.deb" data.tar.gz |
    bsdtar -C "$pkgdir" -xzf -

  patchelf --set-rpath "\$ORIGIN" "$pkgdir"/opt/psono/lib/lib*_plugin.so

  [[ -x "$pkgdir/opt/psono/psono" ]]
  [[ $(readlink "$pkgdir/usr/bin/psono") == '/opt/psono/psono' ]]
}
