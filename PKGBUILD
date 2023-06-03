# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

_pkgname='catt'
pkgname="$_pkgname-git"
pkgver=0.12.11.r4.g305b832
pkgrel=1
pkgdesc='Cast All The Things - Send videos from many, many online sources to your Chromecast.'
arch=('any')
url="https://github.com/skorokithakis/catt"
license=('BSD')
depends=()
makedepends=(
  'git'
  'python-installer'
  'python-poetry'
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
  depends+=(
    'python-click'
    'python-importlib-metadata'  # silence namcap warning
    'python-pychromecast'
    'yt-dlp'
  )

  cd "$_pkgname"
  install -vDm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
