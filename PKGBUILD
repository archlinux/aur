# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: Stephen Drodge <stephen.drodge@gmail.com>
# Contributor: Akatsuki Rui <aur@akii.work>
# Maintainer: SanskritFritz (gmail)

pkgname=fish-git
_gitname="fish-shell"
pkgver=3.6.0.r228.g3b60bc1de
pkgrel=1
epoch=2
pkgdesc="User friendly shell intended mostly for interactive use."
arch=('i686' 'x86_64' 'arm')
url="http://fishshell.com"
license=('GPL2')
depends=(
  'glibc'
  'gcc-libs'
  'ncurses'
  'pcre2'
)
optdepends=(
  'python: man page completion parser / web config tool'
  'pkgfile: command-not-found hook'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'git'
  'python-sphinx'
)
checkdepends=(
  'expect'
  'procps-ng'
)
options=('!lto')
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
  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_DOCS=True \
    -Wno-dev
  make -C build
}

check() {
  cd "$_gitname"
  make -C build test
}

package() {
  cd "$_gitname"
  make -C build DESTDIR="$pkgdir" install
}
