# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: sl1pkn07
# Contributor: Ryan Peters <sloshy45 at sbcglobal dot net>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
pkgname=stepmania-git
_shortname=stepmania
pkgver=v5.0.9.r221.g799eeaf
pkgrel=1
pkgdesc="Advanced cross-platform rhythm game designed for home and arcade use"
arch=('i686' 'x86_64')
url="http://www.stepmania.com/"
license=('MIT')
depends=('gtk2' 'libmad' 'ffmpeg' 'glew' 'jack')
makedepends=('git' 'cmake')
provides=('stepmania=5')
conflicts=('stepmania')
replaces=('sm-ssc-hg')
install="$pkgname.install"
source=("git+https://github.com/$_shortname/$_shortname.git"
        "$_shortname.sh")
sha256sums=('SKIP'
            'f9839a0c751fee40a5c21712110bce9f3b73863ece404f1c7e468d0fc1b528eb')

pkgver() {
  cd "$srcdir/$_shortname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_shortname"
  # BUG: fixes video crash on Arch's versions of ffmpeg but may break others
  git revert --no-commit 62630f7
}

build() {
  cd "$srcdir/$_shortname/Build"
  cmake -D WITH_SYSTEM_FFMPEG=ON ..
  make
}

package() {
  cd "$srcdir/$_shortname"

  # Install program
  install -d "$pkgdir/opt/$_shortname"/{RandomMovies,Packages}
  install -t "$pkgdir/opt/$_shortname/" stepmania GtkModule.so
  install -D "$srcdir/$_shortname.sh" "$pkgdir/usr/bin/$_shortname"

  # Install miscellaneous directories
  cp -r -t "$pkgdir/opt/$_shortname/" Announcers BGAnimations BackgroundEffects \
      BackgroundTransitions Characters Courses Data Docs NoteSkins Scripts \
      Songs Themes

  # Install auxiliary files
  install -Dm644 stepmania.desktop "$pkgdir/usr/share/applications/stepmania.desktop"
  install -d "$pkgdir/usr/share"
  cp -r icons "$pkgdir/usr/share/icons"

  # Install license
  install -Dm644 "Docs/Licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
}

# vim:set ts=2 sw=2 et:
