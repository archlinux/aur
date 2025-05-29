# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld-git
pkgver=1.19.8.r0.g6785dd2
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://gitlab.com/rt-linux-tools/stalld"
license=('GPL-2.0-or-later')
depends=('glibc' 'libbpf')
makedepends=('git' 'bpf' 'clang' 'llvm')
optdepends=('bash: for throttlectl')
provides=("stalld=$pkgver")
conflicts=('stalld')
backup=('etc/sysconfig/stalld')
source=("git+https://gitlab.com/rt-linux-tools/stalld.git")
sha256sums=('SKIP')


prepare() {
  cd "stalld"

  sed -i 's|$(SOPTS)||;s|LDFLAGS	:=|LDFLAGS	:= $(LDFLAGS)|' "Makefile"
}

pkgver() {
  cd "stalld"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "stalld"

  make
}

package() {
  cd "stalld"

  make DESTDIR="$pkgdir" install
}
