# StepMania <git: 5_1_0>
#
# Maintainer: GhettoGirl
#
# NOTES
# Modify the CMAKE_C_COMPILER and CMAKE_CXX_COMPILER variable to point to a
# GCC 5.4 or lower binary.
# GCC 6 and higher suffer from a regression which causes a segmentation fault while compiling.
#  see: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70869
#       internal compiler error: Segmentation fault on array of pointer to function members
#
# StepMania 5.1.0+ won't be able to compile with GCC 6 or higher!
#

pkgname=stepmania-latest-git
_shortname=stepmania
pkgver=v5.1.0a2.r141.g17ab2b5
pkgrel=1
pkgdesc="Advanced cross-platform rhythm game designed for home and arcade use"
arch=('i686' 'x86_64')
url="http://www.stepmania.com/"
license=('MIT')
depends=('gtk2' 'libmad' 'glew' 'libogg' 'bzip2' 'libjpeg-turbo'
         'libxinerama' 'libxrandr' 'zlib' 'libva'
         'jack' 'pulseaudio' 'alsa-lib')
makedepends=('git' 'cmake' 'yasm' 'nasm' 'pkg-config')
provides=('stepmania=5.1.0a2')
conflicts=('stepmania' 'stepmania-git')
replaces=('sm-ssc-hg')
install="$pkgname.install"
source=("git+https://github.com/$_shortname/$_shortname.git"
        "$_shortname.sh")
sha256sums=('SKIP'
            'ffa713dfa3ecd143a9d7f53ce11299b5b99523c448cf058630e9956ea1c67f5c')

pkgver() {
  cd "$srcdir/$_shortname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_shortname"
  git checkout 5_1_0
  git submodule update --init
}

build() {
  cd "$srcdir/$_shortname/Build"
  cmake -DWITH_SYSTEM_FFMPEG=OFF \
        -DCMAKE_C_COMPILER="/opt/gnu/gcc/5.4.0/bin/gcc" \
        -DCMAKE_CXX_COMPILER="/opt/gnu/gcc/5.4.0/bin/g++" \
    ..
  make -j$(nproc)
}

package() {
  cd "$srcdir/$_shortname"

  # Install program
  install -d "$pkgdir/opt/$_shortname"/{RandomMovies,Packages}
  install -t "$pkgdir/opt/$_shortname/" stepmania GtkModule.so
  install -D "$srcdir/$_shortname.sh" "$pkgdir/usr/bin/$_shortname"

  # Install miscellaneous directories
  cp -r -t "$pkgdir/opt/$_shortname/" Announcers BGAnimations BackgroundEffects \
      BackgroundTransitions Characters Courses Data Docs NoteSkins NewSkins Scripts \
      Songs Themes

  # Install auxiliary files
  install -Dm644 stepmania.desktop "$pkgdir/usr/share/applications/stepmania.desktop"
  install -d "$pkgdir/usr/share"
  cp -r icons "$pkgdir/usr/share/icons"

  # Install license
  install -Dm644 "Docs/Licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
}

# vim:set ts=2 sw=2 et:
