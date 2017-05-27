# Maintainer: David Z. Kil <dave at thekilempire dot com>

pkgname=packer-io-git
pkgver=0.12.3.r363.g69daca2a3
pkgver() {
  cd "$srcdir/packer"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
url="http://www.packer.io"
arch=('x86_64' 'i686')
license=('MPL2')
conflicts=('packer-io')
makedepends=('mercurial' 'go' 'bzr')
source=('packer::git+http://github.com/hashicorp/packer'
        'esx5_HostKeyCallback.patch')
md5sums=('SKIP'
         '0f5fd9e12b4b53ddfc577a0d28a24d30')

prepare() {
  export GOPATH=$srcdir
  go get -u github.com/hashicorp/packer
  cd "$srcdir/src/github.com/hashicorp/packer"
  patch -p1 -i "$srcdir/esx5_HostKeyCallback.patch"
}

build() {
  export GOPATH=$srcdir
  cd "$srcdir/src/github.com/hashicorp/packer"
  PATH="$PATH:$srcdir/bin" make
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/bin/packer" "$pkgdir/usr/bin/packer-io"
}
