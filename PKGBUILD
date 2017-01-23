# Maintainer: Donald Carr <sirspudd at gmail dot com>

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

# Arch: build dependencies for the target device documented in PKGBUILD.libs
# Fedora: systemd-devel mesa-*-devel wayland*-devel fontconfig-devel libinput-devel freetype-devel qt5-qtdeclarative-devel

# Sanity check
_building=true

# Options
_target_host=false
_sysroot=""
_piver=""
_use_mesa=false
_float=false
_shadow_build=false
_debug=true
_skip_web_engine=false
_static_build=false
_build_from_head=false
_patching=true

if [[ -z ${startdir} ]]; then
  _building=false;
fi

# Sanity check options
if $_target_host; then
  _piver=""
elif $_building; then
  if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then _piver=$LOCAL_PI_VER; fi
  _sysroot=/mnt/pi${_piver}
  if [[ -z "${_piver}" ]]; then
    echo "You have to set a pi version (_piver) to build"
    exit 1
  fi

  if [[ ! -d "${_sysroot}/etc" ]]; then
    echo "You have to set a valid sysroot to proceed with the build"
    exit 1
  fi
fi

# vars
_local_qt5_repo="/opt/dev/src/qtproject/qt5"
_pkgvermajmin="5.8"
_pkgverpatch=".0"
# -{alpha/beta/rc}
_dev_suffix=""
pkgrel=7
pkgver="${_pkgvermajmin}${_pkgverpatch}"
$_build_from_head && pkgver=6.6.6
_pkgver=${pkgver}${_dev_suffix}
_release_type="development_releases"
_mkspec="linux-rpi${_piver}-g++"
_additional_configure_flags=""
_profiled_gpu_fn=qpi-proprietary.sh

__eglpkgconfigpath="${__pkgconfigpath}/egl.pc"
__glespkgconfigpath="${__pkgconfigpath}/glesv2.pc"

case ${_piver} in
1)
  _toolchain_name=armv6-rpi-linux-gnueabihf
  _skip_web_engine=true
;;
2)
  _toolchain_name=armv7-rpi2-linux-gnueabihf
;;
3)
  _toolchain_name=aarch64-rpi3-linux-gnueabi
  _use_mesa=true
  _float=false
;;
esac

if $_target_host; then
  _use_mesa=true
else
  depends=("qpi${_piver}-toolchain")
  install=qpi.install

  rm $install
  touch $install
fi

if [[ -f testing ]]; then
  _skip_web_engine=true;
  _debug=false;
fi

if [[ -z "${_dev_suffix}" ]]; then _release_type="official_releases"; fi

$_build_from_head && _patching=false && _shadow_build=true
$_skip_web_engine && _additional_configure_flags="$_additional_configure_flags -skip qtwebengine"
$_static_build && _additional_configure_flags="$_additional_configure_flags -static"
$_float && _additional_configure_flags="$_additional_configure_flags -qreal float"

# PKGBUILD vars

pkgname="qt-sdk"

if [[ -n ${_piver} ]] || ! $_building; then
  pkgname="${pkgname}-raspberry-pi${_piver}"
fi
$_static_build && pkgname="${pkgname}-static"

if $_debug; then
  _additional_configure_flags="-force-debug-info -separate-debug-info"
fi

_libspkgname="${pkgname}-target-libs"
_libsdebugpkgname="${pkgname}-target-libs-debug"
_packaginguser=$(whoami)
_baseprefix=/opt
_installprefix=${_baseprefix}/${pkgname}
_qt_package_name_prefix="qt-everywhere-opensource-src"
_source_package_name=${_qt_package_name_prefix}-${_pkgver}

pkgdesc="Qt SDK for the Raspberry Pi 1/2/3"
arch=("x86_64")
url="http://www.qt.io"
license=("LGPL3" "GPL3")
optdepends=('qtcreator: Integrated Raspberry Pi IDE development')
makedepends=("git" "pkgconfig" "gcc")
#_provider=http://qt.mirror.constant.com/
_provider=https://download.qt.io

