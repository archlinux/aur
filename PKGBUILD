# Maintainer: FoxTune contributors <niko.huuskonen.00@gmail.com>
#
# The AUR's foxtune-bin: the Linux tarball of a GitHub release, installed where
# the .deb and .rpm put it (see ../nfpm.yaml). .github/workflows/aur.yml
# publishes it when a release is published, and sets pkgver and the checksum
# then - see "Releasing" in BUILDING.md.

pkgname=foxtune-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Open source ECU tuning for Speeduino and rusEFI'
arch=('x86_64')
url='https://github.com/N1kO23/FoxTune'
license=('GPL-3.0-only')
# What the bundle's binaries link against, by package.
depends=(
  'at-spi2-core' 'cairo' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
  'harfbuzz' 'libepoxy' 'libgcc' 'libstdc++' 'pango' 'zlib'
)
optdepends=('xdg-desktop-portal: file dialogs, with the backend for your desktop')
provides=('foxtune')
conflicts=('foxtune')
# Prebuilt: stripping can damage the Dart snapshot in lib/libapp.so, and there
# are no debug symbols to split out.
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/foxtune-linux-x64-$pkgver.tar.gz")
sha256sums=('6777d2a40e9f42a98b6f2ad8f881be9736e45841ba19cebb246693ab3ba877f6')

package() {
  cd foxtune

  # The bundle stays together: the executable finds its libraries and assets
  # beside itself, through the /usr/bin link too.
  install -d "$pkgdir/usr/lib/foxtune" "$pkgdir/usr/bin"
  cp -a --no-preserve=ownership foxtune lib data "$pkgdir/usr/lib/foxtune/"
  ln -s /usr/lib/foxtune/foxtune "$pkgdir/usr/bin/foxtune"

  install -Dm644 data/com.foxtune.foxtune_app.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 data/com.foxtune.foxtune_app.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  cp -a --no-preserve=ownership data/icons "$pkgdir/usr/share/"
}
