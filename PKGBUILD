# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bazelisk-git
pkgver=1.18.0.r0.g3f0897a
pkgrel=1
pkgdesc="A user-friendly launcher for Bazel"
arch=('i686' 'x86_64')
url="https://github.com/bazelbuild/bazelisk"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=("bazelisk=$pkgver" 'bazel')
conflicts=('bazelisk' 'bazel')
source=("git+https://github.com/bazelbuild/bazelisk.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "bazelisk"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "bazelisk"

  go build ./
  ./bazelisk build //:bazelisk
  ./bazelisk shutdown
}

package() {
  cd "bazelisk"

  install -Dm755 "bazel-bin/bazelisk_/bazelisk" -t "$pkgdir/usr/bin"
  ln -s "bazelisk" "$pkgdir/usr/bin/bazel"
}
