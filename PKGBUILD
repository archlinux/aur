_pkgname=knusperli
pkgname="$_pkgname-git"
pkgver=r11.415439b
pkgrel=1
pkgdesc='A deblocking JPEG decoder'
arch=('x86_64')
url="https://github.com/google/knusperli"
license=('Apache')
depends=(
  'gcc-libs'
)
makedepends=(
  'bazel'
  'git'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # bazel crashes with newer versions of openjdk
  PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"

  cd "$srcdir/$_pkgname"
  CC=gcc bazel build :knusperli
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir/usr/bin"
  install "bazel-bin/knusperli" "$pkgdir/usr/bin"
}
