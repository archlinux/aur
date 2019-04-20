# Maintainer: Roland Angerbauer <roland.angerbauer@gmail.com>

pkgname=wine-x64
pkgver=4.5
pkgrel=2

# replacing rc with -rc
# pkgver is not allowed to contain hyphens
_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/4.x/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf)
sha512sums=('261420efdf14595715cff5bb6a61223b0f2090b89dc05dca8c053a8a81abc3018715d41db50769a0f0488c658efc0742ac0f577b578e69eace70be4e463131dd'
            'a298565baf55ed69267ef1b23af997621d01ef1f6a97fc8031c156a513662e24f5785253fcf592d51b88ddd166a87d30cb2e01560f0a420689ff6ccff4c4ccff'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)
depends=(
  fontconfig      
  lcms2           
  libxml2        
  libxcursor     
  libxrandr       
  libxdamage      
  libxi           
  gettext       
  freetype2       
  glu             
  libsm           
  gcc-libs        
  libpcap         
  desktop-file-utils
)
makedepends=(
  autoconf
  ncurses
  bison
  perl
  flex
  'gcc>=4.5.0-2'
  giflib                
  libpng               
  gnutls                
  libxinerama          
  libxcomposite         
  libxmu                
  libxxf86vm            
  libldap               
  mpg123              
  openal              
  v4l-utils            
  libpulse              
  alsa-lib             
  libxcomposite         
  mesa                 
  mesa-libgl            
  opencl-icd-loader    
  libxslt               
  gst-plugins-base-libs 
)
optdepends=(
  giflib               
  libpng               
  libldap              
  gnutls             
  mpg123            
  openal             
  v4l-utils             
  libpulse              
  alsa-plugins         
  alsa-lib              
  libjpeg-turbo        
  libxcomposite         
  libxinerama           
  ncurses              
  opencl-icd-loader    
  libxslt              
  gst-plugins-base-libs 
  cups
  samba      
  dosbox
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
    --with-gstreamer \
    --without-capi \
    --without-hal \
    --without-vkd3d \
    --without-opencl \
    --without-oss \
    --without-faudio \
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
