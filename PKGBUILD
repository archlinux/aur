# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ouo
pkgver=r18.gfd76750
pkgrel=1
pkgdesc='Reverse engineered Ultima Online: The Second Age server'
arch=(x86_64)
url='https://github.com/draxinar/ouo'
license=(MIT)
depends=(glibc sh)
makedepends=(git cmake ninja)
backup=(etc/default/ouo)
options=(!debug !buildflags)
install=ouo.install
source=(
  "$pkgname::git+$url#commit=fd767502e2ab8d5b46b5855c542df8a7bdbb9a64"
  sysusers.conf
  tmpfiles.conf
)
sha512sums=('5cc335b60af78ad70052481f4bb8be2dfc3f95bd1e0b5b5fe5931f8349e4ca8fd8ff98d1739be05bc18d57a6c3747f50414149adc796050d407e81ed2aed3293'
            '092eee8bde1e2f0a9efff0f95a1c9439d7740dfdde12262ab54bf21afa06263a39c8238b8abd742ec2e3bcfc19ef37073fbcd8d249d45dcc3724fa6099828cad'
            '44c1eed249e4f9d486b0ff330bc5556be996f44bb3e6ff087cd098c2a798cae0635e477375e9c504547f97b83a2a8e5a5730ff580cb2e6fa5e2f6db5ebe20065')
b2sums=('314aa0d0b37cc04bcc158179403f26857899f0593aa36080080ba28ba629024dee0cef843a11ca5fcb615f26ca33af54045521610b0b5cdebd1bea22a8bdf509'
        'dfe261bb1149f279b2ae4566ac76b30ef5ecb6686fcf033b621beb62844b5238c8caefc43b5634870b762d0659511c23d9c636ae47625d4e2cc622b92bf4ace7'
        '5eb6123b1e7e412ebe2fd4a2adbdd5846d04efd77319001813c4158eac0804f1891cb9405bd7ece744ae105aefdb816aabdb85216cdb63d62f3b4820ab84d6a8')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  make
}

package() {
  # systemd integration
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/systemd/sysusers.d/ouo.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/systemd/tmpfiles.d/ouo.conf"

  cd "$pkgname"

  DESTDIR="$pkgdir" make install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
