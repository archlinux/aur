# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=mitamae
pkgver=1.14.1
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
sha512sums=('978cee70b9c8c0ea6a1b6e7591a5060289f2eb71bcb888d14eca69736e70156081f91358c8b91272ed95a991a8c34dc73fd33d8148214bfc27a2f0d0e34a8b2a'
            '8f5f3b1d121f0b9ae00a34ac4275b6ab8b518a4f7df64691210ea367a0203c57f73f4bea656fe161a2b0df988ac33ad81ad243e850b9fbf623bac8f431999238'
            '29841758595be5bc5043e5d03c4156217a69790c87cc2f87a2949d88450679c7bc58239c4c8345b2d511b382fb9955de6633f03788c59497d582cb18d23f863c')
