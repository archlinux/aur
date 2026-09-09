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
source=("git+https://github.com/${_repo}.git"
        'fix-gawk-interval-space.patch')
b2sums=('SKIP'
        '13d76849ca9f10d288641954b213dc7ef86e52a10bd39ad1e98ed44ff5100870e0bb7357fac9074a7451d9224b46840de3f05331eb0cf8dc8791ee964f7bdae3')
install="${pkgname}.install"

pkgver() {
  cd "${_pkgname}"
  # No tags upstream; fall back to commit count + short sha.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  # Upstream issue #74: drop the space from the {4, } interval, which gawk
  # rejects ('invalid contents of {}'). Remove when fixed upstream.
  patch -p1 < "${srcdir}/fix-gawk-interval-space.patch"
}

package() {
  cd "${_pkgname}"
  local _root="${pkgdir}/usr/share/argc-completions"
  install -d "${_root}"
  # scripts/setup-shell.sh expects $ROOT/{completions,bin}; bin/ holds
  # upstream-downloaded argc+yq binaries which we do NOT ship (see depends).
  # Never inherit modes from git: only scripts/*.sh are executable (run
  # directly by users); everything else ships 644. Symlinks pass through.
  local _dir
  for _dir in completions scripts src utils docs; do
    find "${_dir}" -type d -exec install -dm755 "${_root}/{}" \;
    find "${_dir}" -type l -exec cp -P {} "${_root}/{}" \;
    if [[ ${_dir} == scripts ]]; then
      find "${_dir}" -type f -name '*.sh' -exec install -Dm755 {} "${_root}/{}" \;
      find "${_dir}" -type f ! -name '*.sh' -exec install -Dm644 {} "${_root}/{}" \;
    else
      find "${_dir}" -type f -exec install -Dm644 {} "${_root}/{}" \;
    fi
  done
  install -Dm644 Argcfile.sh "${_root}/Argcfile.sh"
  install -Dm644 README.md "${_root}/README.md"
  install -Dm644 MANIFEST.md "${_root}/MANIFEST.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et ft=PKGBUILD:
