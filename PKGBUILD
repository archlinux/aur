# Maintainer: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.4.5.r0.g2cb68b221
pkgrel=1
pkgdesc='global versioned p2p merkledag file system'
url="https://github.com/ipfs/$_pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('git' 'go' 'jq')
optdepends=('fuse: for mounting/advanced use'
            'bash-completion: bash completion support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git" "ipfs.service" "go-ipfs-git.install")
install="$pkgname.install"

sha512sums=('SKIP'
            '1a6bc7fffc3c3640cda3f33c107424edd698c62bd8509731856b8827ea18be1a1845ef0d5ca15325d48d7d871a78daacc011ff9eacea926bc35899850990c1c6'
            'c31464826150b85c8a521cc27b8e6eb6e2e5ce9fb1c7cb2a38260b28b7c6cd0dedba0fdc41205aba707a1ca317727e524c2d561390256386a5fa93d08100f3be')

pkgver() {
  cd "$srcdir/$_pkgname"
  VERSION=$(jq -r .version package.json)
  REST=$(git describe --long --tags | sed -e 's/^v//' -e 's/^\(.*\)-\([0-9]*\)-\(g[0-9a-f]*\)$/r\2.\3/')
  printf "%s.%s" "$VERSION" "$REST" | sed -e 's/-//g'
}

prepare() {
  mkdir -p "$srcdir"/src/github.com/ipfs
  ln -sf "$srcdir/$_pkgname" "$srcdir"/src/github.com/ipfs/go-ipfs
}

build() {
  # Required for go get
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"
  export PATH=$PATH:$GOPATH/bin

  msg2 'Installing dependencies...'
  cd "$GOPATH"/src
  go get -d -v github.com/ipfs/go-ipfs

  msg2 'Building binary...'
  cd "$GOPATH"/src/github.com/ipfs/go-ipfs
  make install
}

package() {
  msg2 'Packaging binary...'
  install -Dm 755 bin/ipfs "${pkgdir}/usr/bin/ipfs"

  msg2 'Packaging auxiliary files...'
  cd "$_pkgname"
  install -Dm 644 ../ipfs.service "$pkgdir/usr/lib/systemd/user/ipfs.service"
  install -Dm 644 misc/completion/ipfs-completion.bash "${pkgdir}/usr/share/bash-completions/completions/ipfs"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md \
    CHANGELOG.md
}
