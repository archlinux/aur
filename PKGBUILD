
# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike <team@archstrike.org>

pkgname=onionscan-git
pkgver=20170225.r130
pkgrel=1
pkgdesc="Tool to scan onion services(git version)"
arch=('armv6h' 'armv7h' 'x86_64' 'i686' 'aarch64')
url="https://github.com/s-rah/onionscan"S
license=("MIT")
depends=('libexif')
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/s-rah/onionscan")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%s.r%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)"
}

build() {
  cd $pkgname
  GOPATH="$srcdir" go get -d -t github.com/s-rah/onionscan
  GOPATH="$srcdir" go build -o ${pkgname} -v github.com/s-rah/onionscan 
}

package() {
  cd $pkgname
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -Dm755 ${pkgname} $pkgdir/usr/bin/onionscan
  for i in config  crawldb  deanonymization  design  doc  model  onionscan  protocol  report  spider  templates  utils  webui; do cp -a --no-preserve=ownership $i "$pkgdir/usr/share/$pkgname/$i"; done
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
