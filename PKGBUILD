# Maintainer: veluria <veluria ät anche.no>
# Based on the wine package in the community repository
# and various existing wine AUR packages

pkgname=wine-visual-novel-reader
_pkgname=wine
pkgver=1.7.47
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=("http://prdownloads.sourceforge.net/wine/wine-${pkgver}.tar.bz2"
        "livino-wine-1.6.2.patch")
sha256sums=('ba74f75aec400dc4b1d64ddc29560e4946837e73cb19d9c231604ff0147bbb2e'
            'c0c589ef61781fca51bfb4513c772622af2ab261f3ee17b59f941ae0f143bd31')

pkgdesc="Patched wine with custom prefix for text extraction from visual novels"
url="http://www.winehq.com"
arch=(i686 x86_64)
options=(staticlibs)
license=(LGPL)
install=wine-visual-novel-reader.install

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
  libpcap         lib32-libpcap
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
  lcms2           lib32-lcms2
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  alsa-lib        lib32-alsa-lib
  libxcomposite   lib32-libxcomposite
  mesa            lib32-mesa
  libgl           lib32-libgl
  libcl           lib32-libcl
  libxslt         lib32-libxslt
  samba
  opencl-headers
)
  
optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  gnutls          lib32-gnutls
  lcms2           lib32-lcms2
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
  libxslt         lib32-libxslt
  cups
  samba           dosbox
)

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  _depends=(${_depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
else
  makedepends=(${makedepends[@]} ${_depends[@]})
fi

# Use a different wine prefix
_prefix="/opt/${pkgname}"
_sysconf="${_prefix}/etc"

prepare() {
  cd "$_pkgname-$pkgver"

  patch -p1 < "${srcdir}/livino-wine-1.6.2.patch"
  #sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*

  # Picked up changed configuration after patching
  autoreconf -f
  tools/make_requests
}

build() {
  cd "$srcdir"

  # remove once https://bugs.winehq.org/show_bug.cgi?id=38653 is resolved
  export CFLAGS="${CFLAGS/-O2/} -O0"
  export CXXFLAGS="${CXXFLAGS/-O2/} -O0"

  # Allow ccache to work
  rm -rf "$pkgname"
  mv "$_pkgname-$_pkgbasever" "$pkgname"

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
      --prefix="${_prefix}" \
      --sysconfdir="${_sysconf}" \
      --libdir="${_prefix}/lib" \
      --with-x \
      --without-gstreamer \
      --enable-win64 \
      --disable-tests
    # Gstreamer was disabled for FS#33655

    make

    _wine32opts=(
      --libdir=/${_prefix}/lib32
      --with-wine64="$srcdir/$pkgname-64-build"
    )

    export PKG_CONFIG_PATH="${_prefix}/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "${srcdir}/${pkgname}-32-build"
  ../$pkgname/configure \
    --prefix="${_prefix}" \
    --sysconfdir="${_sysconf}" \
    --with-x \
    --with-xattr \
    --without-gstreamer \
    --disable-tests \
    "${_wine32opts[@]}"

  # These additional flags solve FS#23277
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
}

package() {
  depends=(${_depends[@]})

  msg2 "Packaging Wine-32..."
  cd "${srcdir}/${pkgname}-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="${pkgdir}/${_prefix}" install
  else
    make prefix="${pkgdir}/${_prefix}" \
      libdir="${pkgdir}/${_prefix}/lib32" \
      dlldir="${pkgdir}/${_prefix}/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "${srcdir}/${pkgname}-64-build"
    make prefix="${pkgdir}/${_prefix}" \
      libdir="${pkgdir}/${_prefix}/lib" \
      dlldir="${pkgdir}/${_prefix}/lib/wine" install
  fi
  
  #mkdir -p "${pkgdir}/usr/bin"
  #ln -s "${_prefix}/bin/wine" "${pkgdir}/usr/bin/wine-vn"
}

# vim:set ts=8 sts=2 sw=2 et:
