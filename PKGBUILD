# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

_pkgname="catt"
pkgname="$_pkgname-git"
pkgver=0.12.12.r0.g52a2a10
pkgrel=1
pkgdesc='Cast All The Things - Send videos from many, many online sources to your Chromecast.'
url="https://github.com/skorokithakis/catt"
license=('BSD-2-Clause')
arch=('any')

depends=('python')
makedepends=(
  'git'
  'python-installer'
  'python-poetry'
)

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m poetry build --format wheel
}

package() {
  depends+=(
    'python-click'
    'python-pychromecast'
    'yt-dlp'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
