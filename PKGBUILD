# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

# To build with python support, set this vairable in your /etc/makepkg.conf
# (Or here, or before calling makepkg)
# It is only disabled because it is at EOL and requires additional AUR-packages.
if [[ "$_k3d_python" != "ON" ]]; then
  _k3d_python=OFF
fi

pkgname=k3d-git
pkgver=0.8.0.6+17
pkgrel=2
pkgdesc="3D modelling and animation software"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.k-3d.org"
license=('GPL')
depends=('ftgl' 'cairomm' 'dbus-glib' 'freetype2' 'glibmm' 'gtkglext' 'gtkmm'
         'gtksourceview2' 'gts' 'imagemagick' 'openexr' 'libglvnd' 'glew' 'zlib'
         'libpng' 'libsigc++' 'expat' 'boost-libs' 'graphviz' 'opencollada')
optdepends=('aqsis: Rendering engine')
makedepends=('boost' 'cmake' 'icoutils' 'gendesk' 'git'
             'asciidoc' 'doxygen' 'libxslt')
provides=('k3d')
conflicts=('k3d')

if [[ $_k3d_python = ON ]]; then
  depends+=('boost-python2-libs' 'python2')
  makedepends+=('boost-python2')
fi

source=("git+https://github.com/K-3D/k3d.git"
        "k3d.appdata.xml"
        "workaround.xml"
        # patches from fedora
        "https://src.fedoraproject.org/rpms/k3d/raw/f30/f/0102-Avoid-signed-unsigned-int-warning.patch"
        "https://src.fedoraproject.org/rpms/k3d/raw/f30/f/0103-Use-usr-bin-python2-instead-of-usr-bin-python.patch")
sha256sums=('SKIP'
            '5ffc7ede569bbd1b35bf6d66cec606c948fd34687fc65ab1d4c3d4c5c81cddc2'
            'daedd5319c44fc773e1f1f41abb1f2950f0edab2f2d5978e23ecc46eaeef2318'
            '7cdef0cac28ac183a5b2b1d41780ffa2902e3eb512a3941fa1a39acb46df9428'
            '9e701b2f514aaf875c7b5ba0e1f55c73f5e3afb77dde3a6dccea5b2ebce96f1d')

pkgver() {
  cd k3d

  git describe --tags | sed -e s/k3d-// -e s/-/+/ -e s/-.*//
}


prepare() {
  cd k3d

  # optional
  patch -p1 < "$srcdir"/0102-Avoid-signed-unsigned-int-warning.patch

  # required for Python 2 on Arch
  patch -p1 < "$srcdir"/0103-Use-usr-bin-python2-instead-of-usr-bin-python.patch
  sed -i -e "s/K3D_BOOST_COMPONENTS python)/K3D_BOOST_COMPONENTS python27)/" CMakeLists.txt

  # https://github.com/K-3D/k3d/issues/42
  sed -i -e "/^namespace k3d/i\ #include <algorithm>" k3dsdk/property_collection.cpp

  # https://github.com/K-3D/k3d/issues/43
  rm -r k3dsdk/gil/boost/gil/extension/numeric
}

build() {
  mkdir -p k3d-build
  cd k3d-build

  if [[ $_k3d_python != ON ]]; then
    echo "==> Building without Python support"
  fi

  # Debian sets the -frounding-math option
  export CFLAGS="$CFLAGS -frounding-math"
  export CXXFLAGS="$CXXFLAGS -frounding-math -DBOOST_BIND_GLOBAL_PLACEHOLDERS"

  # The cmake script finds a mix of imagmagick 6 and 7, specify 7 directly.
  # The python paths are given to sort out python 3.
  # The openexr module does not compile anymore and is thus disabled.
  # And set the cmake policy to link against the new OpenGL library.
  cmake ../k3d \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_POLICY_DEFAULT_CMP0072=NEW \
      -DPYTHON_EXECUTABLE=/usr/bin/python2 \
      -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
      -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
      -DBoost_PYTHON_LIBRARY=/usr/lib/libboost_python27.so \
      -DK3D_ENABLE_PYTHON=$_k3d_python \
      -DK3D_BUILD_NGUI_PYTHON_SHELL_MODULE=$_k3d_python \
      -DK3D_BUILD_PYTHON_MODULE=$_k3d_python \
      -DK3D_BUILD_PYUI_MODULE=$_k3d_python \
      -DK3D_BUILD_OPENEXR_IO_MODULE=OFF \
      -DImageMagick_Magick++_ARCH_INCLUDE_DIR=/usr/include/ImageMagick-7 \
      -Wno-dev

  make
}

package() {
  # For some reason the file generation fails for this one:
  cp workaround.xml k3d-build/lib/k3d/plugins/k3d-imagemagick-io.module.proxy

  cd k3d-build
  make install DESTDIR="$pkgdir"

  # metadata
  install -Dm644 "$srcdir"/k3d.appdata.xml "$pkgdir"/usr/share/metainfo/k3d.appdata.xml

  # create launcher
  cd "$pkgdir"/usr/share/applications
  gendesk -f -n \
      --pkgname="k3d" \
      --name="K-3D" \
      --genericname="3D modelling and animation" \
      --comment="view and create 3D modells and animations" \
      --startupnotify=True \
      --exec=k3d \
      --categories='Graphics;3DGraphics;GTK'

  # cut icons
  for size in 22 24 32 36 64 72 96 128 192 256 384
  do
    case $size in
      *)
        mkdir -p "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
        ;;&
    384)
        convert -crop 384x384+10+10 \
           "$srcdir"/k3d/share/k3d/icons/k3d_large.png \
           "$pkgdir"/usr/share/icons/hicolor/384x384/apps/k3d.png
        ;;
      *)
        convert -crop 377x377+13+14 -resize ${size}x${size} \
           "$srcdir"/k3d/share/k3d/icons/k3d_large.png \
           "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/k3d.png
        ;;
    esac
  done
}
