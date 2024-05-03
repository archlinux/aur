# Maintainer: jose <jose1711 gmail com>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: B4SH-B00STER

pkgname=youtube-dl-gui-git
pkgver=1.8.5.r57.g574ed2e
pkgrel=1
pkgdesc="Cross platform front-end GUI of the popular youtube-dl written in wxPython"
arch=('any')
url="https://github.com/oleksis/youtube-dl-gui"
license=('custom:UNLICENSE')
# xdg-utils: xdg-open to open and play a file
depends=('python-pypubsub' 'python-wxpython' 'xdg-utils')
optdepends=('ffmpeg: convert video files to audio-only files'
            'youtube-dl: alternative to the program downloaded by youtube-dl-gui')
makedepends=('git' 'python-polib' 'python-setuptools')
provides=(${pkgname%-git})
# conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python setup.py build_trans install --root="$pkgdir" --optimize=1    # --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm644 yt-dlg.desktop -t "$pkgdir/usr/share/applications"

  find $pkgdir/usr/share/icons $pkgdir/usr/share/pixmaps -name youtube-dl-gui.png | while read -r i
  do
    mv $i "${i%.png}-wx.png"
  done

  sed -i '/^Icon/s/$/-wx/' "$pkgdir/usr/share/applications/yt-dlg.desktop"
}