# shouldn't be needed
_core_configure_options="\
                 -prefix ${_installprefix} \
                 -optimized-tools \
                 -confirm-license \
                 -opensource \
                 -v \
                 -silent \
                 -c++std 14 \
                 -release \
                 -fontconfig \
                 -system-freetype \
                 -pch \
                 -opengl es2 \
                 -egl \
                 -journald \
                 -make libs \
                 -no-icu \
                 -no-compile-examples \
                 \
                 -reduce-relocations \
                 -reduce-exports \
                 -ltcg \
                 \
                 -skip qtscript"

if ! $_build_from_head; then
  source=("git://github.com/sirspudd/mkspecs.git" "${_provider}/${_release_type}/qt/${_pkgvermajmin}/${_pkgver}/single/${_source_package_name}.7z")
  sha256sums=("SKIP" "0efc79805cfeacc1bd2d10d8d6033e95b6c42cb5d68b1d5a1069b141006a2358")
fi

options=('!strip')

if ${_use_mesa}; then
  _profiled_gpu_fn=qpi-mesa.sh
  _additional_configure_flags="$_additional_configure_flags -gbm -kms"
else
  if [[ -f ${__eglpkgconfigpath} ]] || [[ -f ${__glespkgconfigpath} ]] ; then
    echo "Mesa is about to eat our communal poodle; delete egl.pc and glesv2.pc in your sysroot"
    exit 1
  fi
fi

# callbacks
finish() {
    if [[ -n ${startdir} ]]; then
      cd ${startdir}
      rm $install
      touch $install
    fi
}

if ! $_target_host; then
  trap finish EXIT
fi

build() {
  # Qt tries to do the right thing and stores these, breaking cross compilation
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS

  local _srcdir="${srcdir}/${_source_package_name}"
  local _bindir="${_srcdir}"
  local _basedir="${_srcdir}/qtbase"
  local _waylanddir="${_srcdir}/qtwayland"
  local _declarativedir="${_srcdir}/qtdeclarative"
  local _webenginedir="${_srcdir}/qtwebengine"
  local _mkspec_dir="${_basedir}/mkspecs/devices/${_mkspec}"

  if $_shadow_build; then
    _bindir="${_srcdir}-build"
    rm -Rf ${_bindir}
    mkdir -p ${_bindir}
  fi

  if $_build_from_head; then
     if [[ -z $_local_qt5_repo ]]; then echo "Need to set a repo dir to build from head"; exit 1; fi
    _srcdir=$_local_qt5_repo
  fi

  cd ${_srcdir}

if ! $_target_host; then
  # Get our mkspec
  rm -Rf $_mkspec_dir
  cp -r "${srcdir}/mkspecs/${_mkspec}" $_mkspec_dir
fi

if $_patching; then
  # build qtwebengine with our mkspec
  local _webenginefileoverride="${_srcdir}/qtwebengine/tools/qmake/mkspecs/features/functions.prf"
  sed -i "s/linux-clang/linux*/" ${_webenginefileoverride} || exit 1

  # hard coded off, so we have to hard code it on
  local _reducerelocations="${_basedir}/config.tests/unix/reduce_relocs/bsymbolic_functions.c"
  sed -i "s/error/warning/" ${_reducerelocations} || exit 1

  cd ${_basedir}
  patch -p1 < ${startdir}/0001-Check-lib64-as-well-as-lib.patch

  # Work around our embarresing propensity to stomp on your own tailored build configuration
  sed -i "s/O[23]/Os/"  ${_basedir}/mkspecs/common/gcc-base.conf || exit 1
fi

  cd ${_bindir}

  # skipping on principle: qtscript xcb

  # Too bleeding big
  # -developer-build \
  # -separate-debug-info \

  # Chromium requires python2 to be the system python on your build host
  # I literally symlink /usr/bin/python to /usr/bin/python2 on arch

  # Just because you can enable something doesnt mean you should
  # Prepare for breakage in all your Qt derived projects
  #-qtnamespace "Pi${_piver}" \

if $_target_host; then
  local _configure_line="${_srcdir}/configure \
                 ${_core_configure_options} \
                 ${_additional_configure_flags}"
else
  local _configure_line="${_srcdir}/configure \
                 ${_core_configure_options} \
                 -hostprefix ${_installprefix} \
                 -qtlibinfix "Pi${_piver}" \
                 -sysroot ${_sysroot} \
                 -device ${_mkspec} \
                 -device-option CROSS_COMPILE=/opt/${_toolchain_name}/bin/${_toolchain_name}- \
                 -no-xcb \
                 ${_additional_configure_flags}"
fi
  echo ${_configure_line} > configure_line
  ${_configure_line} || exit 1
  make || exit 1
}

