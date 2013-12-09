# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Based on aur/morituri PKGBUILD by Mantas Mikulėnas <grawity@gmail.com>
pkgname=morituri-git
_gitname=morituri
pkgver=0.2.2.r58.ga74fd71
pkgrel=1
pkgdesc='a CD ripper aiming for accuracy over speed, modelled after Exact Audio Copy'
arch=(i686 x86_64)
url='https://github.com/thomasvs/morituri'
license=('GPL3')
depends=(
  'cdparanoia' 'cdrdao'
  'gstreamer0.10' 'gstreamer0.10-python'
  'python2-xdg' 'python2-setuptools'
)
makedepends=('git')
optdepends=(
  'python2-pycdio: Drive recognition.'
  'gstreamer0.10-base-plugins: Offset detection.'
  'cddb-py: FreeDB support.'
)
provides=('morituri')
conflicts=('morituri' 'morituri-svn')
replaces=('morituri-svn')
changelog=ChangeLog
source=('morituri::git+https://github.com/thomasvs/morituri.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  # Use the tag of the last commit, removing "v"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  cd "$_gitname"

  # Pull in Git submodules
  git submodule init
  git submodule update

  ./autogen.sh

  export PYTHON='python2'
  ./configure --prefix=/usr --sysconfdir=/etc 
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/doc/$_gitname"
  install -m644 -t "$pkgdir/usr/share/doc/$_gitname" \
    AUTHORS ChangeLog HACKING NEWS README.md RELEASE TODO
}

# vim:set ts=2 sw=2 et:
