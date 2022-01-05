# Maintainer: fubarhouse
pkgname=pygmy-legacy
provides=(pygmy-legacy)
pkgver=0.9.11
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/amazeeio/pygmy"
license=('MIT')
depends=('ruby2.6')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amazeeio/pygmy/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('47f5a8783c592e2c5b680482108eb6172a3962d4f7b7cfde77d23d24c1396c0a812f6ce895beec6e0f7c4701fdf14252ee0e2b0ee0e156c58fd6175337e5a07f')

build() {
  cd "pygmy-${pkgver}"
  sed -i "s/'pygmy'/'pygmy-legacy'/" ./pygmy.gemspec
  mv ./bin/pygmy ./bin/pygmy-legacy
  gem-2.6 build "pygmy.gemspec" -o "${pkgname}-${pkgver}.gem"
}

package() {
  local _gemdir="$(ruby-2.6 -e'puts Gem.default_dir')"
  install -D -m644 "pygmy-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  gem-2.6 install --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pygmy-${pkgver}/${pkgname}-${pkgver}.gem"
}

