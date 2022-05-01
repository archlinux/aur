# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrdata-git
pkgver=20220501
pkgrel=1
pkgdesc="Decred block explorer"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('nodejs' 'npm' 'git' 'go')
groups=('decred')
url="https://github.com/decred/dcrdata"
license=('ISC')
options=('!strip' '!emptydirs')
source=(git+https://github.com/decred/dcrdata)
sha256sums=('SKIP')
provides=('dcrdata')
conflicts=('dcrdata')

pkgver() {
  date +%Y%m%d
}

prepare() {
  rm -rf $srcdir/checkout
  git clone "$srcdir/dcrdata" "$srcdir/checkout"
}

build() {
  msg2 'Building dcrdata and dependencies...'
  export GO111MODULE=on
  cd "$srcdir/checkout/cmd/dcrdata"
  go build -trimpath -v -ldflags "-s -w"  .
  npm clean-install
  npm run build
}

package() {
  msg2 'Installing license...'
  install -Dm 644 "$srcdir/checkout/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrdata"

  msg2 'Installing docs...'
  for _doc in README.md \
              cmd/dcrdata/sample-dcrdata.conf \
              cmd/dcrdata/sample-nginx.conf \
              cmd/dcrdata/sample-rate_limiting.html; do
    install -Dm 644 "$srcdir/checkout/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrdata"
  done

  msg2 'Installing...'
  install -Dm 755 "$srcdir/checkout/cmd/dcrdata/dcrdata" -t "$pkgdir/usr/bin"
  cp -R "$srcdir/checkout/cmd/dcrdata/views" "$srcdir/checkout/cmd/dcrdata/public" "$pkgdir/usr/bin"
}
