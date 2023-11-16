# Maintainer:

_pkgname="knusperli"
pkgname="$_pkgname-git"
pkgver=r11.415439b
pkgrel=1
pkgdesc='A deblocking JPEG decoder'
url="https://github.com/google/knusperli"
license=('Apache')
arch=('x86_64')

depends=(
  'gcc-libs'
)
makedepends=(
  'bazel'
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # bazel crashes with newer versions of openjdk
  PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"

  cd "$_pkgsrc"
  CC=gcc bazel build :knusperli
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "bazel-bin/knusperli" -t "$pkgdir/usr/bin/"
}
