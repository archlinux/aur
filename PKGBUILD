# Maintainer: envolution
# Contributor: ferreum <code at ferreum de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=elinks
pkgname=${_pkgname}-git
pkgver=0.18.0+r7367+g4b979b47e
pkgrel=1
pkgdesc="An advanced and well-established feature-rich text mode web browser. Git version, JavaScript disabled."
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://github.com/rkd77/elinks"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/rkd77/elinks.git")
md5sums=('SKIP')
license=('GPL-2.0-only')
depends=(
  'glibc'
  'brotli'
  'bzip2'
  'gpm'
  'openssl'
  'lua'
  'libdom'
  'libcss'
  'libidn2'
  'xz'
  'libwapcaplet'
  'expat'
  'zlib'
  'curl'
  'tre'
)
makedepends=(
  'git'
  'meson'
  'dblatex'
  'xmlto'
  'libiconv'
  'gc'
  'cmake'
)

pkgver() {
  cd "${_pkgname}"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
  arch-meson \
    "$_pkgname" \
    build \
    -D cgi=true \
    -D true-color=true \
    -D html-highlight=true \
    -D bzlib=true \
    -D brotli=true \
    -D lzma=true \
    -D luapkg=lua54 \
    -D tre=true \
    -D gemini=true \
    -D reproducible=true \
    -D source-date-epoch="$SOURCE_DATE_EPOCH"

  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
# vim:set ts=2 sw=2 et:
