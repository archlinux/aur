# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=bazel-git
pkgver=r858.18629fb
pkgrel=1
pkgdesc="Correct, reproducible, and fast builds for everyone"
arch=('i686' 'x86_64')
url="http://bazel.io/"
license=('Apache')
depends=('java-environment=8' 'libarchive' 'gcc-libs-multilib' 'zip' 'unzip')
makedepends=('git' 'protobuf')
install=bazel.install
options=('!strip')

_gitroot=https://github.com/google/bazel.git
_gitname=bazel

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./compile.sh
  ./output/bazel build scripts:bazel-complete.bash
}

package() {
  install -Dm755 "$srcdir/$_gitname-build/output/bazel" "$pkgdir/usr/bin/bazel"
  install -Dm755 "$srcdir/$_gitname-build/bazel-bin/scripts/bazel-complete.bash" "$pkgdir/etc/bash_completion.d/bazel-complete.bash"
  mkdir -p "$pkgdir/opt/bazel/base_workspace"
  for d in examples third_party tools; do
    cp -r "$srcdir/$_gitname-build/$d" "$pkgdir/opt/bazel/"
    cd "$pkgdir/opt/bazel/base_workspace"
    ln -s "/opt/bazel/$d" ./
  done
}

# vim:set ts=2 sw=2 et:
