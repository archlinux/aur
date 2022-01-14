# Maintainer: rdb <me@rdb.name>
# Contributor: Andy Mender <andymenderunix@gmail.com>
# Contributor: David Radford <croxis gmail com>
# Contributor: Faule Socke <github@socker.lepus.uberspace.de>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Hubert Grzeskowiak <arch at nemesis13 de>

pkgname=panda3d-git
pkgver=r25265.ce7c1ec16c
pkgrel=1
pkgdesc="A 3D game engine with Python bindings. SDK package. Git Version. Optional dependencies you want to support need to be installed before panda3d."
url="https://github.com/panda3d/panda3d"
arch=('i686' 'x86_64')
license=('BSD')
provides=('panda3d')
install=panda3d-git.install
conflicts=('panda3d')
# Dependencies recommended by upstream and available in main repositories
# Double-checked with 'namcap'
depends=('libpng' 'libtiff' 'zlib' 'openssl'
         'libgl' 'libxrandr' 'libxcursor'
         'freetype2' 'libvorbis' 'openal'
         'assimp' 'openexr'
         'desktop-file-utils' 'shared-mime-info')
makedepends=('python' 'bison' 'cmake' 'flex' 'git')

# PYTHON NOTICE: To use the old python2 bindings switch all python references to python2

# NOTICE: please read http://www.panda3d.org/manual/index.php/Dependencies for
# more information. Optdepends you want your package to support need to be
# installed during compiletime! You don't need to change anything in the
# pkgbuild to get support; makepanda automatically detects available
# dependencies.
optdepends=(# Recommended
            'xorg-server: X11 support'
            'libjpeg: JPEG image format support'
            'python2: Python 2 bindings'
            'python: Python 3 bindings'
            'ffmpeg: Required to load and play video textures'
            'ode: Support for the ODE physics engine'
            'libxxf86dga: Relative mouse mode (AUR)'
            'bullet: Support for the Bullet physics engine'
            'opusfile: Support for manipulating opus audio files'
            'eigen: Optimised linear algebra library'
            # Optional
            'nvidia-cg-toolkit: Automatic shader support'
            'gtk2: PStats profiling server'
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
source=('panda3d::git+https://github.com/panda3d/panda3d.git'
        'panda3d-git.install')
md5sums=('SKIP'
         '85fa99c55d4458014976196306eca716')
sha256sums=('SKIP'
            '75832d97bfce7c6b1b314a91c27bf67479289657e5e03f2be50b1854cdc7d92d')

JOBS=$(nproc)

pkgver() {
  cd panda3d
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/panda3d
  # disable broken extensions
  # you can use PANDAFLAGS and BUILD_THREADS to control building
  # building is very memory intensive so you might want to use fewer threads
  python makepanda/makepanda.py --everything --no-maya2012 ${PANDAFLAGS} --threads ${BUILD_THREADS:-$JOBS}
}

package() {
  cd $srcdir/panda3d
  python makepanda/installpanda.py --prefix=/usr --destdir="$pkgdir"
  install -D -m644 "$srcdir/panda3d/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
