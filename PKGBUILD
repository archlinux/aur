# Maintainer: sxe <sxxe@gmx.de>
# Based on the wine package in the community repository

pkgname=wine-unity3d-git
_gitname="wine"
pkgver=1.7.38.r69.g862d7da
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs, with patches to make unity3d '-force-opengl' work."
url="http://www.winehq.com"
arch=('i686' 'x86_64')
license='LGPL'
install='wine-git.install'

source=('wine-unity3d-git::git://source.winehq.org/git/wine.git'
		'unity3d::git+https://github.com/Unity3D-Wine-Support/Unity3D-on-Wine.git'
        '30-win32-aliases.conf')
md5sums=('SKIP'
		 'SKIP'
         '1ff4e467f59409272088d92173a0f801')

_depends=(
  fontconfig      lib32-fontconfig
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex prelink
  'gcc>=4.5.0-2'  'gcc-multilib>=4.5.0-2'
  giflib          lib32-giflib
  libpng          lib32-libpng
  gnutls          lib32-gnutls
  libxinerama     lib32-libxinerama
  libxcomposite   lib32-libxcomposite
  libxmu          lib32-libxmu
  libxxf86vm      lib32-libxxf86vm
  libxml2         lib32-libxml2
  libldap         lib32-libldap
  lcms            lib32-lcms
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  alsa-lib        lib32-alsa-lib
  libxcomposite   lib32-libxcomposite
  mesa            lib32-mesa
  samba
  git
)
  
optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  gnutls          lib32-gnutls
  lcms            lib32-lcms
  libxml2         lib32-libxml2
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  libpulse        lib32-libpulse
  alsa-plugins    lib32-alsa-plugins
  alsa-lib        lib32-alsa-lib
  libjpeg-turbo   lib32-libjpeg-turbo
  libxcomposite   lib32-libxcomposite
  libxinerama     lib32-libxinerama
  ncurses         lib32-ncurses
  libcl           lib32-libcl
  cups
  samba           dosbox
)

# Check if libowfat is installed.
# It has to be removed because WINE cannot be build if installed.
# Thanks to haagch 
if [ -f /usr/lib/libowfat.a ]; then
    msg2 "Error: libowfat.a detected. Please remove the libowfat package. WINE cannot be build if installed."
    exit 0;
fi

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  _depends=(${_depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
else
  makedepends=(${makedepends[@]} ${_depends[@]})
  conflicts=('bin32-wine' 'wine-wow64')
  replaces=('bin32-wine')
fi

pkgver() {
  #date +%Y%m%d
  cd "$srcdir/$pkgname"
  git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^wine.//'
}

build() {
  cd "$srcdir"

  # ncurses fix
  sed -i 's|libncurses|libncursesw|g' "$srcdir/$pkgname/configure"
  sed -i 's|lncurses|lncursesw|g' "$srcdir/$pkgname/configure"

  cd "${pkgname}"
  cat "${srcdir}"/unity3d/Compile-Wine/WGL-ShareList-Hack.patch | patch -p1
  cd "$srcdir"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-32-build

  # These additional CPPFLAGS solve FS#27662 and FS#34195
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  if [[ $CARCH == x86_64 ]]; then

    msg2 "Building Wine-64..."

    mkdir $pkgname-64-build
    cd "$srcdir/$pkgname-64-build"
    ../$pkgname/configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --with-x \
      --without-gstreamer \
      --enable-win64
    # Gstreamer was disabled for FS#33655

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/$pkgname-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --with-x \
    --without-gstreamer \
    "${_wine32opts[@]}"

  # These additional flags solve FS#23277
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
}

package() {
  depends=(${_depends[@]})

  gitver=$(cd "$srcdir/$pkgname" && git describe --long | sed -r 's/^wine-//;s/([^-]*-g)/r\1/;s/-/./g')
  provides=("wine=$gitver") 
  if [[ $CARCH == x86_64 ]]; then   
    provides[2]="bin32-wine=$gitver"
    provides[3]="wine-wow64=$gitver"
  fi

  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$pkgname-64-build"
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
}
