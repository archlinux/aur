# Maintainer: Fanch
# Co-Maintainer: Mark Wagie <mark.wagie at tutanota dot com>
pkgname=x-tile-git
pkgver=3.3.r4.g76faafc
pkgrel=1
pkgdesc="Allows you to select a number of windows and tile them in different ways"
arch=('any')
url="https://www.giuspen.com/x-tile"
license=('GPL2')
depends=('gtk3' 'python-gobject')
makedepends=('git')
checkdepends=('desktop-file-utils' 'appstream-glib')
optdepends=('libappindicator-gtk3: AppIndicator3 support'
            'libayatana-appindicator: AyatanaAppIndicator3 support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/giuspen/x-tile.git'
        "${pkgname%-git}.appdata.xml")
sha256sums=('SKIP'
            'a9c22562ba580ed58f2a88925cf1032c4beea9236a499a75545709a2695f15f1')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  desktop-file-validate "linux/${pkgname%-git}.desktop"
  appstream-util validate-relax --nonet "$srcdir/${pkgname%-git}.appdata.xml"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir/${pkgname%-git}.appdata.xml" -t "$pkgdir/usr/share/metainfo"
}
