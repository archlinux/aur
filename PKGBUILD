# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy-git
pkgver=4.12.0.r1313.g06c5cf7
pkgrel=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('libxinerama' 'python' 'python-cairosvg' 'python-click' 'python-colorama'
         'python-coloredlogs' 'python-psutil' 'python-pynput' 'python-qtpy>=2.0.0'
         'scrcpy')
makedepends=('git' 'python-dephell')
optdepends=('usbaudio: audio mirroring for Android <8.0'
            'sndcpy: audio mirroring for Android >=10')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.g%s" "$(sed -n '/version/{s/.*"\([0-9\.]*\).*"/\1/p;q}' pyproject.toml)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 appimage/${pkgname%-git}.appdata.xml -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 appimage/${pkgname%-git}.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 appimage/${pkgname%-git}.png -t "$pkgdir/usr/share/pixmaps/"
}
