# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ergochat-ldap
_upstream_pkgname=ergo-ldap
pkgver=0.0.1
pkgrel=2
pkgdesc="LDAP plugin for the IRC server Ergo"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/ergochat/ergo-ldap"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('b32286e9a0323f862182c73826f2e1c71ac128db241485fd7860a394a9879b69597e3a539793dcf1e4d7ef8e543826e6d7aebef0db4eae84dc2d6c41bf6f5066')
b2sums=('79faf75babf85f7bcee3bfbb96e4379a8d798059b28b671feb9958f08ac3b8a2ab71f456dac3df9ca95a08bee3a7f37cd17abbeae671ceedbacf6fa2fdecc154')
backup=("etc/ergochat/ldap-config.yaml")

build() {
  export GOPATH="$srcdir/gopath"
  cd "${srcdir}/$_upstream_pkgname" || exit

  GIT_COMMIT="$(git rev-parse HEAD)" # 2>/dev/null)"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-X main.commit=${GIT_COMMIT} -compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\"" \
    -v \
    .
}

package() {
  cd "$srcdir/$_upstream_pkgname" || exit
  install -Dm755 "$_upstream_pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 example.yaml "$pkgdir/etc/ergochat/ldap-config.yaml"
}
