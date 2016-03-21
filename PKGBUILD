# Maintainer: Adria Arrufat (archdria) <adria.arrufat+AUR@protonmail.ch>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=bazel-git
pkgver=r4663.9bc5c34
pkgrel=1
pkgdesc="Correct, reproducible, and fast builds for everyone"
arch=('i686' 'x86_64')
url="http://bazel.io/"
license=('Apache')
depends=('java-environment=8' 'libarchive' 'zip' 'unzip')
provides=('bazel')
makedepends=('git' 'protobuf')
install=bazel.install
options=('!strip')
source=("$pkgname::git+https://github.com/google/bazel.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  ./compile.sh
  ./output/bazel build scripts:bazel-complete.bash
}

package() {
  install -Dm755 "$srcdir/$pkgname/output/bazel" "$pkgdir/usr/bin/bazel"
  install -Dm755 "$srcdir/$pkgname/bazel-bin/scripts/bazel-complete.bash" "$pkgdir/etc/bash_completion.d/bazel-complete.bash"
  mkdir -p "$pkgdir/opt/bazel/base_workspace"
  for d in examples third_party tools; do
    cp -r "$srcdir/$pkgname/$d" "$pkgdir/opt/bazel/"
    cd "$pkgdir/opt/bazel/base_workspace"
    ln -s "/opt/bazel/$d" ./
  done
}

# vim:set ts=2 sw=2 et:
