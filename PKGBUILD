# Maintainer: Aspen <169401290+Aspenini@users.noreply.github.com>

pkgname=aurpush
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for maintaining and publishing Arch Linux packages to the AUR"
arch=('x86_64')
url="https://github.com/Aspenini/aurpush"
license=('MIT')
depends=('git' 'openssh')
makedepends=('xmake')
options=('!debug')

# In-repo copy: if ../xmake.lua exists, build from this tree instead of GitHub.
_local_tree=
if [[ -f ../xmake.lua ]]; then
  _local_tree="$(cd .. && pwd)"
fi

if [[ -n $_local_tree ]]; then
  source=()
  sha256sums=()
else
  source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
  sha256sums=('SKIP')
fi

prepare() {
  if [[ -n $_local_tree ]]; then
    mkdir -p "$pkgname-$pkgver"
    cp -a "$_local_tree"/{include,src,tests,xmake.lua,LICENSE,README.md} "$pkgname-$pkgver/"
  fi
}

build() {
  cd "$pkgname-$pkgver"
  xmake config -y -P . -m release
  xmake -y -P .
}

package() {
  cd "$pkgname-$pkgver"
  xmake install -y -P . --root --headers=n --libraries=n -o "$pkgdir/usr" aurpush
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
