# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrspy-git
pkgver=20170210
pkgrel=1
pkgdesc="Decred data monitor"
arch=('i686' 'x86_64')
makedepends=('git' 'glide' 'go')
groups=('decred')
url="https://github.com/chappjc/dcrspy"
license=('ISC')
options=('!strip' '!emptydirs')
source=(git+https://github.com/chappjc/dcrspy)
sha256sums=('SKIP')
provides=('dcrspy')
conflicts=('dcrspy')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  export GOPATH="$srcdir"
  git clone "$srcdir/dcrspy" "$GOPATH/src/github.com/chappjc/dcrspy"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrspy and dependencies...'
  cd "$GOPATH/src/github.com/chappjc/dcrspy"
  glide install
  go install $(glide novendor)
}

package() {
  msg2 'Installing license...'
  install -Dm 644 "$srcdir/src/github.com/chappjc/dcrspy/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrspy"

  msg2 'Installing docs...'
  for _doc in README.md sample-dcrspy.conf; do
    install -Dm 644 "$srcdir/src/github.com/chappjc/dcrspy/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrspy"
  done

  msg2 'Installing...'
  install -Dm 755 "$srcdir/bin/dcrspy" -t "$pkgdir/usr/bin"
}
