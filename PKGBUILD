# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au
# Contributor: Iven Hsu <ivenvd AT gmail>

pkgname=compiz-bzr
pkgver=4191
pkgrel=3
_bzrname=compiz
_bzrbranch=0.9.13
pkgdesc="Composite manager for Aiglx and Xgl, with plugins and CCSM (development version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/compiz"
license=('GPL' 'LGPL' 'MIT')
depends=('boost-libs' 'xorg-server' 'fuse2' 'glibmm' 'libwnck3' 'python-gobject' 'python-cairo' 'protobuf' 'metacity' 'glu')
makedepends=('boost' 'cmake' 'bzr' 'intltool' 'cython')
optdepends=(
  'xorg-xprop: grab various window properties for use in window matching rules'
)
conflicts=("${_bzrname}" 'compiz-core' 'compiz-gtk' 'compiz-bcop' 'ccsm' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'compiz-fusion-plugins-experimental' 'compizconfig-python' 'libcompizconfig' 'simple-ccsm')
provides=("${_bzrname}=${_bzrbranch}" "compiz-core=${_bzrbranch}" "compiz-bcop=${_bzrbranch}" "ccsm=${_bzrbranch}" "compiz-plugins-main=${_bzrbranch}" "compiz-plugins-extra=${_bzrbranch}" "compizconfig-python=${_bzrbranch}" "libcompizconfig=${_bzrbranch}")
source=("${_bzrname}::bzr+http://bazaar.launchpad.net/~compiz-team/${_bzrname}/${_bzrbranch}/"
        "focus-prevention-disable.patch"
        "gtk-extents.patch"
        "reverse-unity-config.patch"
        "screenshot-launch-fix.patch")
sha256sums=('SKIP'
            'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
            '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
            'fba56d3e5fc8d1b47be2b8eaa6d79f48635daccc26db9b0b88fa281cc50c635e'
            '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61')

pkgver() {
  cd "${_bzrname}"
  bzr revno
}

prepare() {
  cd "${_bzrname}"

  # Reverse Unity specific configuration patches
  patch -p1 -i "${srcdir}/reverse-unity-config.patch"

  # Fix decorator start command
  # This MUST be run AFTER reverse-unity-config.patch. Otherwise it has no effect at all
  sed -i 's/exec \\"${COMPIZ_BIN_PATH}compiz-decorator\\"/exec \/usr\/bin\/compiz-decorator/g' plugins/decor/decor.xml.in

  # Set focus prevention level to off which means that new windows will always get focus
  patch -p1 -i "${srcdir}/focus-prevention-disable.patch"

  # Fix incorrect extents for GTK+ tooltips, csd etc
  patch -p1 -i "${srcdir}/gtk-extents.patch"

  # Fix application launching for the screenshot plugin
  patch -p1 -i "${srcdir}/screenshot-launch-fix.patch"
}

build() {
  cd "${_bzrname}"

  mkdir build; cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=On \
    -DCOMPIZ_BUILD_WITH_RPATH=Off \
    -DCOMPIZ_PACKAGING_ENABLED=On \
    -DBUILD_GTK=On \
    -DBUILD_METACITY=On \
    -DBUILD_KDE4=Off \
    -DCOMPIZ_BUILD_TESTING=Off \
    -DCOMPIZ_WERROR=Off \
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,regex,animation,wall,ccp"

  make
}

package() {
  cd "${_bzrname}/build"
  make DESTDIR="${pkgdir}" install

  # findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  # make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' | awk -F\" '{print $2}')
  install -dm755 "${pkgdir}${CMAKE_DIR}/Modules/"
  install -m644 ../cmake/FindCompiz.cmake "${pkgdir}${CMAKE_DIR}/Modules/"	

  # Add documentation
  install -dm755 "${pkgdir}/usr/share/doc/compiz/"
  install ../{AUTHORS,NEWS,README} "${pkgdir}/usr/share/doc/compiz/"

  # Add gsettings schema files
  if ls generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/" 
    install -m644 generated/glib-2.0/schemas/*.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/" 
  fi 

  # Install licenses
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_bzrname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_bzrname}/COPYING.GPL" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_bzrname}/COPYING.LGPL" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_bzrname}/COPYING.MIT" "${pkgdir}/usr/share/licenses/${pkgname}"
}
