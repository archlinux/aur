# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=argc-completions-git
_pkgname=argc-completions
_repo=sigoden/argc-completions
pkgver=r613.a992215
pkgrel=1
pkgdesc="Shell completions for 1000+ commands, powered by argc (git)"
arch=('any')
url="https://github.com/${_repo}"
license=('MIT')
depends=('argc' 'bash' 'gawk')
# yq is needed only by a subset of dynamic completions (the nix module and
# some cargo-plugin scripts). Both providers ship /usr/bin/yq and conflict
# with each other, and depends has no OR operator, so either is accepted here.
optdepends=('yq: dynamic completions for nix and some cargo plugins (or go-yq)'
            'go-yq: dynamic completions for nix and some cargo plugins (or yq)')
makedepends=('git')
# No provides()/conflicts(): no stable arc-completions package exists.
source=("git+https://github.com/${_repo}.git")
b2sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${_pkgname}"
  # No tags upstream; fall back to commit count + short sha.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  local _root="${pkgdir}/usr/share/argc-completions"
  install -d "${_root}"
  # scripts/setup-shell.sh expects $ROOT/{completions,bin}; bin/ holds
  # upstream-downloaded argc+yq binaries which we do NOT ship (see depends).
  cp -r completions scripts src utils docs Argcfile.sh "${_root}/"
  install -Dm644 README.md "${_root}/README.md"
  install -Dm644 MANIFEST.md "${_root}/MANIFEST.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et ft=PKGBUILD:
