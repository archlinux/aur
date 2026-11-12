# Maintainer: KennyStier <https://github.com/KennyStier>
# Contributor: Laël Guillemenot <zeppelinlg@gmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: pukyxd
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
#
# Builds the latest commit of https://github.com/KennyStier/warmux
# (kept in sync with packaging/arch/PKGBUILD there)

pkgname=warmux-git
pkgver=12.0.0.r0.g246bd33
pkgrel=1
pkgdesc="Turn-based artillery game with free-software mascots (maintained fork, includes index/game servers)"
arch=('x86_64' 'aarch64')
url="https://github.com/KennyStier/warmux"
license=('GPL-2.0-or-later')
depends=('sdl2' 'sdl2_image' 'sdl2_gfx' 'sdl2_ttf' 'sdl2_mixer' 'sdl2_net'
         'curl' 'libxml2' 'libpng' 'libstdc++' 'glibc' 'hicolor-icon-theme')
makedepends=('git' 'autoconf' 'automake')
provides=('warmux')
conflicts=('warmux' 'warmux-data')
source=("warmux::git+https://github.com/KennyStier/warmux.git")
sha256sums=('SKIP')

pkgver() {
  cd warmux
  # From the latest release tag (v12.0.0 -> 12.0.0.r<commits since>.g<hash>),
  # or from the upstream version before the first tag
  if git describe --long --tags --match 'v*' >/dev/null 2>&1; then
    git describe --long --tags --match 'v*' | sed 's/^v//;s/-\([0-9]*\)-g/.r\1.g/'
  else
    printf "11.04.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd warmux
  # makepkg reuses this checkout between runs; drop old build output so
  # objects compiled against older dependencies are never linked in
  git clean -dfxq
  # Regenerate the build system with the installed autotools
  autoreconf -fi
}

build() {
  cd warmux
  # To make clients find your own lobby by default, add:
  #   --with-index-server=your.host[:9997]
  ./configure --prefix=/usr --enable-servers
  make
}

package() {
  cd warmux
  make DESTDIR="$pkgdir" install
}
