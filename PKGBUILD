# Maintainer  : Anish Bhatt anish [at] gatech [dot] edu
# Based on the wine package in the community repository

pkgname=wine-staging
pkgver=1.7.47
pkgrel=1
pkgdesc="wine-staging, wine patched with extra funtionality including CSMT, PulseAudio, ACL and CUDA support"
url="http://www.wine-staging.com/"
license=('LGPL2.1')
arch=('x86_64' 'i686')
options=(staticlibs !ccache)
install=wine-staging.install

# source=(http://prdownloads.sourceforge.net/wine/wine-${pkgver}.tar.bz2{,.sign}
source=(http://ftp.winehq.org/pub/wine/source/1.7/wine-${pkgver}.tar.bz2
        "https://github.com/wine-compholio/wine-staging/archive/v${pkgver}.tar.gz"
        "30-win32-aliases.conf")

md5sums=('f7f5254c5fdfa57a290f61466bbad3a8'
         'faa4e0e35bd3fff0963a99125bc1f9ba'
         '1ff4e467f59409272088d92173a0f801')

#validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7) # Alexandre Julliard

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
  attr            lib32-attr
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex prelink git
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
  libtxc_dxtn     lib32-libtxc_dxtn
  cups
  oss
  pulseaudio
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
  provides=("bin32-wine=$pkgver" "wine-wow64=$pkgver")
  conflicts=('bin32-wine' 'wine-wow64')
  replaces=('bin32-wine')
fi

_upname="wine-${pkgver}"

# Uncomment the line below if you want wine installed to /opt/wine-staging instead of replacing wine
#customprefix=1

if [[ $customprefix != 1 ]]; then
  _prefix="/usr"
  _sysconf="/etc"
  conflicts+=('wine' 'wine-compholio' 'wine-silverlight')
  provides+=("wine=${pkgver}" "wine-compholio=${pkgver}" "wine-silverlight=${pkgver}")
else
  # change _prefix if you don't want to use the default custom prefix of /opt/wine-staging
  _prefix="/opt/${pkgname}"
  _sysconf="${_prefix}/etc"
  conflicts+=('wine-compholio' 'wine-silverlight')
  provides+=("wine-compholio=${pkgver}" "wine-silverlight=${pkgver}")
fi

prepare() {
  pushd "${srcdir}"

  # This is incorrect (even in the official package), disabling for now
  #pushd ${_upname}
  #sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*
  #popd

  # Get rid of old build dirs
  rm -rf ${pkgname}-{32,64}-build
  mkdir ${pkgname}-32-build

  if [[ $CARCH == x86_64 ]]; then
    mkdir ${pkgname}-64-build
  fi

  #Remove -O2 to fix runtime failures 
  export CFLAGS="${CFLAGS/-O2/} -O0"
  export CPPFLAGS="${CPPLAGS/-O2/} -O0"

  # These additional CPPFLAGS solve FS#27662 and FS#34195
  export CFLAGS="$CFLAGS -DHAVE_ATTR_XATTR_H=1"
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  pushd "${srcdir}"/"${_upname}"

  # use upstream Makefile to apply patches and to call make_requests / autoreconf
  # make -C "$srcdir/wine-staging-${pkgver}/patches/" DESTDIR="$srcdir/${_upname}" install
  # patchinstall.sh is the updated way to call above command
  "${srcdir}/wine-staging-${pkgver}/patches/patchinstall.sh" DESTDIR="${srcdir}/${_upname}" --all --no-autoconf

  # Picked up changed configuration after patching
  autoreconf -f
  tools/make_requests

  popd
  popd
}

build() {

  pushd "${srcdir}"

  if [[ $CARCH == x86_64 ]]; then

    msg2 "Building Wine-64..."
    pushd "${srcdir}/${pkgname}-64-build"
    ../$_upname/configure \
      --prefix="${_prefix}" \
      --sysconfdir="${_sysconf}" \
      --libdir="${_prefix}/lib" \
      --with-x \
      --with-xattr \
      --without-gstreamer \
      --enable-win64 \
      --disable-tests
    # Gstreamer was disabled for FS#33655
    make

    _wine32opts=(
      --libdir=/${_prefix}/lib32
      --with-wine64="${srcdir}/${pkgname}-64-build"
    )

    export PKG_CONFIG_PATH="${_prefix}/lib32/pkgconfig"
    popd
  fi

  msg2 "Building Wine-32..."
  pushd "${srcdir}/${pkgname}-32-build"
  ../$_upname/configure \
    --prefix="${_prefix}" \
    --sysconfdir="${_sysconf}" \
    --with-x \
    --with-xattr \
    --without-gstreamer \
    --disable-tests \
    "${_wine32opts[@]}"

  # These additional flags solve FS#23277
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
  popd
  popd
}

package() {
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

  # Font aliasing settings for Win32 applications
if [[ $customprefix != 1 ]]; then
  install -d "${pkgdir}"/etc/fonts/conf.{avail,d}
  install -m644 "${srcdir}/30-win32-aliases.conf" "${pkgdir}/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/etc/fonts/conf.d/30-win32-aliases.conf"
fi

  # Provide symlinks in /opt/wine-compholio/bin

  if [[ "${_prefix}" != "/opt/wine-compholio" ]]; then
    mkdir -p "${pkgdir}/opt/wine-compholio/bin"
    for _file in $(ls "${pkgdir}/${_prefix}/bin"); do \
      ln -s "${_prefix}/bin/$_file" "${pkgdir}/opt/wine-compholio/bin/$_file"; \
    done
  fi

}
# vim:set ts=2 sw=2 tw=0 et:
