# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=opencsg-git
pkgver=1.4.2.r7.g80f8f1f
pkgrel=1
pkgdesc="A library that does image-based CSG rendering using OpenGL"
arch=('i686' 'x86_64')
url="http://www.opencsg.org/"
license=('GPL')
depends=('glibc' 'glew' 'glut' 'libgl')
makedepends=('git')
provides=('opencsg')
conflicts=('opencsg')
source=("git+https://github.com/floriankirsch/OpenCSG.git")
sha256sums=('SKIP')


prepare() {
  cd "OpenCSG"

  sed \
    -i "s|/usr/local|/usr|g;s|LFLAGS        =|LFLAGS        = $LDFLAGS|" \
    "src/Makefile"
}

pkgver() {
  cd "OpenCSG"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^opencsg-//;s/-release//;s/-/./g'
}

build() {
  cd "OpenCSG"

  make \
    -C "src"
}

package() {
  cd "OpenCSG"

  make \
    INSTALL_ROOT="$pkgdir" \
    -C "src" \
    install
}
