# Maintainer M0Rf30

pkgname=dnschain-git
pkgver=344.67c567e
pkgrel=1
pkgdesc="A blockchain-based DNS + HTTP server that fixes HTTPS security, and more!"
arch=(any)
url="https://github.com/okTurtles/dnschain"
license=('MPL')
depends=('coffee-script' 'git' 'nodejs' 'namecoin-core')
conflicts=('dnschain')
replaces=('dnschain')
optdepends=('bitshares: bdns support' 'go-ethereum: ethereum support')
source=("dnschain::git+https://github.com/okTurtles/dnschain.git"
	dnschain.service)

build() {
  cd $srcdir/dnschain
  export PYTHON=/usr/bin/python2
  npm install
}

package() {
  cd $srcdir/

  # Path for dnschain
  _npmdir="$pkgdir/usr/lib/node_modules/" 
  mkdir -p $_npmdir
  cp -r dnschain $_npmdir

  # Copy systemd service
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp dnschain.service $pkgdir/usr/lib/systemd/system

  # Cleaning
  rm -r $_npmdir/dnschain/.git*

  # Main executable
  mkdir $pkgdir/usr/bin
  ln -sr $_npmdir/dnschain/bin/dnschain $pkgdir/usr/bin/dnschain
}

pkgver() {
  cd $srcdir/dnschain
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         'd06f32b209d12fb3c3f4caf05ed826f9')
