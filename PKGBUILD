# Contributer: Donald Carr <sirspudd@gmail.com>

# set -x

# Documentation

# Set up the pi for Qt compilation.
# For a comprehensive set of deps I just install chromium which pulls in everything

#* I had to removed xcomposite as code path breaks
#* Remove 2 (mesa) pkgconfig files we allow to screw our mkspec
# * rm /usr/lib/pkgconfig/glesv2.pc
# * rm /usr/lib/pkgconfig/egl.pc

# I use NFS to develop against my sysroot personally: sudo mount qpi2.local:/ /mnt/pi

# NB: Mandatory edit: set this variable to point to your raspberry pi's sysroot
_sysroot=/mnt/pi

# Options
_skip_web_engine=false
_static_build=false
_build_from_head=false
_local_qt5_repo="/opt/dev/src/qtproject/qt5"
_wayland_compositor=true

pkgver=5.6.0
pkgrel=11

# PKGBUILD
_piver=2
pkgname="qt-sdk-raspberry-pi${_piver}"

if $_static_build; then
  pkgname="${pkgname}-static"
fi

if $_build_from_head; then
  _pkgver=6.6.6
fi

provides=("${pkgname}")
conflicts=("${pkgname}")
_packaginguser=$(whoami)
_libspkgname="${pkgname}-target-libs"
_mkspec="linux-rpi${_piver}-g++"
_pkgver=${pkgver}-rc
_baseprefix=/opt
_installprefix=${_baseprefix}/${pkgname}
_source_package_name=qt-everywhere-opensource-src-${_pkgver}
pkgdesc="Qt SDK for the Raspberry Pi${_piver}"
arch=("x86_64")
url="http://www.qt.io"
license=("LGPL3" "GPL3")
depends=("qpi-toolchain" "qtcreator")
makedepends=("git" "pkgconfig" "gcc")
source=("git://github.com/sirspudd/mkspecs.git" "https://download.qt.io/development_releases/qt/5.6/${_pkgver}/single/${_source_package_name}.7z")
sha256sums=("SKIP" "82ed4bc1bf7735747e1612f322f8723dfd84f05fa4dca9398863e6527a0c1971")
options=('!strip')
install=qpi.install
_fully_qualified_install_script="${startdir}/${install}"
_device_configure_flags=""

#Sanity check
__pkgconfigpath="${_sysroot}/usr/lib/pkgconfig"
__eglpkgconfigpath="${__pkgconfigpath}/egl.pc"
__glespkgconfigpath="${__pkgconfigpath}/glesv2.pc"

if [[ ! -d ${__pkgconfigpath} ]]; then
  echo "You have to set a valid sysroot to proceed with the build"
  exit 1
fi

if [[ -f ${__eglpkgconfigpath} ]] || [[ -f ${__glespkgconfigpath} ]] ; then
  echo "Mesa is about to eat our communal poodle; delete egl.pc and glesv2.pc in your sysroot"
  exit 1
fi

#end sanity check

if $_static_build || $_skip_web_engine || [[ ${_piver} = "1" ]]; then
  _device_configure_flags="$_device_configure_flags -skip qtwebengine -no-icu"
fi

if $_static_build; then
  _device_configure_flags="$_device_configure_flags -static"
fi

if $_build_from_head; then
  _device_configure_flags="$_device_configure_flags -skip qt3d -skip qtsystems -skip qttools -skip qtwebkit"
fi

if $_wayland_compositor; then
  _device_configure_flags="$_device_configure_flags -skip qtwayland"
fi