create_install_script() {
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

if ! $_target_host; then
  create_install_script
fi

  # cleanup
  rm -Rf ${pkgdir}
  mkdir -p ${pkgdir}

  cd "${_bindir}"
  INSTALL_ROOT="$pkgdir" make install || exit 1

  # Qt is now installed to $pkgdir/$sysroot/$prefix
  # manually generate/decompose host/target

  local _libsdir="${startdir}/${_libspkgname}"
  local _libsdebugdir="${startdir}/${_libsdebugpkgname}"

  local _libspkgdir="${_libsdir}/topkg"
  local _libsdebugpkgdir="${_libsdebugdir}/topkg"

  local _libspkgbuild="${_libsdir}/PKGBUILD"
  local _libsdebugpkgbuild="${_libsdebugdir}/PKGBUILD"

  local _pkgprofiled=${_libspkgdir}/etc/profile.d
  local _profiledfn=qpi.sh

  local _installed_dir="${pkgdir}/${_sysroot}/${_baseprefix}"
if $_target_host; then
  _installed_dir="${pkgdir}/${_baseprefix}"
fi

  rm -Rf ${_libspkgdir} ${_libsdebugpkgdir}
  mkdir -p ${_libspkgdir} ${_libsdebugpkgdir}

  cp ${startdir}/PKGBUILD.libs ${_libspkgbuild}
  cp ${startdir}/PKGBUILD.libs.debug ${_libsdebugpkgbuild}

  cd $(dirname ${_installed_dir})
  find $(basename ${_installed_dir}) -name '*.debug' -exec cp --parents '{}' ${_libsdebugpkgdir} \; -exec rm '{}' \;

  mv ${_installed_dir} ${_libspkgdir}

  # set correct libs version
  sed -i "s/libspkgrel/${pkgrel}/" ${_libspkgbuild} || exit 1
  sed -i "s/libspkgver/${pkgver}/" ${_libspkgbuild} || exit 1
  sed -i "s/libspkgname/${_libspkgname}/" ${_libspkgbuild} || exit 1
  sed -i "s/libspiver/${_piver}/" ${_libspkgbuild} || exit 1

  # debug
  sed -i "s/libspkgrel/${pkgrel}/" ${_libsdebugpkgbuild} || exit 1
  sed -i "s/libspkgver/${pkgver}/" ${_libsdebugpkgbuild} || exit 1
  sed -i "s/libspkgname/${_libspkgname}/" ${_libsdebugpkgbuild} || exit 1
  sed -i "s/libsdebugpkgname/${_libsdebugpkgname}/" ${_libsdebugpkgbuild} || exit 1
  sed -i "s/libspiver/${_piver}/" ${_libsdebugpkgbuild} || exit 1

  if ! ${_target_host} && ! ${_static_build}; then
    mkdir -p ${_pkgprofiled}
    cp -L ${startdir}/${_profiledfn} ${_pkgprofiled} || exit 1
    cp -L ${startdir}/${_profiled_gpu_fn} ${_pkgprofiled} || exit 1
    sed -i "s,localpiprefix,${_installprefix}," ${_pkgprofiled}/${_profiledfn} || exit 1
  fi

  #cp ${_bindir}/qtbase/config.status ${_libspkgdir}/${_installprefix}

  local _summary_file="${_bindir}/qtbase/config.summary"
  if [[ -f ${_summary_file} ]]; then
    cp ${_summary_file} ${_libspkgdir}/${_installprefix}
  fi

  cd ${_libsdir}
  runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1
  mv ${_libsdir}/${_libspkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz ${startdir}

  cd ${_libsdebugdir}
  runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1
  mv ${_libsdebugdir}/${_libsdebugpkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz ${startdir}
}
