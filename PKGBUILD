# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=kirc
pkgver=0.3.2
pkgrel=1
pkgdesc='A tiny IRC client written in POSIX C99'
arch=('x86_64')
url='https://github.com/mcpcpc/kirc'
license=('MIT')
depends=('glibc')
makedepends=('git')
_commit='3bb2b8d81000176ce9793de1983f33420b885673'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'skip-clean.patch'
)
b2sums=('SKIP'
        '6c909b297b1c7d397d64f5c33332b16de8d2a166997b7467332de9e9b08e6159aff49e94a820790f482700c58174b7cd715c2eec2f313438cd38f1093e393655')

pkgver() {
  cd "$pkgname"

  git describe --tags
}

prepare() {
  cd "$pkgname"

  # removes the binary when `make install` is invocated due to `clean`
  # being part of `all`
  patch -p1 -i "$srcdir/skip-clean.patch"
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
