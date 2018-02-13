# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: sl1pkn07
# Contributor: Ryan Peters <sloshy45 at sbcglobal dot net>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: Dan Guzek <dguzek@gmail.com>
pkgname=stepmania-git
_shortname=stepmania
pkgver=5.1.0a3+183+g500cfdfb62
pkgrel=1
pkgdesc="Advanced cross-platform rhythm game designed for home and arcade use"
arch=('i686' 'x86_64')
url="http://www.stepmania.com/"
license=('MIT')
depends=('gtk2' 'libmad' 'jack' 'libpulse' 'libva')
makedepends=('git' 'cmake' 'yasm' 'glew')
provides=('stepmania=5.1')
conflicts=('stepmania')
replaces=('sm-ssc-hg')
install="$pkgname.install"
source=("git+https://github.com/$_shortname/$_shortname.git"
        # Renamed to avoid conflict with clones from old URL
        "fmtlib::git+https://github.com/fmtlib/fmt.git"
        "git+https://github.com/$_shortname/ffmpeg.git"
        "git+https://github.com/$_shortname/googletest.git"
        "git+https://github.com/$_shortname/ogg.git"
        "git+https://github.com/$_shortname/vorbis.git"
        "git+https://github.com/$_shortname/libtomcrypt.git"
        "git+https://github.com/$_shortname/libtommath.git"
        "$_shortname.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f9839a0c751fee40a5c21712110bce9f3b73863ece404f1c7e468d0fc1b528eb')

pkgver() {
  cd "$srcdir/$_shortname"
  git describe --long --tags | sed -e 's/-/+/g' -e 's/^v//'
}

prepare() {
  cd "$srcdir/$_shortname"

  # Use local clones for submodules
  git submodule init
  git config submodule.extern/cppformat.url "$srcdir/fmtlib"
  git config submodule.extern/ffmpeg-git.url "$srcdir/ffmpeg"
  git config submodule.extern/googletest.url "$srcdir/googletest"
  git config submodule.extern/libogg-git.url "$srcdir/ogg"
  git config submodule.extern/libvorbis-git.url "$srcdir/vorbis"
  git config submodule.extern/tomcrypt.url "$srcdir/libtomcrypt"
  git config submodule.extern/tommath.url "$srcdir/libtommath"
  git submodule update
}

build() {
  cd "$srcdir/$_shortname/Build"
  cmake -D WITH_MINIMAID=OFF ..
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
