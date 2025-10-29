# Maintainer: Larslol140 <lars@larslol140.com>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
pkgname=tiny-media-manager
pkgver=5.2.3
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="https://www.tinymediamanager.org/"
license=('Apache')
depends=(
  'libmediainfo'
)
install=tinyMediaManager.install
noextract=("tmm_${pkgver}_linux.tar.xz")
source=("tmm_${pkgver}_linux.tar.xz::https://archive.tinymediamanager.org/v${pkgver}/tinyMediaManager-${pkgver}-linux-amd64.tar.xz"
        "tinyMediaManager.desktop"
        "tinymediamanager"
        "tinymediamanager-cli")

sha256sums=('7d7615dce2938879a9e268d6fbb077e8a75837552e256865aca416aeec890170'
            '24e9538f8fcb6fcb7db954efca66354177d09bdc58bc28a91e481475c2044c36'
            'd97b2206915a882c034149f3fa097445bb8bb350441bf8fdf331245e11be4f6c'
            'd6cc87cf9166f0c47940ffa6c279a9c2bc237533ebf38afb2a387532019f5675')

prepare() {
  sed -i "s|HOME_DIR|${HOME}|" "${startdir}/tinyMediaManager.install"
  sed -i "s/VERSION/${pkgver}/" "${startdir}/tinyMediaManager.desktop"
}

package() {
  destpath="$pkgdir/usr/share/$_gitname"
  mkdir -p "$destpath"
  tar -xvf "tmm_${pkgver}_linux.tar.xz" --directory "$destpath" --strip-components 1

  # Fix template permissions
  chmod 755 $destpath/templates
  find $destpath/templates -type d -exec chmod 755 {} \;
  find $destpath/templates -type f -exec chmod 644 {} \;

  # Install desktop entry
  install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"
  install -D "$destpath/tmm.png" "$pkgdir/usr/share/pixmaps/tmm.png"

  # Install launch scripts
  install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
  install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}

