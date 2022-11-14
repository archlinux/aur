# Maintainer: Tuhana GAYRETLİ <aur at tuhana dot me>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154

pkgname=kde-material-you-colors-git
_pkgname=${pkgname%-git}
pkgver=1.0.0.r55.gc076374
pkgrel=1
pkgdesc='Automatic Material You Colors generator from your wallpaper for the Plasma Desktop - Git testing branch version'
arch=(x86_64)
url='https://github.com/luisbocanegra/kde-material-you-colors/tree/testing'
license=(GPL3)
makedepends=(git)
depends=(
  dbus-python
  python-numpy
  python-material-color-utilities
)
optdepends=(
  'python-colr: colored hex codes printing'
  'python-pywal: theme other programs using Material You Colors'
)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname::git+${url/\/tree\/testing/}.git#branch=testing")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/src"
  python -m compileall ./**/*.py
}

package() {
  cd "$srcdir/$pkgname/src"

  install -Dm644 -t "$pkgdir/usr/share/applications" ./*.desktop
  install -Dm644 -t "$pkgdir/usr/lib/$_pkgname" ./sample_config.conf
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname" ./{*.py,$_pkgname}
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/utils" ./utils/*.py
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" ../README.md
}
