# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Based on aur/morituri PKGBUILD by Mantas Mikulėnas <grawity@gmail.com>
pkgname=morituri-git
_gitname=morituri
pkgver=0.2.0.64.ge990136
pkgrel=1
epoch=1
pkgdesc="a CD ripper aiming for accuracy over speed, modelled after Exact Audio Copy"
arch=(i686 x86_64)
url="https://github.com/thomasvs/morituri"
license=("GPL3")
depends=(
  "cdparanoia" "cdrdao" "gstreamer0.10"
  "gstreamer0.10-python" "python2-musicbrainz2"
)
makedepends=('git' 'python2-setuptools')
optdepends=(
  "python2-pycdio: Drive recognition."
  "gstreamer0.10-base-plugins: Offset detection."
  "cddb-py: FreeDB support."
)
conflicts=("morituri" "morituri-svn")
replaces=("morituri-svn")
changelog=ChangeLog
source=('morituri::git+https://github.com/thomasvs/morituri.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  # Use the tag of the last commit, removing "v"
  git describe --always | sed 's|-|.|g' | sed 's/v//'
}

build() {
  cd "$_gitname"

  # Pull in Git submodules
  git submodule init
  git submodule update

  ./autogen.sh

  export PYTHON="python2"
  ./configure --prefix=/usr --sysconfdir=/etc 
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install || return 1
  install -Dm 0644 "AUTHORS" "$pkgdir/usr/share/doc/morituri/AUTHORS"
  install -Dm 0644 "ChangeLog" "$pkgdir/usr/share/doc/morituri/ChangeLog"
  install -Dm 0644 "HACKING" "$pkgdir/usr/share/doc/morituri/HACKING"
  install -Dm 0644 "NEWS" "$pkgdir/usr/share/doc/morituri/NEWS"
  install -Dm 0644 "README" "$pkgdir/usr/share/doc/morituri/README"
  install -Dm 0644 "RELEASE" "$pkgdir/usr/share/doc/morituri/RELEASE"
  install -Dm 0644 "TODO" "$pkgdir/usr/share/doc/morituri/TODO"
}

# vim:set ts=2 sw=2 et:
