# Maintainer: Andrew Lin <andrewlin16 at gmail dot com>
# Contributor: Simon Thorpe <simon at hivetechnology dot com dot au>
pkgname=openmpt
pkgver=1.30.12.00
pkgrel=1
pkgdesc="Open-source audio module tracker"
arch=('i686' 'x86_64')
url="https://openmpt.org/"
license=('BSD')
depends=('wine')
makedepends=('gendesk' 'imagemagick' 'unzip')
optdepends=(
  'bash-completion: tab completion support'
  'ccache: for Wine native host support'
)
source=(
  'openmpt'
  'openmpt-bash-completion'
  'x-mptm.xml'
)
source_i686=("$pkgname-$pkgver.zip::https://download.openmpt.org/archive/openmpt/$(echo $pkgver | grep -Po '^\d+.\d+')/OpenMPT-$pkgver-portable-x86.zip")
source_x86_64=("$pkgname-$pkgver.zip::https://download.openmpt.org/archive/openmpt/$(echo $pkgver | grep -Po '^\d+.\d+')/OpenMPT-$pkgver-portable-amd64.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=(
  '8b3da74d09640985e324441e459d0ac43f956dd95b89e0003b0ad2df46742685'
  '602639496997a74fab0914b1cff519dff207524ba0adf516ecc55466a4e83253'
  '44065d91a46203dae1378d6d99e70d882d28f66e3a584236242937856a9a8d56'
)
sha256sums_i686=('68e535680788d9cf4fb6b174aeba24d58dc0f0f42a57c552689bcdace49b5ed6')
sha256sums_x86_64=('babbf2db844f81e0c92a9a77dd532ad2d9e2c43e2ba74eac6579359ed446a788')

prepare() {
  cd "$srcdir"
  mkdir -p "$pkgname-$pkgver"
  unzip -o -d "$pkgname-$pkgver" "$pkgname-$pkgver.zip"

  convert "$pkgname-$pkgver/OpenMPT File Icon.ico" "icon.png"
  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name='OpenMPT' \
    --mimetype='audio/x-mod;audio/x-s3m;audio/x-xm;audio/x-it;audio/x-mptm' \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  mkdir -p "$pkgdir/usr/share"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/openmpt"
  # Since OpenMPT 1.29, portable installations are identified by the presence of the "OpenMPT.portable" file.
  # That file is removed here to keep existing installations configured properly.
  rm "$pkgdir/usr/share/openmpt/OpenMPT.portable"
  install -Dm755 "$srcdir/openmpt" "$pkgdir/usr/bin/openmpt"
  install -Dm644 "$srcdir/icon-2.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/x-mptm.xml" "$pkgdir/usr/share/mime/application/x-mptm.xml"
  install -Dm644 "$srcdir/openmpt-bash-completion" "$pkgdir/usr/share/bash-completion/completions/openmpt"
}

# vim:set ts=2 sts=2 sw=2 et:
