# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=mitamae
pkgver=1.12.7
pkgrel=2
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('openssl' 'pacman')
makedepends=('ruby-rake' 'git')
_mruby_revision=3.0.0
source=("https://github.com/k0kubun/${pkgname}/archive/v${pkgver}.tar.gz"
        "mruby-${_mruby_revision}.tar.gz::https://github.com/mruby/mruby/archive/${_mruby_revision}.tar.gz"
        "build_config.rb.patch"
        )

prepare() {
  cd "$pkgname-$pkgver"
  patch --strip=1 --input="${srcdir}/build_config.rb.patch"

  tar xf "$srcdir/mruby-${_mruby_revision}.tar.gz"
  mv "mruby-${_mruby_revision}" mruby
}

build() {
  cd "$pkgname-$pkgver"

  rake compile
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 mruby/build/host/bin/mitamae "$pkgdir/usr/bin/"
  install -m755 mruby/build/host/bin/mitamae-secrets "$pkgdir/usr/bin/"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
sha512sums=('b3a0adf229fb21045d5dae70a12f34b02fb6a3f9c4e8a4d9b989e94851822ae3caa319d8e18c8373c184ec9e5831ca19645fcc8cce457d669b5e3a7bc648015e'
            '8f5f3b1d121f0b9ae00a34ac4275b6ab8b518a4f7df64691210ea367a0203c57f73f4bea656fe161a2b0df988ac33ad81ad243e850b9fbf623bac8f431999238'
            '1e732d9e3b809c54c551dde34fda8f0d15dfc178855a8bf770045bc8691b66b15d3d99d99fdec7532329e06c28e334b2f5c2f27592b9cd67e94a68f347c02b4e')
