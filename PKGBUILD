# Maintainer: Jens John <dev@2ion.de>
pkgname=mpv-bash-completion-git
pkgver=0.10.0
epoch=2
pkgrel=1
pkgdesc="Bash completion for the mpv video player"
arch=('any')
url="https://github.com/2ion/mpv-bash-completion"
license=('GPL')
depends=('mpv' 'bash-completion')
makedepends=('git' 'mpv' 'bash' 'coreutils' 'pacman' 'grep')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/2ion/mpv-bash-completion.git#branch=master')
md5sums=('SKIP')
_completioncommand=mpv

_mpv_package_version() {
  local _mpv=$(type -fp mpv)
  (( $? == 0 )) || return 1
  local _mpvpkg=$(pacman -qQo "$_mpv")
  (( $? == 0)) || return 1
  pacman -Q "$_mpvpkg" | cut -d' ' -f2
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  local _mpv_pkg_ver=$(_mpv_package_version)
  printf "%s" "${_mpv_pkg_ver%-*}"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./gen.sh > "$_completioncommand"
}

check() {
  cd "$srcdir/${pkgname%-git}"
  bash -n "$_completioncommand"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 "${_completioncommand}" "${pkgdir}/etc/bash_completion.d/${_completioncommand}"
  install -Dm644 BUGS "${pkgdir}/usr/share/doc/${pkgname%-git}/KNOWN_BUGS.txt"
}
