# Maintainer: Dan Fuhry <dan@fuhry.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Dhananjay Balan <mail@dbalan.in>

pkgname=pgsty-silo-client
pkgver=2026.11.12
_timever=T00-00-00Z
_pkgver="${pkgver//./-}${_timever//:/-}"
pkgrel=1
pkgdesc='Replacement for ls, cp, mkdir, diff and rsync commands for filesystems and object storage'
arch=('x86_64')
url='https://github.com/pgsty/mc'
license=('AGPL-3.0-or-later')
makedepends=('go' 'git')
depends=('glibc')
options=(!lto)
provides=(minio-client)
replaces=(minio-client)
conflicts=(minio-client)
install=pgsty-silo-client.install
source=(git+https://github.com/pgsty/mc.git#tag=RELEASE.${_pkgver})

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
sha512sums=('ba3e687a09938469bf9cc7a164110e93b5f3dcd0b61cb33c6a711073914f01ce6a8bbb8fc9671693a4b1383283089212f7b5fd17bde0ceb8b3f8fd8117f2d98d')
