# Maintainer: Tiziano Bacocco <tizbac2@gmail.com>
# Contributor: cleanrock (AT gmail DOT com)
# Contributor: Erdbeerkaese (erdbeerkaese AT gawab DOT com)
# Contributor: DuGi <dugi@irc.pl>

pkgname=springlobby-git
pkgver=v1.0.0.0.g9e5685a86
pkgrel=1
pkgdesc="A free cross-platform lobby client for the Spring RTS project, development version with patches from Tech Annihilation community."
arch=('i686' 'x86_64')
url="https://techa-rts.com/"
license=('GPL-2.0-or-later')
depends=('libx11' 'gcc-libs' 'hicolor-icon-theme' 'zlib' 'minizip' 'libpng' 'openal' 'curl' 'glibc' 'libnotify' 'wxwidgets-gtk3' 'wxwidgets-common' 'glib2' 'openssl' 'alure')
makedepends=('boost' 'cmake' 'git')
conflicts=('springlobby')
provides=('springlobby')
source=('git+https://github.com/techannihilation/springlobby.git'
        'git+https://github.com/techannihilation/pr-downloader.git')
noextract=()
md5sums=('SKIP' 'SKIP')
# options=('!strip' 'debug' '!buildflags')

_gitname="springlobby"

pkgver() {
  cd "$srcdir/$_gitname"
  # package version is Tag.CommitsSinceTag.CommitId, e.g 0.171.205.g86a3481
  git describe --long --tags | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git config submodule.src/downloader/lib.url "${srcdir}/pr-downloader"
  git submodule--helper update
}

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim: sw=2:ts=2 et:
