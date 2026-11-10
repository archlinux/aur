# Maintainer: Kenny <onlyusemycontroler@gmail.com>
#
# The prebuilt binaries from the release page: built in a Debian 12 container
# and checked to need no glibc newer than 2.35, so they run on anything newer. For a source build, see
# `lightforge`.

pkgname=lightforge-bin
pkgver=1.0.0beta.11
pkgrel=1
# See the note in the `lightforge` PKGBUILD for why the version loses its
# hyphen here.
_tag=v1.0.0-beta.11
pkgdesc='Install, update and play World of Warcraft on Linux, and a home for all your other Battle.net games'
arch=('x86_64')
url='https://github.com/LightforgeProject/lightforge'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig' 'systemd-libs' 'python')
optdepends=(
  'lib32-gnutls: 32-bit runtime for Battle.net (needs multilib)'
  'lib32-freetype2: 32-bit runtime for Battle.net (needs multilib)'
  'lib32-vulkan-icd-loader: 32-bit runtime for Battle.net (needs multilib)'
  'mangohud: the in-game overlay Lightforge can enable per game'
)
provides=("lightforge=$pkgver")
conflicts=('lightforge')
# The binaries arrive stripped. Without this `makepkg` strips them again and
# builds an empty `-debug` package out of what it does not find.
options=('!debug' '!strip')
source=("lightforge-${_tag#v}-x86_64-linux.tar.gz::$url/releases/download/$_tag/lightforge-${_tag#v}-x86_64-linux.tar.gz")
# Of the tarball attached to the v1.0.0-beta.11 release, as published in its
# SHA256SUMS. Regenerate with `updpkgsums` if the artifacts are ever rebuilt.
sha256sums=('af8415f1b5b718da4b9287dc3901384e6e96ea490e635a68974625aa4a1397c9')
_srcdir="lightforge-${_tag#v}"

package() {
  cd "$_srcdir"

  install -Dm755 lightforge-gui "$pkgdir/usr/bin/lightforge-gui"
  install -Dm755 lightforge     "$pkgdir/usr/bin/lightforge"

  install -Dm644 pro.tuxcore.Lightforge.desktop \
    "$pkgdir/usr/share/applications/pro.tuxcore.Lightforge.desktop"
  install -Dm644 pro.tuxcore.Lightforge.metainfo.xml \
    "$pkgdir/usr/share/metainfo/pro.tuxcore.Lightforge.metainfo.xml"

  local size
  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "icons/hicolor/${size}x${size}/apps/pro.tuxcore.Lightforge.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/pro.tuxcore.Lightforge.png"
  done
  install -Dm644 icons/hicolor/scalable/apps/pro.tuxcore.Lightforge.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pro.tuxcore.Lightforge.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    README.md RELEASES.md TROUBLESHOOTING.md CLI.md
}
