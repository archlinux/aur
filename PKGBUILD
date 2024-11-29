# Maintainer: envolution
# Contributor: jasch <jasch dot io at protonmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=quiet-git
pkgver=r280+gb64a058ed
pkgrel=2
pkgdesc="libquiet library"
arch=('x86_64')
url="https://github.com/quiet/quiet"
license=('BSD')
depends=('glibc' 'libsndfile' 'jansson' 'portaudio' 'liquid-dsp-quiet-devel-git')
makedepends=('git' 'gcc' 'make' 'cmake')
provides=("quiet")
conflicts=("quiet")
options=('staticlibs')
source=("git+$url.git" usleep.patch cmake.patch)
md5sums=('SKIP'
         'f4242df7d846925e45c06a4cb91bc2f2'
         '3ff45a87c1644beb961fc81c418888f2')

prepare() {
  patch -Np0 -i ../usleep.patch
  patch -Np0 -i ../cmake.patch
}
pkgver() {
  cd quiet
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "r${_commits}+g${_short_commit_hash}"
}

build() {
  mkdir -p quiet/build
  cd quiet/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "quiet/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
