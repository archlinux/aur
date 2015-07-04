# Maintainer: David Z. Kil <dave at thekilempire dot com>

pkgname=packer-io-git
pkgver=0.8.1.r0.g872e78d
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
source=('packer::git://github.com/mitchellh/packer')
md5sums=('SKIP')

prepare() {
  export GOPATH=$srcdir
  go get -u github.com/mitchellh/gox
  rm -rf "$srcdir/src/github.com/mitchellh/packer"
  mv "$srcdir/packer" "$srcdir/src/github.com/mitchellh"
}

build() {
  export GOPATH=$srcdir
  cd "$srcdir/src/github.com/mitchellh/packer"
  PATH="$PATH:$srcdir/bin" make updatedeps
  PATH="$PATH:$srcdir/bin" make
  PATH="$PATH:$srcdir/bin" make dev
}

package() {
  install -dm755 "$pkgdir/usr/bin"

  cd "$srcdir/bin"
  install -Dm755 packer "$pkgdir/usr/bin/packer-io"
  for f in packer-{builder,post-processor,provisioner}-*; do
    install -Dm755 "$f" "$pkgdir/usr/bin/$f"
  done
}
