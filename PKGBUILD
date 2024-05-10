# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Dhananjay Balan <mail@dbalan.in>

pkgname=minio-client
pkgver=2024.05.09
_timever=T17-04-24Z
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
sha512sums=('f8e3d12ea981a60a80d95ab9ccaeb27c373abd76aeab12565f2b0890e01f2f6be04c988221299971ffea5347a2a9d7866fae1e4ddcad156b165f950d07bb174b')

build() {
  cd mc

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
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
