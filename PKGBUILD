# Maintainer: envolution
# Contributor: Peter <craven@gmx.net>
# Contributor: Jonathon Fernyhough <jonathon"manjaro+org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=chez-scheme-git
_pkgname=ChezScheme
pkgver=10.1.0+r2428+g4686f6bc6
pkgrel=1
pkgdesc="Chez Scheme is an implementation of the Revised6 Report on Scheme (R6RS) with numerous language and programming environment extensions. (threaded build)"
arch=(i686 x86_64)
url="https://github.com/cisco/ChezScheme"
license=('Apache-2.0')
makedepends=('git' 'libx11' 'libutil-linux' 'ncurses')
provides=(chez-scheme)
conflicts=(petite-chez-scheme chez-scheme)
source=('git+https://github.com/cisco/ChezScheme.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  git -C "${_pkgname}" submodule init
  for _submodule in lz4 nanopass stex zlib zuo; do
    git -C "${_pkgname}" config --local "submodule.third_party/${_submodule}.url" "${_submodule}"
  done
  git -C "${_pkgname}" -c protocol.file.allow='always' submodule update
}

build() {
  cd "$_pkgname"
  ./configure --installprefix=/usr \
    --temproot=$pkgdir \
    --threads \
    --installschemename=chez \
    --installscriptname=chez-script \
    --kernelobj
  make
}

check() {
  cd "$_pkgname"
  #https://github.com/cisco/ChezScheme/blob/main/BUILDING
  #test-one, test-some-fast, test-some, test, test-more, coverage
  make test-one
}

package() {
  cd "$_pkgname"
  #  bin/zuo ta6le install MAKE="make" DESTDIR="$pkgdir"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
