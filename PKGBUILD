# Maintainer: Donald Carr <d at chaos-reins dot com>

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
_skip_qtscript=false
_skip_qtwebengine=false
_skip_qtwidgets=false
_static_build=false
_build_from_local_src_tree=false
_patching=true
_minimal=false
_uber_minimal=false

if [[ -z ${startdir} ]]; then
  _building=false;
fi

if [[ -f build-from-local-src-tree  ]]; then
  _build_from_local_src_tree=true
fi

if [[ -f target-host ]]; then
  unset LOCAL_PI_VER
  _target_host=true
fi

if [[ -f no-debug ]]; then
  _debug=false
fi

if [[ -f static ]]; then
  _static_build=true
  _uber_minimal=true
  _debug=false
  #_float=true
fi

if [[ -f full-build ]]; then
  _minimal=false
fi

if [[ -f uber-minimal ]]; then
  _uber_minimal=true
fi

# Only present for the sake of sanity testing the qpi.install script
#_piver=$LOCAL_PI_VER
#_sysroot=/mnt/pi${_piver}

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
_local_qt5_repo="${local_qt5_repo}"
_pkgvermajmin="5.14"
_pkgverpatch=".0"
# {alpha/beta/beta2/rc}
_dev_suffix="beta1"
pkgrel=0
pkgver="${_pkgvermajmin}${_pkgverpatch}"
$_build_from_local_src_tree && pkgver=6.6.6
_pkgver=${pkgver}
_release_type="development_releases"
_profiled_gpu_fn=qpi-proprietary.sh

__pkgconfigpath=${_sysroot}/usr/lib/pkgconfig
__eglpkgconfigpath="${__pkgconfigpath}/egl.pc"
__glespkgconfigpath="${__pkgconfigpath}/glesv2.pc"

#_opengl_variant="desktop"
if [ -n "${_piver}" ]; then
  _opengl_variant="es2"
fi

_overwrite_mkspec=true
_mkspec="linux-rpi${_piver}-g++"
case ${_piver} in
1)
  _toolchain_name=armv6-rpi-linux-gnueabihf
  _toolchain="/opt/${_toolchain_name}/bin/${_toolchain_name}-"
  _float=true
  # too problematic for me to care about
  #_float=true
;;
2)
  #_toolchain_name=armv7-rpi2-linux-gnueabihf
  #_toolchain="/opt/${_toolchain_name}/bin/${_toolchain_name}-"
  # eats shit when linking artriculate with ltcg
  _toolchain_name=arm-cortexa9_neon-linux-gnueabihf
  _toolchain="/opt/x-tools/${_toolchain_name}/bin/${_toolchain_name}-"
  _float=true
  #_mkspec="linux-rpi${_piver}-vc4-g++"
  #_use_mesa=true
;;
3)
  _toolchain_name=aarch64-rpi3-linux-gnu
  _toolchain="/opt/x-tools/${_toolchain_name}/bin/${_toolchain_name}-"
  _use_mesa=true
  # just for projectmofo!
  #_opengl_variant="desktop"
;;
4)
  # yuck; here lies tinkerboard until I find a better way of generalizing this
  #_toolchain="/opt/gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-"
  _toolchain="/opt/gcc-linaro-7.1.1-2017.08-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-"

  _use_mesa=true
  _mkspec="linux-tinker-g++"
;;
5)
  # https://developer.nvidia.com/embedded/dlc/kernel-gcc-6-4-tool-chain
  # took forever to find one that worked
  #_toolchain="/usr/bin/aarch64-linux-gnu-"
  _toolchain="/opt/gcc-linaro-6.4.1-2017.08-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-"
  _mkspec="linux-jetson-nano-g++"
  _opengl_variant="desktop"
;;

esac

if $_target_host; then
  _use_mesa=true
elif [[ "${_piver}" = "4" ]]; then
  echo ""
elif [[ "${_piver}" = "5" ]]; then
  echo ""
else
  depends=("qpi${_piver}-toolchain")
fi

if [[ -z "${_dev_suffix}" ]]; then _release_type="official_releases"; fi

$_build_from_local_src_tree && _patching=false

# PKGBUILD vars

install=qpi.install

rm $install
touch $install

if [[ -n ${_piver} ]] || ! $_building; then
  pkgname="${pkgname}-raspberry-pi${_piver}"
fi
provides=($pkgname)

if $_static_build; then
  pkgname="${pkgname}-static"
fi

if $_building && $_uber_minimal; then
  _minimal=true
  _skip_qtwidgets=true
fi

if [[ -f debug ]]; then
  _debug=true
fi

if $_building && $_minimal; then
  _skip_qtscript=true
  _skip_qtwebengine=true
fi

$_skip_qtwebengine && _additional_configure_flags="$_additional_configure_flags -skip qtwebengine -no-icu"
$_skip_qtscript && _additional_configure_flags="$_additional_configure_flags -skip qtscript"
$_skip_qtwidgets && _additional_configure_flags="$_additional_configure_flags -no-widgets"
$_static_build && _additional_configure_flags="$_additional_configure_flags -static -ltcg"
$_float && _additional_configure_flags="$_additional_configure_flags -qreal float"
$_debug && _additional_configure_flags="$_additional_configure_flags -force-debug-info -separate-debug-info"

_libspkgname="${pkgname}-target-libs"
_libsdebugpkgname="${pkgname}-target-libs-debug"
_packaginguser=$(whoami)
_qt_package_name_prefix="qt-everywhere-src"
if [[ -n ${_dev_suffix} ]]; then
    _pkgver=${pkgver}-${_dev_suffix}
fi
_source_package_name=${_qt_package_name_prefix}-${_pkgver}
_baseprefix="/opt/qt"
_installprefix=${_baseprefix}/${pkgname}

pkgdesc="Qt SDK for the Raspberry Pi 1/2/3"
arch=("x86_64")
url="http://www.chaos-reins.com/qpi/"
license=("LGPL3" "GPL3")
optdepends=('qtcreator: Integrated Raspberry Pi IDE development')
makedepends=("git" "pkgconfig" "gcc" "gperf" "python")
#_provider=http://qt.mirror.constant.com/
_provider=https://download.qt.io
_tmpfs_dir=/vortex/build

_arch_specific_configure_options="\
    -prefix /usr \
    -docdir /usr/share/doc/qt \
    -headerdir /usr/include/qt \
    -archdatadir /usr/lib/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt/examples \
    -no-rpath \
"

retired_exhaustive_uber_minimal_specific_configure_options="\
    -no-linuxfb \
"

if $_minimal; then
    _additional_configure_flags="$_additional_configure_flags \
        -no-xcb \
        -qpa eglfs \
        -egl \
    "
fi

if $_uber_minimal; then
    _additional_configure_flags="$_additional_configure_flags \
        -no-direct2d \
        -no-directfb \
        -no-mirclient \
        -no-cups \
        -no-iconv \
        -no-gif \
        -no-sql-mysql \
        -no-sql-psql \
        -no-tslib \
        -no-feature-bearermanagement \
        -no-qml-debug \
        -no-ico \
        -no-glib \
    "
fi

if ! $_static_build && ! $_target_host; then
    _additional_configure_flags="$_additional_configure_flags \
        -hostprefix ${_installprefix} \
    "
fi

#-journald \
_core_configure_options=" \
                 -qt-freetype \
                 -qt-harfbuzz \
                 -qt-libpng \
                 -qt-libjpeg \
                 -qt-pcre \
                 -pkg-config \
                 -prefix ${_installprefix} \
                 -opengl ${_opengl_variant} \
                 -qt-sqlite \
                 -optimized-qmake \
                 -optimized-tools \
                 -confirm-license \
                 -opensource \
                 -v \
                 -silent \
                 -release \
                 -pch \
                 -make libs \
                 -nomake tools \
                 -nomake examples \
                 \
                 -reduce-exports \
        "

_tar_xz_sha256="f07cfc26762244bd343190b1b2e8b22708196f017024d6ab59f7fe1c8432f6b3"
#_tar_xz_sha256="356f42d9087718f22f03d13d0c2cdfb308f91dc3cf0c6318bed33f2094cd9d6c"

source=("git://github.com/sirspudd/mkspecs.git")
sha256sums=("SKIP")

if ! $_build_from_local_src_tree; then
  source+=("${_provider}/${_release_type}/qt/${_pkgvermajmin}/${_pkgver}/single/${_source_package_name}.tar.xz")
  sha256sums+=("$_tar_xz_sha256")
fi

options=('!strip')

if ${_use_mesa}; then
  _profiled_gpu_fn=qpi-mesa.sh
  _additional_configure_flags="$_additional_configure_flags -gbm -kms"
else
  _additional_configure_flags="$_additional_configure_flags -no-gbm"
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
  adjust_src_dir
  if [[ -n ${_srcdir} ]]; then
    _bindir="${_srcdir}"
  else
    # Probably repackaging: gonna have to make some assumptions
    _bindir="${startdir}/src/${_source_package_name}"
  fi
  if $_shadow_build; then
    _bindir="${startdir}/build"
    if $_minimal && [[ -d $_tmpfs_dir ]]; then
      _bindir="${_tmpfs_dir}/${_bindir}"
    fi
  fi
}

adjust_src_dir() {
  if $_build_from_local_src_tree; then
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
  adjust_bin_dir

  local _basedir="${_srcdir}/qtbase"
  local _mkspec_dir="${_basedir}/mkspecs/devices/${_mkspec}"

if $_uber_minimal; then
  local _qtpro=${_srcdir}/qt.pro
  local _tmp_qtpro=$(mktemp)
  cp $_qtpro $_tmp_qtpro
  echo "QT_BUILD_MODULES = qtbase qtdeclarative" > $_qtpro
  cat $_tmp_qtpro >> $_qtpro
fi

  # enable reduce relocations
  sed -i '/error Symbolic function binding/d' ${_srcdir}/qtbase/configure.json

if ! $_target_host && $_overwrite_mkspec; then
  # Get our mkspec
  rm -Rf $_mkspec_dir
  cp -r "${srcdir}/mkspecs/${_mkspec}" $_mkspec_dir
fi

if $_patching; then
  echo "Patching source"
  cd ${_srcdir}/qtdeclarative
  #patch -p1 < ${startdir}/0005-Fix-qtdeclarative-build-configured-with-qreal-float.patch
  cd ${_srcdir}/qtwebengine
  patch -p1 < ${startdir}/0001-Remove-super-shit-QPA-hueristics.patch
fi

  rm -Rf ${_bindir}
  mkdir -p ${_bindir}
  cd ${_bindir}

  # Fuck debian multi-arch dead
  export PKG_CONFIG_LIBDIR=${_sysroot}/usr/lib/$(${_toolchain}gcc -dumpmachine)/pkgconfig/:${_sysroot}/usr/lib/pkgconfig/
  export PKG_CONFIG_SYSROOT_DIR=${_sysroot}

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
                 -platform linux-clang \
                 ${_core_configure_options} \
                 ${_additional_configure_flags}"
# ${_arch_specific_configure_options} \
else
  # I harbour a certain amount of X11 prejudice
  local _configure_line="${_srcdir}/configure \
                 ${_core_configure_options} \
                 -qtlibinfix "Pi${_piver}" \
                 -sysroot ${_sysroot} \
                 -device ${_mkspec} \
                 -optimize-size \
                 -device-option CROSS_COMPILE=${_toolchain} \
                 ${_additional_configure_flags}"
fi
  local _configure_line_fn=configure_line
  echo ${_configure_line} > ${_configure_line_fn}
  set &> configure_env
  ${_configure_line} || exit 1
  sed -i "/\/usr\/include$/d" ${_bindir}/.qmake.stash
  make || exit 1
}

create_install_script() {
  local _prefix=/tmp

  if [[ -n "${startdir}" ]]; then
    _prefix=${startdir}
  else
    startdir=$PWD
  fi
  
  local _install_script_location="${_prefix}/${install}"

  echo _piver="${_piver}" > ${_install_script_location}
  echo _qmakepath="${_installprefix}/bin/qmake" >> ${_install_script_location}
  echo _sysroot="${_sysroot}" >> ${_install_script_location}
  echo _toolchain="${_toolchain}" >> ${_install_script_location}

  cat "${startdir}/_${install}" >> "${_prefix}/${install}"
}
#create_install_script

package() {
  adjust_bin_dir

  create_install_script

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
  local _pkgbindir=${_libspkgdir}/usr/bin
  local _profiledfn=qpi.sh
  local _qpienvexecfn=qpi-env-exec

  local _installed_dir="${pkgdir}/${_sysroot}/${_baseprefix}"
  local _installed_dir_sans_sysroot_offset="${pkgdir}/${_baseprefix}"

  rm -Rf ${_libspkgdir} ${_libsdebugpkgdir} ${pkgdir}
  mkdir -p ${_libspkgdir} ${_libsdebugpkgdir} ${pkgdir}

  cd "${_bindir}"
  INSTALL_ROOT="$pkgdir" make install || exit 1

  # attempt to fix Qt 5.12.1's insane complete qualification of linked libraries
  # this still results in other sources of the complete path
  find ${_installed_dir}/${pkgname} -type f -regex '.*\(prl\|pc\|pri\)' | xargs sed -i "s,/mnt/pi4/[^ ]*lib\(.[^ ]*\)\.so,-l\1,g"
  # this breaks stuff as gcc does not look inside of sysroots for supposedly qualified paths
  #find ${_installed_dir}/${pkgname}/mkspecs/modules -type f | xargs sed -i "s,${_sysroot}\([^ ]*\.so\),\1,g"

  cd $(dirname $(dirname ${_installed_dir}))

if $_debug; then
  find $(basename $(dirname ${_installed_dir})) -name '*.debug' -exec cp --parents '{}' ${_libsdebugpkgdir} \; -exec rm '{}' \;

  cp ${startdir}/PKGBUILD.libs.debug ${_libsdebugpkgbuild}

  sed -i "s/libspkgrel/${pkgrel}/" ${_libsdebugpkgbuild}
  sed -i "s/libspkgver/${pkgver}/" ${_libsdebugpkgbuild}
if $_target_host || $_static_build; then
  sed -i "s/libspkgname/${pkgname}/" ${_libsdebugpkgbuild}
else
  sed -i "s/libspkgname/${_libspkgname}/" ${_libsdebugpkgbuild}
fi
  sed -i "s/libsdebugpkgname/${_libsdebugpkgname}/" ${_libsdebugpkgbuild}
  sed -i "s/libspiver/${_piver}/" ${_libsdebugpkgbuild}

  cd ${_libsdebugdir}
  runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1
  mv ${_libsdebugdir}/${_libsdebugpkgname}-${pkgver}-${pkgrel}-any.pkg.tar.* ${startdir}
fi

  if $_static_build || $_target_host; then
    if ! $_target_host; then
        mkdir $(dirname ${_installed_dir_sans_sysroot_offset})
        mv ${_installed_dir} `dirname ${_installed_dir_sans_sysroot_offset}`
    fi
  else
    mv `dirname ${_installed_dir}` ${_libspkgdir}

    cp ${_bindir}/configure_line ${_bindir}/config.summary ${_libspkgdir}

    cp ${startdir}/PKGBUILD.libs ${_libspkgbuild}

    # set correct libs version
    sed -i "s/libspkgrel/${pkgrel}/" ${_libspkgbuild}
    sed -i "s/libspkgver/${pkgver}/" ${_libspkgbuild}
    sed -i "s/libspkgname/${_libspkgname}/" ${_libspkgbuild}
    sed -i "s/libspiver/${_piver}/" ${_libspkgbuild}

    mkdir -p ${_pkgprofiled}
    mkdir -p ${_pkgbindir}

    cp -L ${startdir}/${_profiledfn} ${_pkgprofiled}
    cp -L ${startdir}/${_profiled_gpu_fn} ${_pkgprofiled}
    cp -L ${startdir}/${_qpienvexecfn} ${_pkgbindir}
    sed -i "s,localpiprefix,${_installprefix}," ${_pkgprofiled}/${_profiledfn}

    cd ${_libsdir}
    runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1
    mv ${_libsdir}/${_libspkgname}-${pkgver}-${pkgrel}-any.pkg.tar.* ${startdir}
  fi

  cp ${_bindir}/configure_line ${_bindir}/config.summary ${_basepkgdir}
}
