# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Dhananjay Balan <mail@dbalan.in>

pkgname=minio-client
pkgver=2019.06.12
_timever=T20:35:20Z
_pkgver="${pkgver//./-}${_timever//:/-}"
pkgrel=1
pkgdesc='Replacement for ls, cp, mkdir, diff and rsync commands for filesystems and object storage'
arch=('x86_64')
url='https://minio.io/downloads/#minio-client'
license=('Apache')
makedepends=('go-pie' 'git')
depends=('glibc')
install=minio-client.install
source=(git+https://github.com/minio/mc.git#tag=RELEASE.${_pkgver})
sha512sums=('SKIP')

build() {
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH/src/github.com/minio"
  mv "$srcdir/mc" "$GOPATH/src/github.com/minio/mc/"
  cd "$GOPATH/src/github.com/minio/mc"
  sed -i "s/Version.*/Version = \"${pkgver//./-}${_timever}\"/g" cmd/build-constants.go
  sed -i "s/ReleaseTag.*/ReleaseTag = \"RELEASE.${_pkgver}\"/g" cmd/build-constants.go
  sed -i "s/CommitID.*/CommitID = \"$(git rev-parse HEAD)\"/g" cmd/build-constants.go

  GO111MODULE=on go build
}

package() {
  install -Dm755 go/src/github.com/minio/mc/mc "$pkgdir/usr/bin/mcli"
}
# vim:set ts=2 sw=2 et:
