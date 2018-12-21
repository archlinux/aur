# Maintainer: Roland Angerbauer <roland.angerbauer@gmail.com>

pkgname=wine-x64
pkgver=3.21
pkgrel=1

# replacing rc with -rc
_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/3.x/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf
        wine-binfmt.conf)
sha512sums=('dd64a6778bf1b848c8fe14dc26cfca21f6c1c92714ca1b2e932a28560a2adc1f69aa1b2cba250f49a5df4f91a4accde677a2afaf960c200d3998eac1957b5c6b'
            'SKIP'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285')
validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7
              DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

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
makedepends=(autoconf ncurses bison perl fontforge flex
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
  vulkan-icd-loader   
  vulkan-headers
  samba
  opencl-headers
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
install=${pkgname}.install

prepare() {
  # Allow ccache to work
  mv wine-$_pkgbasever wine

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine/configure*

  # Get rid of old build dirs
  rm -rf wine-64-build
}

build() {
  cd "$srcdir"

  msg2 "Building Wine-64..."

  mkdir wine-build
  cd "$srcdir/wine-build"
  ../wine/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --with-gstreamer \
    --enable-win64
  # Gstreamer was disabled for FS#33655

  make
}

package() {
  msg2 "Packaging Wine-64..."
  cd "$srcdir/wine-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install
}

