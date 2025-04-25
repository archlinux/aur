pkgname=ns3-git
_pkgname=ns-3-dev
pkgver=3.44.r114.g970f9aa
pkgrel=1
pkgdesc='Discrete-event network simulator for Internet systems'
arch=('x86_64')
url='http://www.nsnam.org/'
license=('GPL-2.0-only')
depends=('brite'
         'cairo'
         'cblas'
         'click-ns3'
         'glib2'
         'glibc'
         'gsl'
         'gtk3'
         'ipython'
         'libxml2'
         'pango'
         'python'
         'python-cairo'
         'python-cppyy'
         'python-cpycppyy'
         'python-gobject'
         'python-packaging'
         'python-pygraphviz'
         'python-traitlets'
         'sqlite'
         )
makedepends=('boost'
             'cmake'
             'eigen'
             'git'
             'python-cppyy-backend'
             'python-cppyy-cling'
             'openflow'
             # documentation sphinx
             'imagemagick' 'python-sphinx' 'texlive-binextra' 'texlive-fontutils'
             # documentation doxygen
             'doxygen'
             'dia'
             )
conflicts=('ns3')
provides=('ns3')
source=("git+https://gitlab.com/nsnam/ns-3-dev.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --abbrev=7 | sed 's/ns-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local cmake_options=(
    -B build
    -S ${_pkgname}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBEXECDIR=lib
    -D NS3_BINDINGS_INSTALL_DIR=${site_packages}
    -D NS3_ENABLE_BUILD_VERSION=ON
    -D NS3_EXAMPLES=ON
    -D NS3_LOG=ON
    -D NS3_PYTHON_BINDINGS=ON
    -D NS3_TESTS=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

