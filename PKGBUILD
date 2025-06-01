# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
pkgname='videokit-kde'
pkgver=0.2.3
pkgrel=1
pkgdesc="KDE video utility suite that extends Dolphin context menus for transcoding, metadata, etc."
arch=('any')
url="https://github.com/TomB16/videokit-kde"
license=('MIT')
depends=('ffmpeg' 'mediainfo' 'bash' 'crudini' 'bashdev')  # Add any runtime deps here
makedepends=('git')
source=("git+https://github.com/TomB16/videokit-kde.git#branch=master")  # Fetch from GitHub repo
sha256sums=('SKIP')  # Don't need this when using Git as source


#pkgver() {
#  cd "$srcdir/$pkgname"
#  git describe --tags --always | sed 's/^v//;s/-/./g'
#}


package() {
  cd "$srcdir" || return 1

  # Install scripts

  for f in "$srcdir/$pkgname/src/"*; do
    install -Dm755 "$f" "$pkgdir/usr/bin/$(basename "$f")"
  done


  # Install .desktop file
  install -Dm644 "$srcdir/$pkgname/videokit.desktop" "$pkgdir/usr/share/kio/servicemenus/videokit.desktop"

  # Install config file
  install -Dm644 "$srcdir/$pkgname/videokit.conf" "$pkgdir/usr/share/videokit/videokit.conf"

  # License
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Rebuild KDE service cache
  if command -v kbuildsycoca5 &> /dev/null; then kbuildsycoca5; fi
  if command -v kbuildsycoca6 &> /dev/null; then kbuildsycoca6; fi

}
