# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=zehn-git-release
_pkgname=zehn
pkgver=0.2.0
pkgrel=1
pkgdesc="Fuzzy-find prompts across claude, codex, pi & opencode histories — latest git release version"
arch=('x86_64')
url="https://github.com/al3rez/zehn"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=()
makedepends=('git' 'zig')
optdepends=('sqlite3: opencode history support')
source=("${_pkgname}::git+https://github.com/al3rez/zehn.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git tag --list | grep -E '^v[0-9]+\.' | sort -V | tail -1 | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  local _tag
  _tag=$(git tag --list | grep -E '^v[0-9]+\.' | sort -V | tail -1)
  git reset --hard "${_tag}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  zig build -Doptimize=ReleaseFast
}

check() {
  cd "${srcdir}/${_pkgname}"
  zig build test
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 zig-out/bin/zehn "${pkgdir}/usr/bin/zehn"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
