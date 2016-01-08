# Maintainer: Donald Carr <sirspudd@gmail.com>

# Documentation

# Set up the pi for Qt compilation. On Arch I just install chromium which pulls in all the deps
# Removed xcomposite as code path breaks

# Remove 2 (mesa) pkgconfig files we allow screw our mkspec
# rm /usr/lib/pkgconfig/glesv2.pc
# rm /usr/lib/pkgconfig/egl.pc

# You are gonna want to export the following vars in /etc/profile.d
# if you intend to primarily use Wayland

#export QT_QPA_PLATFORM=wayland
#export QT_WAYLAND_CLIENT_BUFFER_INTEGRATION=brcm

# Mount/copy this prepped rasp rootfs somewhere and set this path as the sysroot below
# I use NFS personally: sudo mount qpii.local:/ /mnt/pi

# comment this turkey out in any circumstance when you need to regenate .SRCINFO
echo "Set your sysroot prior to build" && exit 1
_sysroot=/mnt/pi

_packaginguser=$(whoami)
pkgname=qpii
_libspkgname="${pkgname}-libs"
_piver=2
_mkspec="linux-rpi${_piver}-g++"
pkgver=5.6.0
_pkgver=${pkgver}-beta
_baseprefix=/opt
_installprefix=${_baseprefix}/qt-${_pkgver}-rpi${_piver}
_pipkgname=qt-everywhere-opensource-src-${_pkgver}
pkgrel=4
pkgdesc="Cross compile Qt for the Raspberry Pi${_piver}"
arch=("x86_64")
url="http://www.qt.io"
license=("LGPL3")
makedepends=("git" "pkgconfig" "gcc" "qpi-toolchain")
source=("git://github.com/sirspudd/mkspecs.git" "https://download.qt.io/development_releases/qt/5.6/${_pkgver}/single/${_pipkgname}.tar.gz")
sha256sums=("SKIP" "d69103ec34b3775edfa47581b14ee9a20789d4b0d7d26220fb92f2cd32eb06f9")
options=('!strip')

build() {
  local _srcdir="${srcdir}/${_pipkgname}"
  local _bindir="${_srcdir}-build"

  # Qt tries to do the right thing and stores these, breaking cross compilation
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS

  # Get our mkspec
  cp -r "${srcdir}/mkspecs/${_mkspec}" ${_srcdir}/qtbase/mkspecs/devices

  mkdir -p ${_bindir}
  cd ${_bindir}

  # skipping due to build issues: qtquickcontrols2
  # skipping on principle: qtscript xcb
  # skipping because of the target in question: widgets qtwebchannel
  # TODO: qtwebengine, a little bulky but useful

  # Too bleeding big
  # -developer-build \
  # -separate-debug-info \

  ${_srcdir}/configure \
    -qreal float \
    -release \
    -silent \
    -confirm-license \
    -opensource \
    -hostprefix ${_installprefix} \
    -prefix ${_installprefix} \
    -opengl es2 \
    -egl \
    \
    -no-widgets \
    -make libs \
    -no-xcb \
    \
    -skip qtscript \
    -skip qtwebengine \
    -skip qtwebchannel \
    -skip qtwayland \
    -skip qtquickcontrols2 \
    \
    -sysroot ${_sysroot} \
    -device ${_mkspec} \
    -device-option CROSS_COMPILE=/opt/arm-sirspuddarch-linux-gnueabihf/bin/arm-sirspuddarch-linux-gnueabihf-

  make

  # regrettably required, as qtwayland barfs on shadow builds
  # as private header paths not included: no clue how to fix, bypassing

  cp -r ${_srcdir}/qtwayland .
  cd qtwayland
  ../qtbase/bin/qmake CONFIG+=wayland-compositor
  make
}

package() {
  local _srcdir="${srcdir}/${_pipkgname}"
  local _bindir="${_srcdir}-build"

  # cleanup
  rm -Rf ${pkgdir}
  mkdir -p ${pkgdir}

  # FIXME: installs both host/target bin/libs to pi path
  cd "${_bindir}"
  INSTALL_ROOT="$pkgdir" make install

  # regrettably required
  cd "${_bindir}"/qtwayland
  INSTALL_ROOT="$pkgdir" make install

  # Qt is now installed to $pkgdir/$sysroot/$prefix
  # manually generate/decompose host/target
  local _libsdir="${startdir}/${_libspkgname}"
  local _libspkgdir="${_libsdir}/topkg"
  local _libspkgbuild="${_libsdir}/PKGBUILD"
  local _pkgprofiled=${_libspkgdir}/etc/profile.d
  rm -Rf ${_libspkgdir}
  mkdir -p ${_libspkgdir}

  cp ${startdir}/${_libspkgname}-PKGBUILD ${_libspkgbuild}
  mv "${pkgdir}/${_sysroot}/${_baseprefix}" ${_libspkgdir}
  # set correct libs version
  sed -i "s/6.6.6/${pkgver}/" ${_libspkgbuild}

  mkdir -p ${_pkgprofiled}
  cp ${startdir}/qpi.sh ${_pkgprofiled}
  sed -i "s,localpiprefix,${_installprefix}," ${_pkgprofiled}/qpi.sh

  cd ${_libsdir}
  runuser -l ${_packaginguser} -c 'makepkg -f'

  echo "the libs package for the Raspberry Pi${_piver} is in the ${_packaginguser} home directory awaiting deployment"

  mv ${_libsdir}/${_libspkgname}-${pkgver}-1-any.pkg.tar.xz ${HOME}
}
