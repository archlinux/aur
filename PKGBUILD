# Maintainer: Roland Angerbauer <roland.angerbauer@gmail.com>

pkgname=wine-x64
pkgver=4.7
pkgrel=1

# replacing rc with -rc
# pkgver is not allowed to contain hyphens
_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/4.x/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf)
sha512sums=('cb768528db510f81d464b9c1bb48847162baaa86ef00dc7a418afdce38aa51262d150c14b3362fb40c93cc2e3633fc02b2916167f21af8a708eb393da6ba9163'
            '5ab8ee632d5cddbcc36fe68b7cfa06c5d8f77670af5ac2ed9e6eedbe4390a14d461b5920e199dc35f55b25f184f71d7718a54a250dd10fa30ced65e3c1c0f4a6'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)
depends=(
  libx11
  fontconfig      
  lcms2           
  sdl2
#  libxml2        
  libxcursor     
  libjpeg
  libxslt
  libxrandr
#  libxdamage      
  libxi           
#  gettext       
  freetype2       
#  glu             
#  libsm           
#  gcc-libs        
#  libpcap         
#  desktop-file-utils
)
makedepends=(
#  autoconf
#  ncurses
#  bison
#  perl
#  flex
#  'gcc>=4.5.0-2'
#  giflib                
#  libpng               
#  gnutls                
#  libxinerama          
#  libxcomposite         
#  libxmu                
#  libxxf86vm            
#  libldap               
#  mpg123              
#  openal              
#  v4l-utils            
#  libpulse              
#  alsa-lib             
#  libxcomposite         
#  mesa                 
#  mesa-libgl            
#  opencl-icd-loader    
#  libxslt               
#  gst-plugins-base-libs 
)
optdepends=(
#  giflib               
#  libpng               
#  libldap              
#  gnutls             
#  mpg123            
#  openal             
#  v4l-utils             
#  libpulse              
#  alsa-plugins         
#  alsa-lib              
#  libjpeg-turbo        
#  libxcomposite         
#  libxinerama           
#  ncurses              
#  opencl-icd-loader    
#  libxslt              
#  gst-plugins-base-libs 
#  cups
#  samba      
#  dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})

prepare() {

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine-$_pkgbasever/configure*

  # Get rid of old build dirs
  rm -rf wine-64-build
}

build() {
  msg2 "building wine-$_pkgbasever ..."

  cd wine-$_pkgbasever

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --without-gstreamer \
    --without-capi \
    --without-hal \
    --without-vkd3d \
    --without-vulkan \
    --without-opencl \
    --without-oss \
    --without-faudio \
    --without-gsm \
    --without-pulse \
    --without-mpg123 \
    --without-sane \
    --without-gphoto \
    --without-openal \
    --without-cups \
    --without-v4l2 \
    --enable-win64

  make
}

package() {
  msg2 "packaging wine-$_pkgbasever ..."

  cd wine-$_pkgbasever

  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # font aliasing settings
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
}
