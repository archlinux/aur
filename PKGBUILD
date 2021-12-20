# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy
pkgver=4.11.3
pkgrel=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('scrcpy' 'python-pynput' 'python-qtpy' 'python-psutil'
         'python-cairosvg' 'python-click' 'python-colorama' 'libxinerama')
makedepends=('git' 'python-dephell')
optdepends=('usbaudio: audio mirroring for Android <8.0'
            'sndcpy: audio mirroring for Android >=10')
_commit=44da9572c84d16345cae776e0a81812779c5e0ee  # tags/v4.11.3^0
source=("git+https://github.com/srevinsaju/guiscrcpy.git#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('7427D25413635E1E39657B6B1007816766D390D7')
              # Srevin Saju (srevinsaju) <srevinsaju@sugarlabs.org>

pkgver() {
  cd "$srcdir/$pkgname"
  printf "$(sed -n '/version/{s/.*"\([0-9\.]*\).*"/\1/p;q}' pyproject.toml)"
}

prepare() {
  cd "$srcdir/$pkgname"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 "appimage/$pkgname.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "appimage/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "appimage/$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
}
