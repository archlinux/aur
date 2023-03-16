# Maintainer: Donald Carr <d at chaos-reins dot com>

# Cross compilation is currently broken due to Qt 6 changes

#set -x

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
# Fedora: systemd-devel mesa-*-devel wayland*-devel fontconfig-devel libinput-devel freetype-devel qt-qtdeclarative-devel

pkgname="qt-sdk"

# Sanity check
_building=true

# Options
_opengl_variant="desktop"
_target_host=true
_sysroot=""
_piver=""
_use_mesa=true
_float=false
_shadow_build=true
_skip_qtwebengine=true
_skip_qtwidgets=false
_static_build=false
_build_from_local_src_tree=false
_patching=true
_minimal=false
_uber_minimal=false

if [[ -z ${startdir} ]]; then
  _building=false
fi

if [[ -f build-from-local-src-tree  ]]; then
  _build_from_local_src_tree=true
fi

if [[ -f static ]]; then
  _static_build=true
  _uber_minimal=true
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
if $_building && [[ -n $LOCAL_PI_VER ]]; then
  if [[ -z $_piver ]]; then _piver=$LOCAL_PI_VER; fi
  _sysroot=/mnt/pi${_piver}

  if [[ ! -d "${_sysroot}/etc" ]]; then
    echo "You have to set a valid sysroot to proceed with the build"
    exit 1
  fi

  _pkgname="${_pkgname}-rpi${_piver}"
  _target_host=false
  _mkspec="linux-rpi${_piver}-g++"
  _opengl_variant="es2"
  case ${_piver} in
    0)
    ;&
    1)
      _toolchain_name=armv6-rpi-linux-gnueabihf
      _toolchain="/opt/${_toolchain_name}/bin/${_toolchain_name}-"
      _float=true
    ;;
    2)
      _toolchain_name=arm-cortexa9_neon-linux-gnueabihf
      _toolchain="/opt/x-tools/${_toolchain_name}/bin/${_toolchain_name}-"
      _float=true
    ;;
    3)
      _toolchain_name=aarch64-rpi3-linux-gnu
      _toolchain="/opt/x-tools/${_toolchain_name}/bin/${_toolchain_name}-"
    ;;
    4)
      _toolchain="${HOME}/x-tools/aarch64-spudd-linux-gnu/bin/aarch64-spudd-linux-gnu-"
    ;;
    *)
      echo "Unsupported pi variant; add support"
      exit 1
    ;;
  esac
fi

# vars
_local_qt_repo="${local_qt_repo}"
#_pkgvermajmin="5.15"
_pkgvermajmin="6.5"
_pkgverpatch=".0"
# {alpha/beta/beta2/rc}
_dev_suffix="beta3"
pkgrel=2
pkgver="${_pkgvermajmin}${_pkgverpatch}"
$_build_from_local_src_tree && pkgver=6.6.6
if [[ -n ${_dev_suffix} ]]; then
    _pkgver=${pkgver}-${_dev_suffix}
    pkgver=${pkgver}${_dev_suffix}
fi
_release_type="development_releases"
_profiled_gpu_fn=qpi-proprietary.sh

__pkgconfigpath=${_sysroot}/usr/lib/pkgconfig
__eglpkgconfigpath="${__pkgconfigpath}/egl.pc"
__glespkgconfigpath="${__pkgconfigpath}/glesv2.pc"

_overwrite_mkspec=true

if [[ -z "${_dev_suffix}" ]]; then _release_type="official_releases"; fi

$_build_from_local_src_tree && _patching=false

# Qt Creator integration at install broken
#install=qpi.install

#rm $install
#touch $install

provides=($pkgname)

if $_static_build; then
  pkgname="${pkgname}-static"
fi

if $_building && $_uber_minimal; then
  _minimal=true
  _skip_qtwidgets=true
fi

_libspkgname="${pkgname}-target-libs"
_libsdebugpkgname="${pkgname}-target-libs-debug"
_packaginguser=$(whoami)
_qt_package_name_prefix="qt-everywhere-src"
_source_package_name=${_qt_package_name_prefix}-${_pkgver}
_installprefix="/opt/qt/${_pkgver}"

pkgdesc="Qt SDK for both hosts and a variety of targets"
arch=("x86_64")
url="http://www.chaos-reins.com/qpi/"
license=("LGPL3" "GPL3")
optdepends=('qtcreator: Integrated IDE development')
makedepends=("git" "pkgconfig" "gcc" "gperf" "python" "clang" "cmake" "ninja" "libc++" "pcre" "harfbuzz" "mold")
#_provider=http://qt.mirror.constant.com/
_provider=https://download.qt.io
_tmpfs_dir=/vortex/build

source=()
sha256sums=()

if ! $_build_from_local_src_tree; then
  source+=("${_provider}/${_release_type}/qt/${_pkgvermajmin}/${_pkgver}/single/${_source_package_name}.tar.xz")
  sha256sums+=("SKIP")
  #if $_building; then echo ${source[@]}; fi
fi
#echo "Source: ${source[@]}"

options=('!strip')

if ${_use_mesa}; then
  _profiled_gpu_fn=qpi-mesa.sh
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
      #rm $install
      #touch $install
    fi
}

