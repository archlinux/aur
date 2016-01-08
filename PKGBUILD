# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.3.11.rc1.r7.gc414029
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
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir"/src/github.com/ipfs
  ln -s "$srcdir/$_pkgname" "$srcdir"/src/github.com/ipfs/go-ipfs
}

build() {
  # Required for go get
  export GOPATH="$srcdir"

  cd "$srcdir"/src/github.com/ipfs/go-ipfs/cmd/ipfs

  msg2 'Installing dependencies...'
  go get -v ./...

  msg2 'Building binary...'
  go install -v
}

package() {
  msg2 'Packaging binary...'
  install -Dm 755 bin/ipfs "${pkgdir}/usr/bin/ipfs"

  msg2 'Packaging auxiliary files...'
  cd "$_pkgname"
  install -Dm 644 misc/completion/ipfs-completion.bash "${pkgdir}/usr/share/bash-completions/completions/ipfs"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md \
    CHANGELOG.md
}
