# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: Stephen Drodge <stephen.drodge@gmail.com>
# Contributor: Akatsuki Rui <aur@akii.work>
# Maintainer: SanskritFritz (gmail)

pkgname=fish-git
_gitname="fish-shell"
pkgver=4.0b1.r45.gc473aa60a
pkgrel=1
epoch=2
pkgdesc="User friendly shell intended mostly for interactive use."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/fish-shell/fish-shell"
license=('GPL-2.0-only AND BSD-3-Clause AND ISC AND MIT AND PSF-2.0')
depends=(
  'glibc'
  'ncurses'
  'pcre2'
)
optdepends=(
  'python: man page completion parser / web config tool'
  'pkgfile: command-not-found hook'
)
makedepends=(
  'cargo'
  'cmake'
  'git'
  'python-sphinx'
)
checkdepends=(
  'expect'
  'procps-ng'
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
  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
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
