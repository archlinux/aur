# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Dhananjay Balan <mail@dbalan.in>

pkgname=minio-client
pkgver=2025.02.15
_timever=T10-36-16Z
_pkgver="${pkgver//./-}${_timever//:/-}"
pkgrel=1
pkgdesc='Replacement for ls, cp, mkdir, diff and rsync commands for filesystems and object storage'
arch=('x86_64')
url='https://minio.io/downloads/#minio-client'
license=('AGPL-3.0-or-later')
makedepends=('go' 'git')
depends=('glibc')
options=(!lto)
install=minio-client.install
source=(git+https://github.com/minio/mc.git#tag=RELEASE.${_pkgver})
sha512sums=('ecac5cadc82ded8f7873f327391d531e035b100427d3f968ccafcc05cb378dfb365cfa46482fd73a6685ae378fedd605f9c880234f6067a6a1f07cd097d74599')

build() {
  cd mc

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export MC_RELEASE="RELEASE"
  GO_LDFLAGS="\
      -linkmode=external \
      -compressdwarf=false \
      $(go run buildscripts/gen-ldflags.go)"

  go build -ldflags "$GO_LDFLAGS" .
}

package() {
  install -Dm755 mc/mc "$pkgdir/usr/bin/mcli"
}
# vim:set ts=2 sw=2 et:
