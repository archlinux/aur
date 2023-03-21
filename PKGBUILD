# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

_pkgname='catt'
pkgname="$_pkgname-git"
pkgver=0.12.10.r1.g82cd0fe
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
  depends+=(
    'python-click'
    'python-importlib-metadata'  # silence namcap warning
    'python-pychromecast'
    'yt-dlp'
  )

  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}
