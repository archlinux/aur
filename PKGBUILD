# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.2.0
pkgrel=1
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('ruby' 'git')
_mruby_sha1=10bb7ad693e7c7443de924a39c1fedb4461108ba
source=("https://github.com/k0kubun/${pkgname}/archive/v${pkgver}.tar.gz"
        "mruby-${_mruby_sha1}.tar.gz::https://github.com/k0kubun/mruby/archive/${_mruby_sha1}.tar.gz"
        'build_config.rb'
        'https://patch-diff.githubusercontent.com/raw/k0kubun/mitamae/pull/29.patch'
        )

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/29.patch"
  rmdir mruby
  tar xf "$srcdir/mruby-${_mruby_sha1}.tar.gz"
  mv "mruby-${_mruby_sha1}" mruby
}

build() {
  cd "$pkgname-$pkgver"

  cp "$srcdir/build_config.rb" .
  mruby/minirake compile
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 mruby/build/host/bin/mitamae "$pkgdir/usr/bin/"
  install -m755 mruby/build/host/bin/mitamae-secrets "$pkgdir/usr/bin/"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

sha512sums=('7ecf5e6cc777bc157cd82ab7e453ecce6a0fbf4f54dffde2027d31751b95b9169c774b5f913553bbe40bc48448f109e3a69bfddd4a27311dff91bc4632b8f76c'
            '6c07592f3c797570649a1f88bd9328a52bb789d227437747a912a742635f8d238b52777da8e9447cccbc9187c97fed17a9cbd84718bc44405fde5e7e0443ce4d'
            '8910ff0a465e821021de68713161c0a43ad6344a868430c6b8c1384ab1d50980968bedc3feb26cdb48556e318015784e9c11325495184da5358aa61143b0e4aa'
            'a4f983cd6232727e6de233ab0c10eded1a377c2d763878c3db658cabcdbe4f8c5c4dc683ec7b486a01ba510c31bc8df86b450f373317884ba10b04a4d4a221b7')
