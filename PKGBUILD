# Maintainer: Jiangge Zhang <tonyseek@gmail.com>
pkgname=bazel-compilation-database
pkgver=0.5.2
pkgrel=1
epoch=
pkgdesc="Tool to generate compile_commands.json from the Bazel build system"
arch=("any")
url="https://github.com/grailbio/bazel-compilation-database"
license=("APACHE")
groups=()
depends=("bazel" "python")
makedepends=()
checkdepends=("clang")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=()
sha256sums=("d32835b26dd35aad8fd0ba0d712265df6565a3ad860d39e4c01ad41059ea7eda")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver" || exit 1
  rm -rf ".github" ".ycm_extra_conf.py" "plugin"
}

build() {
	cd "$pkgname-$pkgver" || exit 1
  bazel build //...
  bazel clean
}

check() {
  _bazel_compdb="$PWD/$pkgname-$pkgver/generate.py"
  cd "$(mktemp -d)" || exit 1
  printf 'workspace(name = "check-bazel-compdb")\n' > WORKSPACE
  printf 'cc_binary(name = "empty", srcs = ["empty.c"])\n' > BUILD
  printf 'int main() { return 0; }\n' > empty.c
  $_bazel_compdb -- --repo_env=CC=clang
  bazel run //...
  clangd --check=empty.c
}

package() {
	cd "$pkgname-$pkgver" || exit 1
  install -d "$pkgdir/usr/lib/$pkgname"
  install -m644 \
    ./*.bzl ./BUILD ./WORKSPACE ./LICENSE ./README.md "$pkgdir/usr/lib/$pkgname"
  install -m755 ./generate.py "$pkgdir/usr/lib/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/bin"
  ln -s "../lib/$pkgname/generate.py" "$pkgdir/usr/bin/bazel-compdb"
}
