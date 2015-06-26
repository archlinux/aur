# Maintainer: Jens John <dev@2ion.de>
pkgname=mpv-bash-completion-git
pkgver=0.9.2.r81.b2b3207
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

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  local _mpv_pkg_ver=$(pacman -Q mpv | cut -d' ' -f2 | cut -d- -f1)
  printf "%s.r%s.%s" "${_mpv_pkg_ver%-*}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
