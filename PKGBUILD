# Maintainer: Evren Demirkan < gmail-com: evren.demirk4n >

pkgname=wine-starcraft-git
pkgver=2.6
pkgrel=1
pkgdesc="Wine Staging 2.6 with extra patches for StarCraft 1.18.x"
arch=('i686' 'x86_64')
url="https://github.com/awesie/wine-starcraft/"
license=('LGPL')
_depends=(
  'attr'             'lib32-attr'
  'fontconfig'       'lib32-fontconfig'
  'lcms2'            'lib32-lcms2'
  'libxml2'          'lib32-libxml2'
  'libxcursor'       'lib32-libxcursor'
  'libxrandr'        'lib32-libxrandr'
  'libxdamage'       'lib32-libxdamage'
  'libxi'            'lib32-libxi'
  'gettext'          'lib32-gettext'
  'freetype2'        'lib32-freetype2'
  'glu'              'lib32-glu'
  'libsm'            'lib32-libsm'
  'gcc-libs'         'lib32-gcc-libs'
  'libpcap'          'lib32-libpcap'
  'desktop-file-utils'
)
makedepends=('git' 'autoconf' 'ncurses' 'bison' 'perl' 'fontforge' 'flex'
  'gcc>=4.5.0-2'          'gcc-multilib>=4.5.0-2'
  'giflib'                'lib32-giflib'
  'libpng'                'lib32-libpng'
  'gnutls'                'lib32-gnutls'
  'libxinerama'           'lib32-libxinerama'
  'libxcomposite'         'lib32-libxcomposite'
  'libxmu'                'lib32-libxmu'
  'libxxf86vm'            'lib32-libxxf86vm'
  'libldap'               'lib32-libldap'
  'mpg123'                'lib32-mpg123'
  'openal'                'lib32-openal'
  'v4l-utils'             'lib32-v4l-utils'
  'alsa-lib'              'lib32-alsa-lib'
  'libxcomposite'         'lib32-libxcomposite'
  'mesa'                  'lib32-mesa'
  'libgl'                 'lib32-libgl'
  'opencl-icd-loader'     'lib32-opencl-icd-loader'
  'libxslt'               'lib32-libxslt'
  'libpulse'              'lib32-libpulse'
  'libva'                 'lib32-libva'
  'gtk3'                  'lib32-gtk3'
  'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
  'samba'
  'opencl-headers'
)
optdepends=(
  'giflib'                'lib32-giflib'
  'libpng'                'lib32-libpng'
  'libldap'               'lib32-libldap'
  'gnutls'                'lib32-gnutls'
  'mpg123'                'lib32-mpg123'
  'openal'                'lib32-openal'
  'v4l-utils'             'lib32-v4l-utils'
  'libpulse'              'lib32-libpulse'
  'alsa-plugins'          'lib32-alsa-plugins'
  'alsa-lib'              'lib32-alsa-lib'
  'libjpeg-turbo'         'lib32-libjpeg-turbo'
  'libxcomposite'         'lib32-libxcomposite'
  'libxinerama'           'lib32-libxinerama'
  'ncurses'               'lib32-ncurses'
  'opencl-icd-loader'     'lib32-opencl-icd-loader'
  'libxslt'               'lib32-libxslt'
  'libtxc_dxtn'           'lib32-libtxc_dxtn'
  'libva'                 'lib32-libva'
  'gtk3'                  'lib32-gtk3'
  'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
  'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
  'cups'
  'samba'
  'dosbox'
)
options=('staticlibs')
source=("$pkgname"::'git+https://github.com/awesie/wine-starcraft.git')
sha256sums=('SKIP')

if [ "$CARCH" = "i686" ]; then
	# Strip lib32 etc. on i686
	_depends=(${_depends[@]/*32-*/})
	makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
	makedepends=(${makedepends[@]/*-multilib*/})
	optdepends=(${optdepends[@]/*32-*/})
	provides=("wine-starcraft-git=$(echo ${pkgver})")
	conflicts=()
else
	makedepends=(${makedepends[@]} ${_depends[@]})
	provides=("wine-starcraft-git=$(echo ${pkgver})")
	conflicts=()
fi



build() {
	cd "${srcdir}"
	
	# Delete old build dirs (from previous builds) and make new ones
	rm --recursive --force "$pkgname"-{32,64}-build
	mkdir --parents "$pkgname"-32-build
	
	
	# Build wine 64-bit
	#+(according to the wine wiki this 64-bit/32-bit building order is mandatory)
	
	if [ "$CARCH" = "x86_64" ]; then
	    msg2 "Building Wine-Starcraft-git-64..."
	    
	    mkdir --parents "$pkgname"-64-build
	    cd  "$pkgname"-64-build
	    
	    ../$pkgname/configure \
	                    --prefix=/opt/$pkgname \
	                    --libdir=/opt/$pkgname/lib \
	                    --with-x \
	                    --with-gstreamer \
	                    --enable-win64 \
	                    --with-xattr
	
	    make
	    
	    _wine32opts=(
	            --libdir=/opt/$pkgname/lib32
	            --with-wine64="${srcdir}/${pkgname}-64-build"
	            )
	    
	    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	    
	fi
	
	
	# Build wine 32-bit
	
	msg2 "Building Wine-Starcraft-git-32..."
	
	cd "$srcdir"/"$pkgname"-32-build
	
	../$pkgname/configure \
	                --prefix=/opt/$pkgname \
	                --with-x \
	                --with-gstreamer \
	                --with-xattr \
	                "${_wine32opts[@]}"
	                
	make
	
}

package() {
	depends=(${_depends[@]})
	
	# Package wine 32-bit
	#+(according to the wine wiki this reverse 32-bit/64-bit packaging order is important)
	
	msg2 "Packaging Wine-32..."
	
	cd "$srcdir"/"$pkgname"-32-build
	
	if [ "$CARCH" = "i686" ]; then
	
	    make prefix="$pkgdir/opt/${pkgname}" install
	    
	else
	
	    make prefix="${pkgdir}/opt/${pkgname}" \
	         libdir="${pkgdir}/opt/${pkgname}/lib32" \
	         dlldir="${pkgdir}/opt/${pkgname}/lib32/wine" install
	         
	
	    # Package wine 64-bit
	    
	    msg2 "Packaging Wine-64..."
	    
	    cd "$srcdir"/"$pkgname"-64-build
	    
	    make prefix="${pkgdir}/opt/${pkgname}" \
	         libdir="${pkgdir}/opt/${pkgname}/lib" \
	         dlldir="${pkgdir}/opt/${pkgname}/lib/wine" install       
	fi
}