build() {
  _srcdir="${srcdir}/${_source_package_name}"

  local _basedir="${_srcdir}/qtbase"
  local _mkspec_dir="${_basedir}/mkspecs/devices/${_mkspec}"

  #local _builddir=${BUILDDIR}/${pkgbase}
  #rm -Rf ${_builddir}
  #mkdir -p ${_builddir}
  #cd ${_builddir}

  # Just because you can enable something doesnt mean you should
  # Prepare for breakage in all your Qt derived projects
  #-qtnamespace "Pi${_piver}" \

  #-DQT_BUILD_SUBMODULES=qtbase;qtdeclarative \
  #-D_CMAKE_TOOLCHAIN_PREFIX=llvm \
  #-DCMAKE_BUILD_TYPE=RelWithDebInfo \
  #-DINPUT_linker=lld \

  # using clang like this results in a broken moc
  #export CC=clang
  #export CXX=clang++
  local _configure_line_fn=configure_line
  local _configure_line="cmake \
                                -GNinja \
                                -DCMAKE_BUILD_TYPE=RelWithDebInfo \
                                -DFEATURE_separate_debug_info=ON \
                                -DFEATURE_reduce_exports=ON \
                                -DFEATURE_reduce_relocations=ON \
                                -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
                                -DBUILD_WITH_PCH=ON \
                                -DQT_BUILD_TESTS=OFF \
                                -DQT_BUILD_EXAMPLES=OFF \
                                -DCMAKE_INSTALL_PREFIX:PATH=${_installprefix} \
                                -DBUILD_qtwebengine=OFF \
                                -DINPUT_linker=mold \
                                ${_srcdir}
    "
  echo ${_configure_line} > ${_configure_line_fn}
  set &> configure_env
  ${_configure_line}
  time cmake --build . --parallel
  #cmake --build . --target docs
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
  #create_install_script

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

  local _installed_dir="${pkgdir}/${_sysroot}/${_installprefix}"
  local _installed_dir_sans_sysroot_offset="${pkgdir}/${_installprefix}"

  rm -Rf ${_libspkgdir} ${_libsdebugpkgdir} ${pkgdir}
  mkdir -p ${_libspkgdir} ${_libsdebugpkgdir} ${pkgdir}

  #cd "${_bindir}"
  echo "Installing to ${pkgdir}"
  DESTDIR="$pkgdir" cmake --install .
  #DESTDIR="$pkgdir" cmake --install . --target install_docs

#  find ${_installed_dir} -name '*.debug' -exec cp --parents '{}' ${_libsdebugpkgdir} \; -exec rm '{}' \;

#  cp ${startdir}/PKGBUILD.libs.debug ${_libsdebugpkgbuild}
#
#  sed -i "s/libspkgrel/${pkgrel}/" ${_libsdebugpkgbuild}
#  sed -i "s/libspkgver/${pkgver}/" ${_libsdebugpkgbuild}
#if $_target_host || $_static_build; then
#  sed -i "s/libspkgname/${pkgname}/" ${_libsdebugpkgbuild}
#else
#  sed -i "s/libspkgname/${_libspkgname}/" ${_libsdebugpkgbuild}
#fi
#  sed -i "s/libsdebugpkgname/${_libsdebugpkgname}/" ${_libsdebugpkgbuild}
#  sed -i "s/libspiver/${_piver}/" ${_libsdebugpkgbuild}
#
#  cd ${_libsdebugdir}
#  runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1
#  #mv ${_libsdebugdir}/${_libsdebugpkgname}-${pkgver}-${pkgrel}-any.pkg.tar.* ${startdir}
#
#  if $_static_build || $_target_host; then
#    if ! $_target_host; then
#        mkdir $(dirname ${_installed_dir_sans_sysroot_offset})
#        mv ${_installed_dir} `dirname ${_installed_dir_sans_sysroot_offset}`
#    fi
#  else
#    mv `dirname ${_installed_dir}` ${_libspkgdir}
#
#    cp ${_bindir}/configure_line ${_bindir}/config.opt ${_libspkgdir}
#
#    cp ${startdir}/PKGBUILD.libs ${_libspkgbuild}
#
#    # set correct libs version
#    sed -i "s/libspkgrel/${pkgrel}/" ${_libspkgbuild}
#    sed -i "s/libspkgver/${pkgver}/" ${_libspkgbuild}
#    sed -i "s/libspkgname/${_libspkgname}/" ${_libspkgbuild}
#    sed -i "s/libspiver/${_piver}/" ${_libspkgbuild}
#
#    mkdir -p ${_pkgprofiled}
#    mkdir -p ${_pkgbindir}
#
#    cp -L ${startdir}/${_profiledfn} ${_pkgprofiled}
#    cp -L ${startdir}/${_profiled_gpu_fn} ${_pkgprofiled}
#    cp -L ${startdir}/${_qpienvexecfn} ${_pkgbindir}
#    sed -i "s,localpiprefix,${_installprefix}," ${_pkgprofiled}/${_profiledfn}
#
#    cd ${_libsdir}
#    runuser -l ${_packaginguser} -c 'makepkg -d -f' || exit 1
#    #mv ${_libsdir}/${_libspkgname}-${pkgver}-${pkgrel}-any.pkg.tar.* ${startdir}
#  fi

  cp configure_line config.summary ${_basepkgdir}
}
