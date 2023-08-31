# Maintainer: 7Ji <pugokughin@gmail.com>

_model_canonical='ARM Mali-G610'
_model='mali-valhall-g610'
_suffixes=(dummy gbm wayland-gbm x11-gbm x11-wayland-gbm)
_repo='https://github.com/JeffyCN/mirrors'
_libver_major=g13p0
_libver_minor=6
_lib_commit='9869c5a8aa0c103efac5a5d5eefe03468a6b8396'
_lib_parent="${_repo}/raw/${_lib_commit}/lib"
_eula_commit='8605a3c81b60ac5bd8e492cc02e84a2e0aa8e524'

pkgbase="lib${_model}"
pkgname=("${pkgbase}-base")
# Actual version uses -, but it is forbidden in pkgver
pkgver="${_libver_major}.${_libver_minor}"
pkgrel=4
url='https://developer.arm.com/Processors/Mali-G610'
license=('custom')
source=(
  "${_repo}/raw/${_eula_commit}/END_USER_LICENCE_AGREEMENT.txt"
  'libmali-wrapper'
)
source_aarch64=()
source_armv7h=()
sha256sums=(
  'a78acc73de9909efb879800d4daa4640c4aaa55cd751238a133954aba15e4285'
  '64eccfaa9d2f55f6f6e4256170d7960758ca785cd908af0b9c031190dc147d97'
)
sha256sums_aarch64=(
  '5081b68111c6bf1367c55400d0f30824f25e79b78d8e790cd3b028db82fcd98e'
  '0462d689f1c74b7008aa2a6a320d0050a655c74ff1e7451c393ccdbb22ba13e0'
  '10f3666863ba677be1e3fb154217e6a5d97e8e2bce9a4444296e546f5afd30a2'
  '232e4c8524162401094dbe0b95b2f6f150d038466d167222e0e11ce6e66fe6a2'
  '2f72a27eefdff535abcdc075db08ed692f475a519c17f8df8f1ef4e3876310ca'
)
sha256sums_armv7h=(
  'c4200b7cef9700c2f6b3c49f08069f26d9c88fab20030a809409ecfe4926b31b'
  '30333a051012f0812878bccd2e681acad44a40eb1321dc04d364086d8ef1e2c1'
  '4451f43f72ccaf9e180696c0f98bd8e66acad8c382f930b4411966a4e4cbfc70'
  '93ed59e572d1e0f177a23da8e24897f26b0eabfa297dd6e3b69ed23deb221774'
  '4dfc362e92eb22bf9c8b016cd25c0417c28bbb43a6040e11689b573e0648b125'
)
arch=('aarch64' 'armv7h')
options=(!strip)

_package-base() {
  local LD=
  case "${CARCH}" in
    aarch64)
      LD=ld-linux-aarch64.so.1
      ;;
    armv7h)
      LD=ld-linux-armhf.so.3
      ;;
  esac
  if [[ -z "${LD}" ]]; then
    echo "Failed to decide package arch"
    return 1
  fi
  sed "s/%MODEL%/${_model}/
       s/%LD%/${LD}/" libmali-wrapper |
    install -D --mode=755 /dev/stdin "${pkgdir}"/usr/bin/libmali

  install -D --mode=644 END_USER_LICENCE_AGREEMENT.txt --target-directory="${pkgdir}/usr/share/licenses/${pkgbase}"
}

eval "package_${pkgname}() {
  pkgdesc='License and wrapper for ${_model_canonical}'
  optdepends=(
    'chrpath: To identify and fix rpath issues'
    'dri2to3: Compatibility layer for Dri2-only driver'
    'gl4es: OpenGL to OpenGLES translation layer'
  )
  _package-base
}"

_package-lib() {
  local _srcname="${pkgbase}-${_libver_major}-${_suffix}.so"
  local _libdir="${pkgdir}/usr/lib/${_model}/${_suffix}"
  local _soname=libmali.so.1
  local _reallib=${_soname}.9.0
  local _wrapper=
  install -D --mode=755 "${_srcname}" "${_libdir}/${_reallib}"
  local _libs=(
    EGL.so.1
    GLESv1_CM.so.1
    GLESv2.so.2
    GLESv3.so.1
    MaliOpenCL.so.1
    OpenCL.so.1 
    # MaliVulkan.so.1   X not enabled by Rockchip
    # vulkan.so.1       X not enabled by Rockchip
    mali.so.1
  )
  if [[ "${_suffix}" =~ wayland ]]; then
    _libs+=(wayland-egl.so.1)
  fi
  if [[ "${_suffix}" =~ gbm ]]; then
    _libs+=(gbm.so.1 )
  fi
  case "${_suffix}" in
    dummy)
      _wrapper=d
      ;;
    gbm)
      _wrapper=g
      ;;
    wayland-gbm)
      _wrapper=w
      ;;
    x11-gbm)
      _wrapper=x
      ;;
    x11-wayland-gbm)
      _wrapper=-x11-wayland-gbm
      ;;
  esac
  local _lib _lib_bare
  for _lib in ${_libs[@]}; do
    _lib=lib${_lib}
    _lib_bare="${_lib%%so.*}"so
    ln -s ${_lib} "${_libdir}"/${_lib_bare}
    ln -s ${_soname} "${_libdir}"/${_lib}
  done
  ln -sf ${_reallib} "${_libdir}"/${_soname}

  local _bindir="${pkgdir}"/usr/bin
  mkdir -p "${_bindir}"
  ln -s libmali "${_bindir}"/libmali"${_wrapper}"
}

for _suffix in ${_suffixes[@]}; do
  pkgname+=("${pkgbase}-${_suffix}")
  source_aarch64+=("${_lib_parent}/aarch64-linux-gnu/${pkgbase}-${_libver_major}-${_suffix}.so")
  source_armv7h+=("${_lib_parent}/arm-linux-gnueabihf/${pkgbase}-${_libver_major}-${_suffix}.so")
  eval "package_${pkgbase}-${_suffix}() {
    pkgdesc='Blob driver for ${_model_canonical}, for ${_suffix} target'
    depends=('${pkgname}' '${_model}-firmware')
    provides=(libmali{,-${_suffix}})
    install=install_${_suffix}
    local _suffix=${_suffix}
    _package-lib
  }"
done