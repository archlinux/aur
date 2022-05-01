# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrdata
pkgver=6.1.0beta
pkgrel=1
pkgdesc="Decred block explorer"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('git' 'go' 'nodejs' 'npm')
groups=('decred')
url="https://dcrdata.decred.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/decred/$pkgname/tar.gz/release-v6.1.0-beta)
sha256sums=('afc773bb582a3d0b2b4a26414e13cd3305dd5518c9d7d1d1b2ca2555bba7b45f')

prepare() {
  rm -rf "$srcdir/fresh"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname-release-v6.1.0-beta" \
    "$srcdir/fresh"
}

build() {
  msg2 'Building dcrdata and dependencies...'
  export GO111MODULE=on
  cd "$srcdir/fresh/cmd/dcrdata"
  go build -trimpath -v -ldflags "-s -w"  .
  npm clean-install
  npm run build
}

package() {
  msg2 'Installing license...'
  install -Dm 644 "$srcdir/fresh/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrdata"

  msg2 'Installing docs...'
  for _doc in README.md \
              cmd/dcrdata/sample-dcrdata.conf \
              cmd/dcrdata/sample-nginx.conf \
              cmd/dcrdata/sample-rate_limiting.html; do
    install -Dm 644 "$srcdir/fresh/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrdata"
  done

  msg2 'Installing...'
  install -Dm 755 "$srcdir/fresh/cmd/dcrdata/dcrdata" -t "$pkgdir/usr/bin"
  cp -R "$srcdir/fresh/cmd/dcrdata/views" "$srcdir/fresh/cmd/dcrdata/public" "$pkgdir/usr/bin"
}
