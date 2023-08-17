# Maintainer: 7Ji <pugokughin@gmail.com>

# At least for opi5/5b/plus, the vendor kernel uses DDK driver g13p0-01eac0.
# Starting from g13p0, firmware must be in the same version as the kernel DDK driver
# So we cannot use the latest firmware even it is much newer

_model_canonical='ARM Mali-G610'
_model='mali-valhall-g610'
pkgbase="lib${_model}"
_firmware="${_model}-firmware"
pkgname=("${_firmware}")
pkgver='g13p0'
pkgrel=1
pkgdesc="Firmware and blob drivers for ${_model_canonical}"
url='https://developer.arm.com/Processors/Mali-G610'
license=('custom')
_repo='https://github.com/JeffyCN/mirrors'
_firmware_commit='3d4d26fb997fa9acbe0aab54e819baa7161d94d9' # For g13p0
_eula_commit='8605a3c81b60ac5bd8e492cc02e84a2e0aa8e524'
source=(
  "${_repo}/raw/${_eula_commit}/END_USER_LICENCE_AGREEMENT.txt"
  "${_repo}/raw/${_firmware_commit}/firmware/g610/mali_csffw.bin"
)
sha256sums=(
  'a78acc73de9909efb879800d4daa4640c4aaa55cd751238a133954aba15e4285'
  '9e9cede2cb8f45228216f39259552ac886950be9daf59e2591c73bde60010699'
  '5081b68111c6bf1367c55400d0f30824f25e79b78d8e790cd3b028db82fcd98e'
  '0462d689f1c74b7008aa2a6a320d0050a655c74ff1e7451c393ccdbb22ba13e0'
  '10f3666863ba677be1e3fb154217e6a5d97e8e2bce9a4444296e546f5afd30a2'
  '232e4c8524162401094dbe0b95b2f6f150d038466d167222e0e11ce6e66fe6a2'
  '2f72a27eefdff535abcdc075db08ed692f475a519c17f8df8f1ef4e3876310ca'
)
arch=('aarch64')
options=(!strip)
_package-firmware() {
  install -D --mode=644 mali_csffw.bin --target-directory="${pkgdir}"/usr/lib/firmware/
  install -D --mode=644 END_USER_LICENCE_AGREEMENT.txt --target-directory="${pkgdir}/usr/share/licenses/${pkgbase}"
}

eval "package_${_firmware}() {
  pkgdesc='Firmware for ${_model_canonical}'
  _package-firmware
}"

_package-lib() {
  local _srcname="${pkgbase}-${pkgver}-${_suffix}.so"
  local _libdir="${pkgdir}/usr/lib/${_model}/${_suffix}"
  local _soname=libmali.so.1.9.0
  install -D --mode=755 "${_srcname}" "${_libdir}/${_soname}"
  local _libs=(EGL.so EGL.so.1 GLESv1_CM.so GLESv1_CM.so.1
              GLESv2.so GLESv2.so.2 MaliOpenCL.so MaliOpenCL.so.1
              mali.so mali.so.1)
  if [[ "${_suffix}" =~ wayland ]]; then
    _libs+=(wayland-egl.so wayland-egl.so.1)
  fi
  if [[ "${_suffix}" =~ gbm ]]; then
    _libs+=(gbm.so gbm.so.1 )
  fi
  local _lib
  for _lib in ${_libs[@]}; do
    ln -s ${_soname} ${_libdir}/lib${_lib}
  done
}

_suffixes=(dummy gbm wayland-gbm x11-gbm x11-wayland-gbm)
_lib_commit='9869c5a8aa0c103efac5a5d5eefe03468a6b8396' # For g13p0
for _suffix in dummy gbm wayland-gbm x11-gbm x11-wayland-gbm; do
  pkgname+=("${pkgbase}-${_suffix}")
  source+=("${_repo}/raw/${_lib_commit}/lib/aarch64-linux-gnu/${pkgbase}-${pkgver}-${_suffix}.so")
  eval "package_${pkgbase}-${_suffix}() {
    pkgdesc='Blob driver for ${_model_canonical}, for ${_suffix} target'
    depends=('${_firmware}')
    local _suffix=${_suffix}
    _package-lib
  }"
done