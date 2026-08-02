# Maintainer: Carlos Daniel Robaina Rivero <orlando260501@gmail.com>
pkgname=subhunter
pkgver=1.4.0
pkgrel=1
pkgdesc="Automatic subtitle downloader for movies and TV series (GUI)"
arch=('any')
url="https://github.com/Hyzokaaa/SubHunter"
license=('MIT')
depends=('python' 'tk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hyzokaaa/SubHunter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e188238a1f3b4d29d922e165ff3af7f3af2f6c2b859df32561c3fd53b2b58ed')

package() {
  cd "$srcdir/SubHunter-$pkgver"

  local venv="$pkgdir/opt/$pkgname/venv"
  python -m venv --symlinks "$venv"
  "$venv/bin/pip" install --no-cache-dir --upgrade pip
  "$venv/bin/pip" install --no-cache-dir .

  # pip bakes the build-time staging path ($pkgdir/opt/...) into the
  # shebang of the generated launcher script, which doesn't exist once
  # installed. Point it at the real runtime path instead.
  sed -i "1s|^#!.*|#!/opt/$pkgname/venv/bin/python|" "$venv/bin/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/venv/bin/subhunter" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=SubHunter
Comment=Automatic subtitle downloader for movies and TV series
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=AudioVideo;Video;Utility;
EOF
}
