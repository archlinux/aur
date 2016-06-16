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
_shadow_build=false
_release=true
_skip_web_engine=false
_static_build=false
_build_from_head=false
_local_qt5_repo="/opt/dev/src/qtproject/qt5"

pkgrel=14
# 1 or 2 at present
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -f testing ]]; then
    _skip_web_engine=true
fi

_pkgvermajmin="5.7"
pkgver="${_pkgvermajmin}.0"

pkgname="qt-sdk-raspberry-pi${_piver}"

if $_static_build; then
  pkgname="${pkgname}-static"
fi

if $_build_from_head; then
  pkgver=6.6.6
fi

if $_release; then
  _build_type="-release"
else
  _build_type="-debug"
  pkgname="${pkgname}-debug"
fi

provides=("${pkgname}")
conflicts=("${pkgname}")
_packaginguser=$(whoami)
_libspkgname="${pkgname}-target-libs"
_mkspec="linux-rpi${_piver}-g++"
_release_type="development_releases"

# -{alpha/beta/rc}
_pkgver=${pkgver}

if [[ "${pkgver}" = "${_pkgver}" ]]; then
  _release_type="official_releases"
fi

_baseprefix=/opt
_installprefix=${_baseprefix}/${pkgname}
_qt_package_name_prefix="qt-everywhere-opensource-src"
_source_package_name=${_qt_package_name_prefix}-${_pkgver}

pkgdesc="Qt SDK for the Raspberry Pi 1/2"
arch=("x86_64")
url="http://www.qt.io"
license=("LGPL3" "GPL3")
depends=("qpi-toolchain" "qtcreator")
makedepends=("git" "pkgconfig" "gcc")
source=("git://github.com/sirspudd/mkspecs.git" "https://download.qt.io/${_release_type}/qt/${_pkgvermajmin}/${_pkgver}/single/${_source_package_name}.7z")

sha256sums=("SKIP" "04ca3b5cc26dfd7118052e33012e3ec5c27cecce202e00227f2c18b86523e650")

options=('!strip')
install=qpi.install
rm $install
touch $install
_device_configure_flags=""

#Sanity check
__pkgconfigpath="${_sysroot}/usr/lib/pkgconfig"

if [[ ! -d ${__pkgconfigpath} ]]; then
  echo "You have to set a valid sysroot to proceed with the build"
  exit 1
fi

#end sanity check

# callbacks
finish() {
    if [[ -n ${startdir} ]]; then
      cd ${startdir}
      rm $install
      touch $install
    fi
}
trap finish EXIT

if $_static_build || $_skip_web_engine || [[ ${_piver} = "1" ]] || [[ ${_piver} = "3" ]]; then
  _device_configure_flags="$_device_configure_flags -skip qtwebengine"
fi

if $_static_build; then
  _device_configure_flags="$_device_configure_flags -static"
fi

if $_build_from_head; then
  _device_configure_flags="$_device_configure_flags -skip qt3d -skip qtsystems -skip qttools -skip qtwebkit"
fi

build() {
  # Qt tries to do the right thing and stores these, breaking cross compilation
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS

  if [[ -z "$_piver" ]]; then
    echo "Set a pi version to build the associated sdk"
    exit -1
  fi

  local _srcdir="${srcdir}/${_source_package_name}"
  local _bindir="${_srcdir}"
  local _basedir="${_srcdir}/qtbase"
  local _waylanddir="${_srcdir}/qtwayland"
  local _webenginedir="${_srcdir}/qtwebengine"
  local _locationdir="${_srcdir}/qtlocation"
  local _mkspec_dir="${_basedir}/mkspecs/devices/${_mkspec}"

if $_build_from_head; then
  _srcdir="${_local_qt5_repo}"
fi

if $_shadow_build; then
  _bindir="${_srcdir}-build"
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

  if $_shadow_build; then
    rm -Rf ${_bindir}
  fi

  mkdir -p ${_bindir}
  cd ${_bindir}

  # Just because you can enable something doesnt mean you should
  # Prepare for breakage in all your Qt derived projects
  #-qtnamespace "Pi${_piver}" \
  ${_srcdir}/configure \
    -no-icu \
    -v \
    -qreal float \
    $_build_type \
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

  echo _piver="${_piver}" > ${_install_script_location}
  echo _qmakepath="${_installprefix}/bin/qmake" >> ${_install_script_location}
  echo _sysroot="${_sysroot}" >> ${_install_script_location}

  cat "${startdir}/_${install}" >> "${startdir}/${install}"
}

package() {
  local _srcdir="${srcdir}/${_source_package_name}"
  local _bindir="${_srcdir}"

if $_shadow_build; then
  _bindir="${_srcdir}-build"
fi

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
  local _profiledfn=qpi${_piver}.sh
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
    cp -L ${startdir}/${_profiledfn} ${_pkgprofiled} || exit 1
    sed -i "s,localpiprefix,${_installprefix}," ${_pkgprofiled}/${_profiledfn} || exit 1
  fi

  cp ${_bindir}/qtbase/config.status ${_libspkgdir}/${_installprefix}
  cp ${_bindir}/qtbase/config.summary ${_libspkgdir}/${_installprefix}

  cd ${_libsdir}
  runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1

  mv ${_libsdir}/${_libspkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz ${startdir}
}
