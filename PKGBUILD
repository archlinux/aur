# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

_pkgname='catt'
pkgname=$_pkgname-git
pkgver=0.12.9.r7.gddc5989
pkgrel=1
pkgdesc='Cast All The Things - Send videos from many, many online sources to your Chromecast.'
arch=('any')
url="https://github.com/skorokithakis/catt"
license=('BSD')
depends=()    # needed to run *and* build
_rundepends=( # needed to run, but not build
  'python-click'
  'python-pychromecast>=7.5.0'
  'yt-dlp'
)
makedepends=(
  'git'
  'python-installer'
  'python-poetry'
  'python-setuptools'
)
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=(${provides[@]})

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m poetry build --format wheel
}

package() {
  depends=(${_rundepends[@]})  # needed to run, but not build

  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}
