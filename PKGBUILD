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

# PKGBUILD

pkgrel=5
_piver=2

_pkgvermajmin="5.7"
pkgver="${_pkgvermajmin}.0"

pkgname="qt-sdk-raspberry-pi${_piver}"

if $_static_build; then
  pkgname="${pkgname}-static"
fi

if $_build_from_head; then
  pkgver=6.6.6
fi

provides=("${pkgname}")
conflicts=("${pkgname}")
_packaginguser=$(whoami)
_libspkgname="${pkgname}-target-libs"
_mkspec="linux-rpi${_piver}-g++"

_pkgver=${pkgver}-alpha

_baseprefix=/opt
_installprefix=${_baseprefix}/${pkgname}
_qt_package_name_prefix="qt-everywhere-opensource-src"
_source_package_name=${_qt_package_name_prefix}-${_pkgver}

# Work around packaging bug (lack of postfix in 5.7.0-alpha)
#_source_unpackaged_name=${_source_package_name}
_source_unpackaged_name=${_qt_package_name_prefix}-${pkgver}

pkgdesc="Qt SDK for the Raspberry Pi${_piver}"
arch=("x86_64")
url="http://www.qt.io"
license=("LGPL3" "GPL3")
depends=("qpi-toolchain" "qtcreator")
makedepends=("git" "pkgconfig" "gcc")
source=("git://github.com/sirspudd/mkspecs.git" "https://download.qt.io/development_releases/qt/${_pkgvermajmin}/${_pkgver}/single/${_source_package_name}.7z")

sha256sums=("SKIP" "5d8d12bc72f12532323737894beadd0d0021ee1b4321e53798e722b0352bbc24")

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

# callbacks
finish() {
    cd ${startdir}
    git checkout qpi.install
}
trap finish EXIT

if $_static_build || $_skip_web_engine || [[ ${_piver} = "1" ]] || [[ ${_piver} = "3" ]]; then
  _device_configure_flags="$_device_configure_flags -skip qtwebengine -no-icu"
fi

if $_static_build; then
  _device_configure_flags="$_device_configure_flags -static"
fi

if $_build_from_head; then
  _device_configure_flags="$_device_configure_flags -skip qt3d -skip qtsystems -skip qttools -skip qtwebkit"
fi

build() {
  local _srcdir="${srcdir}/${_source_unpackaged_name}"
  local _basedir="${_srcdir}/qtbase"
  local _waylanddir="${_srcdir}/qtwayland"
  local _webenginedir="${_srcdir}/qtwebengine"
  local _locationdir="${_srcdir}/qtlocation"
  local _bindir="${_srcdir}"
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
  patch -p1 < ${_patch_dir}/0001-Make-CFLAGS-CXXFLAGS-behave-consistently-in-config.t.patch
  patch -p1 < ${_patch_dir}/0002-Adjust-egl-config.test-to-pass-sysrooted-libs.patch
  cd ${_waylanddir}
  patch -p1 < ${_patch_dir}/0001-Adjust-Raspberry-Pi-integration-to-new-API.patch
  cd ${_webenginedir}
  patch -p1 < ${_patch_dir}/0001-Include-neon-support-for-any-fpu-.-neon.patch
  patch -p1 < ${_patch_dir}/0001-Always-define-arm_thumb.patch
  cd ${_locationdir}
  patch -p1 < ${_patch_dir}/0001-Fix-qreal-double-mingling.patch

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
}

create_install_script()
{
  local _install_script_location="${startdir}/${install}"

  sed -i "s/libspiver/${_piver}/" ${_install_script_location} || exit 1
  sed -i "s,libsqmakepath,${_installprefix}/bin/qmake," ${_install_script_location} || exit 1
  sed -i "s,libssysroot,${_sysroot}," ${_install_script_location} || exit 1
}

package() {
  local _srcdir="${srcdir}/${_source_unpackaged_name}"
  local _bindir="${_srcdir}"

  create_install_script

  # cleanup
  rm -Rf ${pkgdir}
  mkdir -p ${pkgdir}

  cd "${_bindir}"
  INSTALL_ROOT="$pkgdir" make install || exit 1

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
