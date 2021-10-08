# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Salamandar <felix at piedallu dot me>

pkgname=git-sizer-git
pkgver=1.4.0.r12.g0d882b6
pkgrel=1
pkgdesc="Compute various size metrics for a Git repository, flagging those that might cause problems"
arch=('i686' 'x86_64')
url="https://github.com/github/git-sizer"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('git-sizer')
conflicts=('git-sizer')
source=("git+https://github.com/github/git-sizer.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "git-sizer"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "git-sizer"

  #go test \
  #  ./
}

package() {
  cd "git-sizer"

  GOBIN="$pkgdir/usr/bin" \
    go install \
      ./

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/git-sizer"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/git-sizer"
}
