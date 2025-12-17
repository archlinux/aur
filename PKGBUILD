# Maintainer: Akatsuki Rui <aur@akii.work>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: SanskritFritz (gmail)
# Contributor: Stephen Drodge <stephen.drodge@gmail.com>

pkgname=fish-git
_gitname="fish-shell"
pkgver=4.2.1.r205.gb29a85f45
pkgrel=1
epoch=2
pkgdesc="User friendly shell intended mostly for interactive use."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/fish-shell/fish-shell"
license=('GPL-2.0-only AND BSD-3-Clause AND ISC AND MIT AND PSF-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'ncurses'
  'pcre2'
)
optdepends=(
  'python: man page completion parser / web config tool'
  'pkgfile: command-not-found hook'
  'groff: --help for built-in commmands'
  'mandoc: --help for built-in commmands (alternative)'
  'xsel: X11 clipboard integration'
  'xclip: X11 clipboard integration (alternative)'
  'wl-clipboard: Wayland clipboard integration'

)
makedepends=(
  'cargo'
  'cmake'
  'git'
  'jq'
  'python-sphinx'
)
checkdepends=(
  'expect'
  'procps-ng'
  'ruff'
)
options=(!lto)
provides=(
  'fish'
  'fish-shell'
)
conflicts=(
  'fish'
  'fish-shell'
)
source=(
  "git+https://github.com/fish-shell/fish-shell.git"
)
install='fish.install'
backup=(etc/fish/config.fish)
b2sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  export CXXFLAGS+=" ${CPPFLAGS}"

  local cmake_options=(
    -B build
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_SYSCONFDIR=/etc
    -DCMAKE_BUILD_TYPE=Release
    -DWITH_DOCS=ON
    -DFISH_USE_SYSTEM_PCRE2=ON
    -DWITH_GETTEXT=ON
    -Wno-dev
  )
  cmake "${cmake_options[@]}"

  make -C build VERBOSE=1
}

check() {
  cd "$_gitname"
  sh build_tools/check.sh
}

package() {
  cd "$_gitname"
  DESTDIR="$pkgdir" cmake --install build
}
