# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ouo
pkgver=r39.g41513ae
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
  "$pkgname::git+$url#commit=41513aeda0aa7a4e3db6fceb9f80a83c0c9e1d49"
  sysusers.conf
  tmpfiles.conf
)
sha512sums=('0cbfd90e0aa2f8399747a9216da17ba43370ba3f26b094a013a9f21cbd842fd0a4f7acde5f66dd8567f5f1baac48fece24aa130ab2a8e8a9407620e2683922d7'
            '092eee8bde1e2f0a9efff0f95a1c9439d7740dfdde12262ab54bf21afa06263a39c8238b8abd742ec2e3bcfc19ef37073fbcd8d249d45dcc3724fa6099828cad'
            '44c1eed249e4f9d486b0ff330bc5556be996f44bb3e6ff087cd098c2a798cae0635e477375e9c504547f97b83a2a8e5a5730ff580cb2e6fa5e2f6db5ebe20065')
b2sums=('728b0ccc39fcf07f9e4bb7ca5522502a9506dc8c8630f1131402e2bc3135e97c2d0ff7a4d5c330b90cfa13bf5557aee7b7637f43a5d0a50a42b682f145f2340a'
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
