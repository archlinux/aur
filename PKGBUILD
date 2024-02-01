# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Dhananjay Balan <mail@dbalan.in>

pkgname=minio-client
pkgver=2024.01.31
_timever=T08-59-40Z
_pkgver="${pkgver//./-}${_timever//:/-}"
pkgrel=1
pkgdesc='Replacement for ls, cp, mkdir, diff and rsync commands for filesystems and object storage'
arch=('x86_64')
url='https://minio.io/downloads/#minio-client'
license=('Apache')
makedepends=('go' 'git')
depends=('glibc')
install=minio-client.install
source=(git+https://github.com/minio/mc.git#tag=RELEASE.${_pkgver})
sha512sums=('SKIP')

build() {
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  GO_LDFLAGS="\
      -linkmode=external \
      -compressdwarf=false"

  cd mc

  sed -i "s/Version.*/Version = \"${pkgver//./-}${_timever}\"/g" cmd/build-constants.go
  sed -i "s/ReleaseTag.*/ReleaseTag = \"RELEASE.${_pkgver}\"/g" cmd/build-constants.go
  sed -i "s/CommitID.*/CommitID = \"$(git rev-parse HEAD)\"/g" cmd/build-constants.go

  go build -ldflags "$GO_LDFLAGS" .
}

package() {
  install -Dm755 mc/mc "$pkgdir/usr/bin/mcli"
}
# vim:set ts=2 sw=2 et:
