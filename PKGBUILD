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

pkgname="qt-sdk"

# Sanity check
_building=true

# Options
_target_host=false
_sysroot=""
_piver=""
_use_mesa=false
_float=false
_shadow_build=true
# automatically disabled if you are building webengine
_debug=true
_skip_qtscript=true
_skip_qtwebengine=false
_skip_qtwidgets=false
_static_build=false
_build_from_head=false
_patching=true
_minimal=true
_uberminimal=false

if [[ -z ${startdir} ]]; then
  _building=false;
fi

if [[ -f target-host ]]; then
  unset LOCAL_PI_VER
  _target_host=true
fi

if [[ -f full-build ]]; then
  _minimal=false
fi

# Sanity check options
if $_building && ! $_target_host; then
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
_pkgvermajmin="5.9"
_pkgverpatch=".1"
# {alpha/beta/beta2/rc}
_dev_suffix=""
pkgrel=1
pkgver="${_pkgvermajmin}${_pkgverpatch}"
$_build_from_head && pkgver=6.6.6
_pkgver=${pkgver}
if [[ -n ${_dev_suffix} ]]; then
  _pkgver=${pkgver}-${_dev_suffix}
fi
_release_type="development_releases"
_mkspec="linux-rpi${_piver}-g++"
_additional_configure_flags=""
_profiled_gpu_fn=qpi-proprietary.sh

__pkgconfigpath=${_sysroot}/usr/lib/pkgconfig
__eglpkgconfigpath="${__pkgconfigpath}/egl.pc"
__glespkgconfigpath="${__pkgconfigpath}/glesv2.pc"

case ${_piver} in
1)
  _toolchain_name=armv6-rpi-linux-gnueabihf
  # too problematic for me to care about
  #_float=true
;;
2)
  _toolchain_name=armv7-rpi2-linux-gnueabihf
;;
3)
  _toolchain_name=aarch64-rpi3-linux-gnueabi
  _use_mesa=true
;;
esac

if $_building && $_uberminimal; then
  _skip_qtwidgets=true;
fi

if $_building && $_minimal; then
  _skip_qtscript=true;
  _skip_qtwebengine=true;
fi

if $_target_host; then
  _use_mesa=true
else
  depends=("qpi${_piver}-toolchain")
fi

if [[ -z "${_dev_suffix}" ]]; then _release_type="official_releases"; fi

$_build_from_head && _patching=false && _shadow_build=true
$_skip_qtwebengine && _additional_configure_flags="$_additional_configure_flags -skip qtwebengine -no-icu"
$_skip_qtscript && _additional_configure_flags="$_additional_configure_flags -skip qtscript"
$_skip_qtwidgets && _additional_configure_flags="$_additional_configure_flags -no-widgets"
$_static_build && _additional_configure_flags="$_additional_configure_flags -static"
$_float && _additional_configure_flags="$_additional_configure_flags -qreal float"

# PKGBUILD vars

install=qpi.install

rm $install
touch $install

if [[ -n ${_piver} ]] || ! $_building; then
  pkgname="${pkgname}-raspberry-pi${_piver}"
fi
$_static_build && pkgname="${pkgname}-static"

if $_debug; then
  _additional_configure_flags="$_additional_configure_flags -force-debug-info -separate-debug-info"
fi

_libspkgname="${pkgname}-target-libs"
_libsdebugpkgname="${pkgname}-target-libs-debug"
_packaginguser=$(whoami)
_qt_package_name_prefix="qt-everywhere-opensource-src"
_source_package_name=${_qt_package_name_prefix}-${_pkgver}
_baseprefix=/opt
_installprefix=${_baseprefix}/${pkgname}

pkgdesc="Qt SDK for the Raspberry Pi 1/2/3"
arch=("x86_64")
url="http://chaos-reins.com/qpi/"
license=("LGPL3" "GPL3")
optdepends=('qtcreator: Integrated Raspberry Pi IDE development')
makedepends=("git" "pkgconfig" "gcc" "gperf" "python")
#_provider=http://qt.mirror.constant.com/
_provider=https://download.qt.io
_tmpfs_dir=/vortex

_arch_specific_configure_options="\
    -prefix /usr \
    -docdir /usr/share/doc/qt \
    -headerdir /usr/include/qt \
    -archdatadir /usr/lib/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt/examples \
    -no-rpath"

# Seems to be creating a large amount of breakage
_core_configure_options="\
                 -prefix ${_installprefix} \
                 -optimized-tools \
                 -optimized-qmake \
                 -optimize-size \
                 -confirm-license \
                 -opensource \
                 -v \
                 -silent \
                 -release \
                 -fontconfig \
                 -system-sqlite \
                 -system-freetype \
                 -system-harfbuzz \
                 -pch \
                 -opengl es2 \
                 -egl \
                 -journald \
                 -make libs \
                 -ltcg \
                 \
                 -reduce-relocations \
                 -reduce-exports"

if ! $_build_from_head; then
  source=("git://github.com/sirspudd/mkspecs.git" "${_provider}/${_release_type}/qt/${_pkgvermajmin}/${_pkgver}/single/${_source_package_name}.tar.xz")
  sha256sums=("SKIP" "7b41a37d4fe5e120cdb7114862c0153f86c07abbec8db71500443d2ce0c89795")
fi

options=('!strip')

if ${_use_mesa}; then
  _profiled_gpu_fn=qpi-mesa.sh
  _additional_configure_flags="$_additional_configure_flags -gbm -kms"
else
  if $_building && ([[ -f ${__eglpkgconfigpath} ]] || [[ -f ${__glespkgconfigpath} ]]); then
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

adjust_bin_dir() {
  if [[ -n ${_srcdir} ]]; then
    _bindir="${_srcdir}"
  else
    # Probably repackaging: gonna have to make some assumptions
    _bindir="${startdir}/src/${_source_package_name}"
  fi
  if $_shadow_build; then
    _bindir="${_bindir}-build"
    if $_minimal && [[ -d $_tmpfs_dir ]]; then
      _bindir="${_tmpfs_dir}/${_bindir}"
    fi
  fi
}

adjust_src_dir() {
  if $_build_from_head; then
     if [[ -z $_local_qt5_repo ]]; then echo "Need to set a repo dir to build from head"; exit 1; fi
    _srcdir=$_local_qt5_repo
  fi
}

build() {
  # Qt tries to do the right thing and stores these, breaking cross compilation
  # unset everything set in /etc/makepkg.conf
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS
  unset CHOST
  unset CPPFLAGS
  unset CARCH
  unset HOSTTYPE
  unset MACHTYPE
  unset DEBUG_CFLAGS
  unset DEBUG_CXXFLAGS

  export PATH=${startdir}:${PATH}

  _srcdir="${srcdir}/${_source_package_name}"
  adjust_src_dir
  adjust_bin_dir

  local _basedir="${_srcdir}/qtbase"
  local _waylanddir="${_srcdir}/qtwayland"
  local _declarativedir="${_srcdir}/qtdeclarative"
  local _mkspec_dir="${_basedir}/mkspecs/devices/${_mkspec}"

  cd ${_srcdir}

  echo "INCLUDEPATH += ${_sysroot}/usr/include/openssl-1.0" >> ${_basedir}/src/network/network.pro

if ! $_target_host; then
  # Get our mkspec
  rm -Rf $_mkspec_dir
  cp -r "${srcdir}/mkspecs/${_mkspec}" $_mkspec_dir
fi

if $_patching; then
  # build qtwebengine with our mkspec

  # hard coded off, so we have to hard code it on
  local _reducerelocations="${_basedir}/config.tests/unix/reduce_relocs/bsymbolic_functions.c"
  sed -i "s/error/warning/" ${_reducerelocations} || exit 1

  cd ${_basedir}
  #patch -p1 < ${startdir}/0001-Check-lib64-as-well-as-lib.patch

  cd ${_declarativedir}
  #patch -p1 < ${startdir}/0001-Fix-crash-in-QQuickPixmapReader-friends.patch
  #patch -p1 < ${startdir}/0001-Fix-build-with-qreal-as-float.patch

  cd ${_waylanddir}
  #patch -p1 < ${startdir}/0001-Fix-brcm-egl-build-by-correcting-commit-usage.patch
  patch -p1 < ${startdir}/0001-Avoid-double-deletion-of-mBuffer.patch

  #cd ${_webenginedir}
  # reverse patch which breaks dynamic loading of EGL/GLESvs with rpi proprietary drivers
  #patch -p1 < ${startdir}/0001-Revert-Fully-qualify-libEGL.so.1-libEGLESv2.so.2-lib.patch
fi

  rm -Rf ${_bindir}
  mkdir -p ${_bindir}
  cd ${_bindir}

  # Too bleeding big
  # -developer-build \
  # -separate-debug-info \

  # Chromium requires python2 to be the system python on your build host
  # I literally symlink /usr/bin/python to /usr/bin/python2 on arch

  # Just because you can enable something doesnt mean you should
  # Prepare for breakage in all your Qt derived projects
  #-qtnamespace "Pi${_piver}" \

# -platform linux-clang \
if $_target_host; then
  local _configure_line="${_srcdir}/configure \
                 -make tools \
                 ${_core_configure_options} \
                 ${_additional_configure_flags}"
# ${_arch_specific_configure_options} \
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
  local _configure_line_fn=configure_line
  echo ${_configure_line} > ${_configure_line_fn}
  set &> configure_env
  ${_configure_line} || ${_configure_line} || exit 1
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
  adjust_bin_dir

  create_install_script

  # cleanup
  rm -Rf ${pkgdir}
  mkdir -p ${pkgdir}

  cd "${_bindir}"
  INSTALL_ROOT="$pkgdir" make install || exit 1

  # Qt is now installed to $pkgdir/$sysroot/$prefix
  # manually generate/decompose host/target

  local _basepkgdir=${pkgdir}/${_installprefix}

  local _libsdir="${startdir}/${_libspkgname}"
  local _libsdebugdir="${startdir}/${_libsdebugpkgname}"

  local _libspkgdir="${_libsdir}/topkg"
  local _libsdebugpkgdir="${_libsdebugdir}/topkg"

  local _libspkgbuild="${_libsdir}/PKGBUILD"
  local _libsdebugpkgbuild="${_libsdebugdir}/PKGBUILD"

  local _pkgprofiled=${_libspkgdir}/etc/profile.d
  local _profiledfn=qpi.sh

  local _installed_dir="${pkgdir}/${_sysroot}/${_baseprefix}"

  cp ${_bindir}/configure_line ${_basepkgdir}
  cp ${_bindir}/config.summary ${_basepkgdir}
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

if $_debug; then
  cd ${_libsdebugdir}
  runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1
  mv ${_libsdebugdir}/${_libsdebugpkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz ${startdir}
fi
}