build() {
  local _srcdir="${srcdir}/${_source_package_name}"
  local _basedir="${_srcdir}/qtbase"
  local _bindir="${_srcdir}-build"
  local _mkspec_dir="${_basedir}/mkspecs/devices/${_mkspec}"

  # Qt tries to do the right thing and stores these, breaking cross compilation
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS

if $_build_from_head; then
  _srcdir="${_local_qt5_repo}"
fi

  cd ${_srcdir}

  # Get our mkspec
  rm -Rf $_mkspec_dir
  cp -r "${srcdir}/mkspecs/${_mkspec}" $_mkspec_dir

  # skipping on principle: qtscript xcb
  # skipping because of the target in question: widgets

  # Too bleeding big
  # -developer-build \
  # -separate-debug-info \

  # Chromium requires python2 to be the system python on your build host
  # I literally symlink /usr/bin/python to /usr/bin/python2 on arch

  # build qtwebengine with our mkspec
  local _webenginefileoverride="${_srcdir}/qtwebengine/tools/qmake/mkspecs/features/functions.prf"
  sed -i "s/linux-clang/linux*/" ${_webenginefileoverride} || exit 1

  # hard coded off, so we have to hard code it on
  local _reducerelocations="${_basedir}/config.tests/unix/bsymbolic_functions.test"
  sed -i "s/error/warning/" ${_reducerelocations} || exit 1

  # Work around our embarresing propensity to stomp on your own tailored build configuration
  sed -i "s/O[23]/Os/"  ${_basedir}/mkspecs/common/gcc-base.conf || exit 1

  # incorporate journald fix
  local _patch_dir=${startdir}
  cd ${_basedir}
  patch -p1 < ${_patch_dir}/0001-Search-for-libsystemd-first-fall-back-to-libsystemd-.patch
  patch -p1 < ${_patch_dir}/0001-journald-test-will-fail-with-certain-toolchains.patch

  # end patch

  mkdir -p ${_bindir}
  cd ${_bindir}

  # Breaks in qtwayland
  # -qtnamespace Pi \

  ${_srcdir}/configure \
    -v \
    -qreal float \
    -release \
    -silent \
    -confirm-license \
    -opensource \
    -qtlibinfix "Pi${_piver}" \
    -reduce-exports \
    -reduce-relocations \
    -pch \
    -ltcg \
    -no-compile-examples \
    -hostprefix ${_installprefix} \
    -prefix ${_installprefix} \
    -opengl es2 \
    -egl \
    -journald \
    \
    -no-widgets \
    -make libs \
    -no-xcb \
    \
    -skip qtscript \
    -skip qtenginio \
    \
    -sysroot ${_sysroot} \
    -device ${_mkspec} \
    -device-option CROSS_COMPILE=/opt/arm-sirspuddarch-linux-gnueabihf/bin/arm-sirspuddarch-linux-gnueabihf- \
    ${_device_configure_flags} || exit 1

  make || exit 1

if $_wayland_compositor; then
  # regrettably required, as qtwayland barfs on shadow builds
  # as private header paths not included: no clue how to fix, bypassing

  cp -r "${_srcdir}/qtwayland" "${_bindir}" || exit 1
  cd "${_bindir}/qtwayland"
  ${_bindir}/qtbase/bin/qmake CONFIG+=wayland-compositor || exit 1
  make || exit 1
fi
}

create_install_script()
{
  local _install_script_location="${startdir}/${install}"

  sed -i "s/libspiver/${_piver}/" ${_install_script_location} || exit 1
  sed -i "s,libsqmakepath,${_installprefix}/bin/qmake," ${_install_script_location} || exit 1
  sed -i "s,libssysroot,${_sysroot}," ${_install_script_location} || exit 1
}

package() {
  local _srcdir="${srcdir}/${_source_package_name}"
  local _bindir="${_srcdir}-build"

  create_install_script

  # cleanup
  rm -Rf ${pkgdir}
  mkdir -p ${pkgdir}

  cd "${_bindir}"
  INSTALL_ROOT="$pkgdir" make install || exit 1

if $_wayland_compositor; then
  # regrettably required
  cd "${_bindir}/qtwayland"
  INSTALL_ROOT="$pkgdir" make install || exit 1
fi

  # Qt is now installed to $pkgdir/$sysroot/$prefix
  # manually generate/decompose host/target
  local _libsdir="${startdir}/${_libspkgname}"
  local _libspkgdir="${_libsdir}/topkg"
  local _libspkgbuild="${_libsdir}/PKGBUILD"
  local _pkgprofiled=${_libspkgdir}/etc/profile.d
  rm -Rf ${_libspkgdir}
  mkdir -p ${_libspkgdir}

  cp ${startdir}/PKGBUILD.libs ${_libspkgbuild}
  mv "${pkgdir}/${_sysroot}/${_baseprefix}" ${_libspkgdir}
  # set correct libs version
  sed -i "s/libspkgrel/${pkgrel}/" ${_libspkgbuild} || exit 1
  sed -i "s/libspkgver/${pkgver}/" ${_libspkgbuild} || exit 1
  sed -i "s/libspkgname/${_libspkgname}/" ${_libspkgbuild} || exit 1
  sed -i "s/libspiver/${_piver}/" ${_libspkgbuild} || exit 1

  if ! ${_static_build}; then
    mkdir -p ${_pkgprofiled}
    cp ${startdir}/qpi.sh ${_pkgprofiled} || exit 1
    sed -i "s,localpiprefix,${_installprefix}," ${_pkgprofiled}/qpi.sh || exit 1
  fi

  cd ${_libsdir}
  runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1

  mv ${_libsdir}/${_libspkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz ${startdir}
}
