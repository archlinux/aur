# Maintainer: Sorah Fukumori <her@sorah.jp>
_gitname=yenma
pkgname=yenma-git
pkgver=2.0.0.rc1.r3.g19b961b
pkgrel=1
pkgdesc="A milter program for domain authentication technologies (including SPF, DKIM, DMARC)"
arch=('i686' 'x86_64')
depends=('ldns' 'libmilter')
makedepends=('git')
url="https://github.com/iij/yenma"
license=('BSD-2')
source=(
  'git+https://github.com/iij/yenma' 'gh-pr-11.patch'
)
backup=('etc/yemma.conf')
provides=('yemma')
conflicts=()

sha256sums=('SKIP'
            'b473d0d0a3f799191894d90dbbbfc5f7437ba49077aadfb221ffd63f900ae7df')
sha512sums=('SKIP'
            'cf35d925764c1c2858c0dfcd7fc9bbbbd1511286bbafd7ea90d46362b2a5c0c1735fabddf64cdcb2aeda84ec6e63b364244e8d282a2c22e9f6570078dde28b05')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^v//'
}

prepare() {
  cd "$_gitname"
  patch --forward --strip=1 --input="${srcdir}/gh-pr-11.patch"
}

build() {
  cd "$_gitname"

  autoconf
  ./configure --prefix=/usr --with-libmilter=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}
