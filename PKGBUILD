# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.4.3dev.r0.g50a7df6
pkgrel=1
pkgdesc='global versioned p2p merkledag file system'
url="https://github.com/ipfs/$_pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('git' 'go')
optdepends=('fuse: for mounting/advanced use'
            'bash-completion: bash completion support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git" "ipfs.service" "go-ipfs-git.install")
install="$pkgname.install"

sha512sums=('SKIP'
            '1a6bc7fffc3c3640cda3f33c107424edd698c62bd8509731856b8827ea18be1a1845ef0d5ca15325d48d7d871a78daacc011ff9eacea926bc35899850990c1c6'
            '563b104c389115fc360315e6b798f058c2429a8d5d95b070db538870e801e6ee03ade42f2c0207dccdc222297f6d74d5e77ff38ad470b9a3e446a6fe169c906e')

pkgver() {
  cd "$srcdir/$_pkgname"
 git describe --long --tags | sed -e 's/^v//' -e 's/^\(.*\)-\([0-9]*\)-\(g[0-9a-f]*\)$/\1.r\2.\3/' -e 's/-//g'
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
