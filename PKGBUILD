# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy
pkgver=2022.6.1
pkgrel=1
epoch=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('libxinerama' 'pyside2' 'python' 'python-cairosvg' 'python-click' 'python-colorama'
         'python-coloredlogs' 'python-psutil' 'python-pynput' 'python-qtpy'
         'scrcpy')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry' 'setconf')
optdepends=('usbaudio: audio mirroring for Android <8.0'
            'sndcpy: audio mirroring for Android >=10')
_commit=8903d0b18ebebc0111d107d9375a3cb79db903d0  # tags/v2022.6.1^0
source=("git+https://github.com/srevinsaju/guiscrcpy.git#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('7427D25413635E1E39657B6B1007816766D390D7') # Srevin Saju (srevinsaju) <srevinsaju@sugarlabs.org>

pkgver() {
  cd "$srcdir/$pkgname"
  printf "$(sed -n '/version/{s/.*"\([0-9\.]*\).*"/\1/p;q}' pyproject.toml)"
}

prepare() {
  cd "$srcdir/$pkgname"

  # Force launching with PySide2
  setconf "appimage/$pkgname.desktop" Exec 'env QT_API=pyside2 guiscrcpy'
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "appimage/$pkgname.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "appimage/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  for size in 128 256; do
    install -Dm644 appimage/${pkgname}-${size}.png -t \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
  done
}
