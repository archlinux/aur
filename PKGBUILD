# Maintainer: Raansu <Gero3977@gmail.com>
# Contributor: Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

# Updated PKGBUILD from original to ensure the menu shortcuts get copied over correctly.

pkgname=bitcoin-git
pkgver=0.9.0rc2.3425.g86cfd23
pkgrel=1
epoch=1
pkgdesc="Bitcoin is a peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="http://www.bitcoin.org/"
depends=('qt4>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.5' 'openssl' 'db4.8' 'protobuf' 'bash-completion')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
conflicts=('bitcoin-bin' 'bitcoin' 'bitcoind' 'bitcoin-daemon' 'bitcoin-qt')
provides=('bitcoin')
license=('MIT')
source=(git://github.com/bitcoin/bitcoin.git)
sha512sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe | sed "s/^v//; s/-/./g"
}

build() {
  
  cd "$srcdir/${pkgname%-*}"

  ./autogen.sh
 
  ./configure --prefix=/usr

  make # $MAKEFLAGS
}

package() {
  cd "$srcdir/${pkgname%-*}"

  make DESTDIR="${pkgdir}" install

  # Copy mans
  cat contrib/debian/*.manpages | sed -e 's@^\(debian\)@contrib/\1@' | install_man

  # Copy examples
  mkdir -p "$pkgdir/usr/share/bitcoin"
  cat contrib/debian/*.examples | sed -e 's@^\(debian\)@contrib/\1@' | xargs -I{} install -Dm644 {} "$pkgdir/usr/share/bitcoin/"

  # Install bash completion
  mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm644 contrib/bitcoind.bash-completion "$pkgdir/etc/bash_completion.d/bitcoind"
  
  # Install menu shortcuts for GUI
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  mkdir -p "$pkgdir/usr/share/applications"
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/bitcoin128.png
  install -Dm644 contrib/debian/bitcoin-qt.desktop "$pkgdir"/usr/share/applications/bitcoin.desktop
}

# guess correct /usr/share/man's subdirectory for man every file
# FIXME Uber-fat crunch. It should another, simple way...
install_man() {
  while read man; do
    local man_d="$pkgdir/usr/share/man/man${man#${man%?}}/"
    mkdir -p "$man_d"
    install -Dm0644 "$man" "$man_d"
  done
}
