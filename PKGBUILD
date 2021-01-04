# Jose Riha: Jose Riha <jose 1711 gmail com>
# Maintainer: Andy Mender <andymenderunix@gmail.com>
# Contributor: David Radford <croxis gmail com>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Tucos <baspape@gmail.com>

pkgname=panda3d
pkgver=1.10.8
pkgrel=4
pkgdesc="A 3D game engine with Python bindings. SDK package. Optional dependencies you want to support need to be installed before panda3d."
url="http://www.panda3d.org"
arch=('i686' 'x86_64')
license=('BSD')
# Dependencies recommended by upstream and available in main repositories
# Double-checked with 'namcap'
depends=('libpng' 'libtiff' 'zlib' 'openssl'
         'libgl' 'libxrandr' 'libxcursor'
         'freetype2' 'libvorbis' 'openal'
         'gtk2' 'assimp' 'openexr'
         'desktop-file-utils' 'shared-mime-info')
makedepends=('python' 'bison' 'cmake' 'flex')

# NOTICE: please read http://www.panda3d.org/manual/index.php/Dependencies for
# more information. Optdepends you want your package to support, need to be
# installed before compiletime! You don't need to change anything in the
# pkgbuild to get support; makepanda automatically detects available
# dependencies.
optdepends=(# Recommended
            'xorg-server: X11 support'
            'libjpeg: JPEG image format support'
            'python: Python 3 bindings'
            'ffmpeg: Required to load and play video textures'
            'ode: Support for the ODE physics engine'
            'libxxf86dga: Relative mouse mode (AUR)'
            'bullet: Support for the Bullet physics engine'
            'opusfile: Support for manipulating opus audio files'
            'eigen: Optimised linear algebra library'
            # Optional
            'nvidia-cg-toolkit: Shader support'
            'opencv: alternative to ffmpeg for video texture support'
            'fftw: Support for discrete Fourier transform (DFT)'
            'fmodex: Advanced audio engine support (AUR)'
            'librocket-asarium-git: librocket GUI support (AUR)'
            'libsquish: DXT support (AUR)'
            'vrpn-git: Support for virtual reality trackers (AUR)'
            # 'artoolkit: library for augmented reality (unavailable)'
            # 'fcollada: used for dae2egg and for loading dae files directly into Panda (unavailable)'
            # ARM stuff, not really applicable, stated for completeness
            # NOTE: if you have libgles, you _must_ install libegl for this package to compile
            'libgles: OpenGL ES support'
            'libegl: GLX for OpenGL ES'
            )

install='panda3d.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/panda3d/panda3d/archive/v$pkgver.tar.gz"
        'panda3d.install'
        'libdir_fix.patch')
sha256sums=('d969e3d998944cbac3f6cb872d2fcff53361a1fa9997ff511dc72031318e96a6'
            'e67aaaf6e2e9b0ac56444e5a3c8140a5d1e311d356d937fa161ca9b863a3bb0f'
            '0ae2d418ac574cdf0c164df9b86836c7f1e0893d53721647c9353bae3d0204da')
md5sums=('387ca03839cd6cad2622897b9e3ad4ef'
         '057269173f3c1987953302519bc744fa'
         '44d5cd0d121ec966f52d6ca00fdf81eb')

JOBS=$(nproc)

prepare() {
  cd "$srcdir/${pkgname}-$pkgver/makepanda"
  patch -p0 -i "$srcdir/libdir_fix.patch"
}

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python makepanda/makepanda.py --everything --no-maya2012 --no-gles --no-gles2 --no-egl ${PANDAFLAGS} --threads ${BUILD_THREADS:-$JOBS}
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python makepanda/installpanda.py --prefix=/usr --destdir="$pkgdir"
  install -D -m644 "$srcdir/${pkgname}-$pkgver/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
