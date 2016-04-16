# Maintainer: David Radford <croxis gmail com>
# Contributor: Faule Socke <github@socker.lepus.uberspace.de>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Hubert Grzeskowiak <arch at nemesis13 de>

pkgname=panda3d-git
pkgver=v1.9.1.r472.gd3071d1
pkgrel=1
pkgdesc="A 3D game engine with Python bindings. SDK package. Git Version. Optional dependencies you want to support need to be installed before panda3d."
url="http://www.panda3d.org"
arch=('i686' 'x86_64')
license=('BSD')
provides=('panda3d')
conflicts=('panda3d')

depends=('desktop-file-utils' 'shared-mime-info'
         'python')
makedepends=('bison' 'cmake' 'git')

# PYTHON NOTICE: To use the old python2 bindings switch all python references to python2

# NOTICE: please read http://www.panda3d.org/manual/index.php/Dependencies for
# more information. Optdepends you want your package to support need to be
# installed during compiletime! You don't need to change anything in the
# pkgbuild to get support; makepanda automatically detects available
# dependencies.
optdepends=(# Pretty much required
            'xorg-server: X11 support'
            'libgl: OpenGL support for X11'
            # Recommended
            #'python2: Python2 bindings.'
            'python: Python3 bindings'
            'openssl: Provides some networking and encryption support'
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
            'artoolkit: library for augmented reality (AUR)'
            'assimp: Import various well-known 3D model formats in an uniform manner'
            'bullet: Support for the physics engine'
            'eigen: Optimised linear algebra library'
            'ffmpeg: Required to load and play video textures and play mp3s (broken)'
            'fmodex: FMod audio'
            'libxcursor: Custom cursor icons'
            'libxrandr: Resolution switching'
            'librocket: Librocket GUI support'
            'libsquish: DXT support (AUR)'
            'opencv: alternative to ffmpeg for video texture support'
            'fftw: Lossy animation compression in bam files (Does not work)'
            'fcollada: used for dae2egg and for loading dae files directly into Panda (unavailable)'
            'vrpn: support for virtual reality trackers (unavailable)'
            # ARM stuff, not really applicable, stated for completeness
            # NOTE: if you have libgles, you _must_ install libegl for this package to compile
            'libgles: OpenGL ES support'
            'libegl: GLX for OpenGL ES'
            )

source=('panda3d::git+https://github.com/panda3d/panda3d.git')
md5sums=('SKIP')
sha256sums=('SKIP')

JOBS=$(nproc)

build() {
  cd $srcdir/panda3d
  # disable broken extensions
  # you can use PANDAFLAGS and BUILD_THREADS to control building
  # building is very memory intensive so you might want to use less threads
  python makepanda/makepanda.py --everything --no-opencv --no-maya2012 --no-fmodex --no-gles --no-gles2 --no-ffmpeg ${PANDAFLAGS} --threads ${BUILD_THREADS:-$JOBS}
}

package() {
  cd $srcdir/panda3d
  python makepanda/installpanda.py --prefix=/usr --destdir="$pkgdir"
  install -D -m644 "$srcdir/panda3d/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
  ldconfig
  update-mime-database usr/share/mime
  update-desktop-database -q
}

post_upgrade() {
  update-mime-database usr/share/mime
  update-desktop-database -q
}

post_remove() {
  update-mime-database usr/share/mime
  update-desktop-database -q
}

pkgver() {
  cd "panda3d"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
