# Maintainer: David Radford <croxis gmail com>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Tucos <baspape@gmail.com>

pkgname=panda3d
pkgver=1.9.0
pkgrel=3
pkgdesc="A 3D game engine with Python bindings. SDK package. Optional dependencies you want to support need to be installed before panda3d."
url="http://www.panda3d.org"
arch=('i686' 'x86_64')
license=('BSD')
depends=('desktop-file-utils' 'shared-mime-info' 'xorg-server' 'libgl'
         'openssl' 'libjpeg' 'libpng' 'libtiff' 'freetype2' 'gtk2'
         'openal' 'libxrandr' 'libxcursor' 'libxxf86dga')
makedepends=('python2' 'bison' 'subversion' 'cmake')

# NOTICE: please read http://www.panda3d.org/manual/index.php/Dependencies for
# more information. Optdepends you want your package to support, need to be
# installed before compiletime! You don't need to change anything in the
# pkgbuild to get support; makepanda automatically detects available
# dependencies.
optdepends=(# Pretty much required
            'xorg-server: X11 support'
            'libgl: OpenGL support for X11'
            # Recommended
            'python2: python2 bindings'
            'python: Experimental python 3 bindings'
            'openssl: Provides some networking and encryption support'
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
            # Optional
            'bullet: Support for the physics engine'
            'eigen: Optimised linear algebra library'
            'fmodex: FMod audio'
            'libxcursor: Custom cursor icons'
            'libxrandr: Resolution switching'
            'librocket: Librocket GUI support'
            'libsquish: DXT support (AUR)'
            'artoolkit: library for augmented reality (AUR)'
            'opencv: alternative to ffmpeg for video texture support'
            'fftw: Lossy animation compression in bam files (Does not work)'
            'fcollada: used for dae2egg and for loading dae files directly into Panda (unavailable)'
            'vrpn: support for virtual reality trackers (unavailable)'
            # ARM stuff, not really applicable, stated for completeness
            # NOTE: if you have libgles, you _must_ install libegl for this package to compile
            'libgles: OpenGL ES support'
            'libegl: GLX for OpenGL ES'
            )

install='panda3d.install'
source=("$url/download/panda3d-$pkgver/panda3d-$pkgver.tar.gz"
        'panda3d.install')
md5sums=('3318f2ea070c46a93d736317f98f7da4'
         '057269173f3c1987953302519bc744fa')
JOBS=$(nproc)

build() {
  cd "$srcdir/panda3d-$pkgver"

  # disable broken extensions
  python2 makepanda/makepanda.py --everything --no-opencv --no-opencv --no-maya2012 --no-fmodex --no-gles --no-gles2 --threads $JOBS
}

package() {
  cd "$srcdir/panda3d-$pkgver"
  python2 makepanda/installpanda.py --prefix=/usr --destdir="$pkgdir"
  install -D -m644 "$srcdir/panda3d-$pkgver/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
