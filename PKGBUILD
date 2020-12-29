# Jose Riha: Jose Riha <jose 1711 gmail com>
# Maintainer: Andy Mender <andymenderunix@gmail.com>
# Contributor: David Radford <croxis gmail com>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Tucos <baspape@gmail.com>

pkgname=panda3d
pkgver=1.10.8
pkgrel=1
pkgdesc="A 3D game engine with Python bindings. SDK package. Optional dependencies you want to support need to be installed before panda3d."
url="http://www.panda3d.org"
arch=('i686' 'x86_64')
license=('BSD')
depends=('desktop-file-utils' 'shared-mime-info' 'xorg-server' 'libgl'
         'openssl' 'libjpeg' 'libpng' 'libtiff' 'freetype2' 'gtk2'
         'openal' 'libxrandr' 'libxcursor')
makedepends=('python' 'bison' 'cmake' 'flex')

# NOTICE: please read http://www.panda3d.org/manual/index.php/Dependencies for
# more information. Optdepends you want your package to support, need to be
# installed before compiletime! You don't need to change anything in the
# pkgbuild to get support; makepanda automatically detects available
# dependencies.

optdepends=(# Pretty much required
            'xorg-server: X11 support'
            'libgl: OpenGL support for X11'
            # Recommended
            'python: Python 3 bindings'
            'ffmpeg: Required to load and play video textures'
            'libjpeg: Required to read and write jpeg images'
            'libpng: Required to read and write png images'
            'freetype2: Required to use dynamic fonts (such as TTF fonts)'
            'gtk2: PStats analysis and debugging tool'
            'libtiff: Required to read and write tiff images'
            'nvidia-cg-toolkit: shader support'
            'ode-compat: Support for the ODE physics engine'
            'openal: OpenAL audio'
            'zlib: Compression support'
            'libxxf86dga: Relative mouse mode'
            'libvorbis: Used to load .ogg files encoded with Vorbis.'
            'openexp: OpenEXR image format support'
            # Optional
            'assimp: Open Asset Import'
            'opus: Read .opus audio files'
            'bullet: Support for the physics engine'
            'eigen: Optimised linear algebra library'
            'fmodex: FMod audio'
            'libxcursor: Custom cursor icons'
            'libxrandr: Resolution switching'
            #'librocket: Librocket GUI support'
            'libsquish: DXT support (AUR)'
            'artoolkit: library for augmented reality (AUR)'
            'opencv: alternative to ffmpeg for video texture support'
            'fcollada: used for dae2egg and for loading dae files directly into Panda (unavailable)'
            'vrpn-git: support for virtual reality trackers.'
            'opusfile: support for the opus audio format'
            'openexr: support for the EXR image format'
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
  python makepanda/makepanda.py --everything --no-opencv --no-opencv --no-maya2012 --no-fmodex --no-gles --no-gles2 --no-egl ${PANDAFLAGS} --threads ${BUILD_THREADS:-$JOBS}
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python makepanda/installpanda.py --prefix=/usr --destdir="$pkgdir"
  install -D -m644 "$srcdir/${pkgname}-$pkgver/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
