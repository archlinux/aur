# Maintainer: Joakim Reinert <mail+aur@jreinert.com>
_name=audition
pkgname=${_name}-git
pkgver=r1.7f43782
pkgrel=2
pkgdesc="Simple now-playing server"
arch=(i686 x86_64)
url='https://github.com/jreinert/audition'
license=(MIT)
depends=('gc' 'libevent' 'pcre')
makedepends=('git' 'crystal' 'shards')
conflicts=('audition-bin')
provides=('audition')
source=(
    "${_name}::git+https://github.com/jreinert/audition"
    audition.service
)
install="$pkgname.install"

sha512sums=(
    SKIP
    f8e89fad14a3ba3cf030fa64bbd12edb2bbab8b82a897beda53a545bf6fdb4d1c34e2d2ae7cd9204b3b342a84038c7151ec49ed6b5640da0d266146ed63eb4ff
)

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_name"
  shards
  shards build --release
}

package() {
  cd "$_name"
  install -Dm755 bin/audition "$pkgdir/usr/bin/audition"
  install -Dm644 audition.service "$pkgdir/usr/lib/systemd/system/audition.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
