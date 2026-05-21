# imgclip-git-release — clipboard ↔ image CLI with watch mode
# Maintainer: Tom Hale tomnom@halebork.ee {remove nom and bork}
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=imgclip-git-release
pkgver=0.3.0
pkgrel=1
pkgdesc='A tiny cross-platform CLI for clipboard ↔ image files, with watch mode to auto-save every screenshot. Latest git release version'
arch=('x86_64')
url='https://github.com/alexyan0431/imgclip'
license=('MIT')
depends=('libgcc' 'glibc')
makedepends=('git' 'cargo')
source=("imgclip::git+${url}.git")
sha256sums=('SKIP')

_pkgname=imgclip

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Derive version from the latest release tag (git-release: follows latest tag)
  git tag --list | grep -E '^v[0-9]+\.' | sort -V | tail -1 | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Reset to the latest tagged release — avoids detached HEAD noise
  local tag
  tag=$(git tag --list | grep -E '^v[0-9]+\.' | sort -V | tail -1)
  git reset --hard "$tag"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 "target/release/imgclip" "${pkgdir}/usr/bin/imgclip"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
