# Contributor: Nasado <hi at nasado dot name>
# Contributor: Michael Duell <mail at akurei ddot me>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>

pkgname=gocryptfs-git
pkgver=20230329
pkgrel=1
pkgdesc="Encrypted overlay filesystem written in Go"
arch=('i686' 'x86_64')
depends=('fuse')
# Go 1.6 added an optimized GCM implementation in amd64 assembly that
# uses AES-NI. This is faster than OpenSSL and is used if available. In
# all other cases OpenSSL is much faster and is used instead.
#
# https://github.com/rfjakob/gocryptfs#changelog
makedepends=('git' 'go' 'pandoc')
url="https://github.com/rfjakob/gocryptfs"
license=('MIT')
source=(git+https://github.com/rfjakob/gocryptfs)
sha256sums=('SKIP')
provides=('gocryptfs')
conflicts=('gocryptfs')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

prepare() {
  msg2 'Fetching dependencies...'
  export GOPATH="$PWD/GO"
  mkdir -p "$GOPATH/src/github.com/rfjakob"
  ln -sf "$PWD/gocryptfs" "$GOPATH/src/github.com/rfjakob/"
  cd "gocryptfs"
  go get -v -d github.com/rfjakob/gocryptfs
}

build() {
  msg2 'Building...'
  export GOPATH="$PWD/GO"
  "$GOPATH/src/github.com/rfjakob/gocryptfs/build.bash"
  "$GOPATH/src/github.com/rfjakob/gocryptfs/Documentation/MANPAGE-render.bash"
}

package() {
  pushd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE \
          -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing documentation...'
  install -Dm 644 *.md Documentation/* \
          -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing man pages...'
  install -Dm 644 "$srcdir/gocryptfs/Documentation/gocryptfs.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "$srcdir/gocryptfs/Documentation/gocryptfs-xray.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "$srcdir/gocryptfs/Documentation/statfs.1" -t "$pkgdir/usr/share/man/man1"

  popd

  msg2 'Installing...'
  install -Dm 755 "$PWD/GO/bin/gocryptfs" -t "$pkgdir/usr/bin"
}
