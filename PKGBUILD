# Maintainer nfnty <arch at nfnty dot se>
# Maintainer evorster <evorster at gmail dot com>

pkgname=('mlt-git')
_srcname='mlt'
pkgdesc='Multimedia Framework'
pkgver=r5946.1673114203.0b1d574c 
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/mltframework/${_srcname}" license=('GPL2')
depends=( 	'libsamplerate'
		'sox'
		'ffmpeg'
		'vid.stab'
		'rtaudio'
		'libebur128'
		'opencv'
		'movit'
		'rubberband'
		'qt5-svg'
		'gdk-pixbuf2'
		'sdl12-compat'
		'libarchive'
		)

makedepends=( 	'ladspa'
                'frei0r-plugins'
		'sdl_image'
		'gtk2'
		'libdv'
		'libexif'
		'python'
		'swig'
		'git'
		'cmake'
		)

provides=("${pkgname[0]%-git}") conflicts=("${pkgname[0]%-git}")
source=(	"${_srcname}::git+${url}.git"
		)
sha512sums=(	'SKIP'
		)
pkgver(){ 	cd "${srcdir}/${_srcname}"
		printf 'r%s.%s.%s\n' \
		"$( git rev-list --count 'HEAD' )" \
    		"$( git log --max-count='1' --pretty='format:%ct' )" \
    		"$( git rev-parse --short 'HEAD' )"
		}

prepare(){ 	echo "Prepare"
		cd ${srcdir}/${_srcname}/src/modules/glaxnimate
		git submodule init
		git submodule update
		}

build(){ 	rm -rf build
		mkdir -p build
		cd build
		cmake "../mlt"\
		  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
		  -DCMAKE_INSTALL_PREFIX=/usr \
		  -DMOD_OPENCV=ON \
		  -DMOD_GLAXNIMATE=ON \
		  -DMOD_MOVIT=ON \
		  -DSWIG_PYTHON=ON
#Each swig binding adds another dependency, just adding Python to see how it works, 
#and it's relatively safe to assume that almost everyone has python installed
#-DSWIG_CSHARP
#-DSWIG_JAVA
#-DSWIG_LUA
#-DSWIG_NODEJS
#-DSWIG_PERL
#-DSWIG_PHP
#-DSWIG_PYTHON
#-DSWIG_RUBY
#-DSWIG_TCL
		make
		}

package(){ 	cd build 
		make DESTDIR="${pkgdir}" install 
		}
