# Maintainer [wine-staging]: John Schoenick <john@pointysoftware.net>
# Maintainer [wine]: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-staging-d3dadapter
_pkgbasename=wine
pkgver=1.7.48
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(http://ftp.winehq.org/pub/wine/source/1.7/wine-${pkgver}.tar.bz2
        "wine-staging-patches-v${pkgver}.tar.gz"::https://github.com/wine-compholio/wine-staging/archive/v${pkgver}.tar.gz
        30-win32-aliases.conf
	wine-d3d9-$pkgver.patch)
sha1sums=('df9445e0912a937743f804d6256fa2ebb4a502dd'
          '7c92f3f9807294b82164a16e3647d011002a4f1a' 
          '023a5c901c6a091c56e76b6a62d141d87cce9fdb'
          'fcf70114cbc3a1fd114c129cb09674fc8200525f')

# Uncomment to verify signature on tarball
# (disabled by default due to most AUR auto-builders choking on this feature and
# users not knowing what the hell)
#
#  source[${#source[@]}]="http://prdownloads.sourceforge.net/$_pkgbasename/$_pkgbasename-$_pkgbasever.tar.bz2.sign"
#  sha1sums[${#sha1sums[@]}]="SKIP"
#  validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7)

pkgdesc="A compatibility layer for running Windows programs, with additional staging patches not yet upstreamed (with d3dadapter patch)"
url="http://www.wine-staging.com"
arch=(i686 x86_64)
options=(staticlibs)
license=(LGPL)
install=wine.install

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
  mesa-libgl      lib32-mesa-libgl
  libcl           lib32-libcl
  libxslt         lib32-libxslt
  libpulse        lib32-libpulse
  libtxc_dxtn     lib32-libtxc_dxtn
  attr            lib32-attr
  samba
  opencl-headers
  dri2proto
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
  alsa-plugins    lib32-alsa-plugins
  alsa-lib        lib32-alsa-lib
  libjpeg-turbo   lib32-libjpeg-turbo
  libxcomposite   lib32-libxcomposite
  libxinerama     lib32-libxinerama
  ncurses         lib32-ncurses
  libcl           lib32-libcl
  libxslt         lib32-libxslt
  libpulse        lib32-libpulse
  libtxc_dxtn     lib32-libtxc_dxtn
  attr            lib32-attr
  cups
  samba           dosbox
)

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  _depends=(${_depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
  provides=("wine=$pkgver" "wine-compholio=${pkgver}" "wine-silverlight=${pkgver}")
  conflicts=('wine' 'wine-staging')
else
  makedepends=(${makedepends[@]} ${_depends[@]})
  provides=("bin32-wine=$pkgver" "wine-wow64=$pkgver" "wine=$pkgver" "wine-compholio=${pkgver}" "wine-silverlight=${pkgver}")
  conflicts=('bin32-wine' 'wine-wow64' 'wine'  'wine-staging')
fi

prepare() {
  cd "wine-staging-$_pkgbasever"/patches
  # Optionally replace --all with list of patchsets from this directory, e.g. winepulse-PulseAudio_Support
  ./patchinstall.sh DESTDIR="${srcdir}/wine-$_pkgbasever" --all

  cd "$srcdir/$_pkgbasename-$_pkgbasever"
  
  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*

  msg2 "patching d3d9..."
  patch -p1 -i "${srcdir}/wine-d3d9-${pkgver}.patch" 
}
build() {
  cd "$srcdir"

  # Allow ccache to work
  mv $_pkgbasename-$_pkgbasever $_pkgbasename

  cd $_pkgbasename
  autoreconf -f
  cd ..

  # Get rid of old build dirs
  rm -rf $_pkgbasename-{32,64}-build
  mkdir $_pkgbasename-32-build

  # These additional CPPFLAGS solve FS#27662 and FS#34195
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir $_pkgbasename-64-build
    cd "$srcdir/$_pkgbasename-64-build"
    ../$_pkgbasename/configure \
      --with-xattr \
      --prefix=/usr \
      --libdir=/usr/lib \
      --with-x \
      --with-d3dadapter \
      --without-gstreamer \
       --disable-tests \
      --enable-win64
    # Gstreamer was disabled for FS#33655

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/$_pkgbasename-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$_pkgbasename-32-build"
  ../$_pkgbasename/configure \
    --prefix=/usr \
    --with-xattr \
    --with-x \
    --without-gstreamer \
    --with-d3dadapter \
    --disable-tests \
    "${_wine32opts[@]}"

  # These additional flags solve FS#23277
  make CFLAGS+="-march=native -pipe -mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
}

package() {
  depends=(${_depends[@]})

  msg2 "Packaging Wine-32..."
  cd "$srcdir/$_pkgbasename-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$_pkgbasename-64-build"
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
