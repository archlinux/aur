# Maintainer: Nathan Grilliot nrgrill2003@gmail.com
# Maintainer: Derek Corniello corniedj@mail.uc.edu

pkgname=quick-mouse
pkgver=0.1.2
pkgrel=1
pkgdesc='Wireless mouse using smartphone sensors'
arch=('x86_64')
url='https://github.com/DerekCorniello/quick-mouse'
license=('MIT')
depends=()
makedepends=('go' 'npm' 'openssl')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cd client && npm install && npm run build
  cd .. && go build -o quick-mouse .
  mkdir -p certs
  openssl req -x509 -newkey rsa:4096 \
    -keyout certs/localhost-key.pem \
    -out certs/localhost.pem \
    -days 365 -nodes -subj "/CN=localhost"
}

package() {
  cd "$pkgname"
  install -Dm755 quick-mouse "$pkgdir/usr/bin/quick-mouse"
  install -d "$pkgdir/usr/share/quick-mouse/client"
  cp -r client/build/* "$pkgdir/usr/share/quick-mouse/client/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
