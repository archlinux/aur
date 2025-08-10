# Maintainer:  dreieck
# Contributor: Christoph Haag <christoph.haag@collabora.com>

pkgname="monado-dreieck-git"
_dirname="monado"
pkgver=25.0.0+245.r7803.20250807.6ba8ba83a
pkgrel=1
pkgdesc="The open source OpenXR runtime. @dreieck's custom build."
arch=('i686' 'x86_64')
url='https://monado.dev'
depends=(
  'bluez-libs'
  'cjson'
  'dbus'
  'gcc-libs'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'hidapi'
  'libbsd'
  'libdrm'
  'libgl'
  'libjpeg.so'
  'librealsense'
  'libsurvive'
  'libudev'
  'libusb'
  'libuvc'
  'libx11'
  'libxcb'
  'onnxruntime'
  # 'opencv'  # Maybe only optional dependency?
  # 'openhmd' # Maybe only optional dependency?
  'openvr'
  'openxr'
  'sdl2'
  'vulkan-icd-loader'
  'zlib'
)
makedepends=(
  'cmake'
  'doxygen' # When building docs
  'eigen'
  'git'
  'ninja'
  'libcap'
  'opencv'
  'openhmd'
  'shaderc'
  'vulkan-headers'
  'wayland-protocols'
)
optdepends=(
  'basalt-monado-git: experimental SLAM tracking through basalt (needs to be present at compile time)'
  'kimera-vio-monado-git: experimental SLAM tracking through kimera (needs to be present at compile time)'
  'opencv: optical tracking support (needs to be present at compile time)'
  'openhmd: additional hardware support (Oculus Rift, Nolo) (needs to be present at compile time)'
  'percetto: tracing support for performance debugging (needs to be present at compile time)'
  'wayland: To use this with wayland.'
  'xr-hardware: Udev rules for XR hardware.'
)
provides=(
  "openxr-runtime"
  "monado=${pkgver}"
  "monado-git=${pkgver}"
)
conflicts=(
  "monado"
)
install=monado.install

license=('LicenseRef-boost')
source=("${_dirname}::git+https://gitlab.freedesktop.org/monado/monado.git#branch=main")
sha256sums=('SKIP')

# options+=('!lto')
# options+=('ccache')

prepare() {
  cd "${_dirname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${_dirname}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  _FIXWERROR="implicit-function-declaration"
  for _werror in "${_FIXWERROR}"; do
    CFLAGS+=" -Wno-error=${_werror} -Wno-${_werror}"
    CXXFLAGS+=" -Wno-error=${_werror}"
  done
  export CFLAGS
  export CXXFLAGS

  local _cmake_options
  _cmake_options=(
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_INSTALL_PREFIX=/usr/
    -DCMAKE_BUILD_TYPE=Release
    -DBUILD_DOC=ON
    -DBUILD_TESTING=ON
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
    -DCMAKE_CXX_FLAGS_DEBUG="${DEBUG_CXXFLAGS} -Og -DDEBUG"
    -DCMAKE_CXX_FLAGS_MINSIZEREL="${CXXFLAGS} -Os -DNDEBUG"
    -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS} -O3 -DNDEBUG"
    -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="${CXXFLAGS} -O2 -g -DNDEBUG"
    -DXRT_BUILD_DRIVER_ANDROID=OFF
    -DXRT_BUILD_DRIVER_ARDUINO=ON
    -DXRT_BUILD_DRIVER_DAYDREAM=ON
    -DXRT_BUILD_DRIVER_DEPTHAI=OFF
    -DXRT_BUILD_DRIVER_EUROC=ON
    -DXRT_BUILD_DRIVER_HANDTRACKING=ON
    -DXRT_BUILD_DRIVER_HDK=ON
    -DXRT_BUILD_DRIVER_HYDRA=ON
    -DXRT_BUILD_DRIVER_ILLIXR=OFF
    -DXRT_BUILD_DRIVER_NS=OFF  # 2025-08-10: `=ON` causes error `src/xrt/drivers/north_star/ns_hmd.c:442:17: error: ‘res’ undeclared (first use in this function)`.
    -DXRT_BUILD_DRIVER_OHMD=ON
    -DXRT_BUILD_DRIVER_OPENGLOVES=ON
    -DXRT_BUILD_DRIVER_PSMV=ON
    -DXRT_BUILD_DRIVER_PSSENSE=ON
    -DXRT_BUILD_DRIVER_PSVR=ON
    -DXRT_BUILD_DRIVER_QWERTY=ON
    -DXRT_BUILD_DRIVER_REMOTE=ON
    -DXRT_BUILD_DRIVER_RIFT_S=ON
    -DXRT_BUILD_DRIVER_ROKID=ON
    -DXRT_BUILD_DRIVER_SIMULATED=ON
    -DXRT_BUILD_DRIVER_SIMULAVR=ON
    -DXRT_BUILD_DRIVER_STEAMVR_LIGHTHOUSE=ON
    -DXRT_BUILD_DRIVER_SURVIVE=ON
    -DXRT_BUILD_DRIVER_TWRAP=ON
    -DXRT_BUILD_DRIVER_ULV2=OFF
    -DXRT_BUILD_DRIVER_ULV5=OFF
    -DXRT_BUILD_DRIVER_VF=ON
    -DXRT_BUILD_DRIVER_VIVE=ON
    -DXRT_BUILD_DRIVER_WMR=ON
    -DXRT_BUILD_DRIVER_XREAL_AIR=ON
    -DXRT_BUILD_SAMPLES=ON
    -DXRT_FEATURE_CLIENT_DEBUG_GUI=ON
    -DXRT_FEATURE_COLOR_LOG=ON
    -DXRT_FEATURE_DEBUG_GUI=ON
    -DXRT_FEATURE_OPENXR=ON
    -DXRT_FEATURE_OPENXR_BODY_TRACKING_FB=ON
    -DXRT_FEATURE_OPENXR_DISPLAY_REFRESH_RATE=ON
    -DXRT_FEATURE_OPENXR_FACIAL_TRACKING_HTC=ON
    -DXRT_FEATURE_OPENXR_INTERACTION_EXT_EYE_GAZE=ON
    -DXRT_FEATURE_OPENXR_INTERACTION_EXT_HAND=ON
    -DXRT_FEATURE_OPENXR_INTERACTION_EXT_PALM_POSE=ON
    -DXRT_FEATURE_OPENXR_INTERACTION_MSFT_HAND=ON
    -DXRT_FEATURE_OPENXR_LAYER_COLOR_SCALE_BIAS=ON
    -DXRT_FEATURE_OPENXR_LAYER_CYLINDER=ON
    -DXRT_FEATURE_OPENXR_LAYER_DEPTH=ON
    -DXRT_FEATURE_OPENXR_LAYER_EQUIRECT2=ON
    -DXRT_FEATURE_OPENXR_LAYER_FB_ALPHA_BLEND=ON
    -DXRT_FEATURE_OPENXR_LAYER_FB_DEPTH_TEST=ON
    -DXRT_FEATURE_OPENXR_LAYER_FB_IMAGE_LAYOUT=ON
    -DXRT_FEATURE_OPENXR_LAYER_FB_SETTINGS=ON
    -DXRT_FEATURE_OPENXR_OVERLAY=ON
    -DXRT_FEATURE_OPENXR_PERFORMANCE_SETTINGS=ON
    -DXRT_FEATURE_OPENXR_VULKAN_SWAPCHAIN_FORMAT_LIST=ON
    -DXRT_FEATURE_RENDERDOC=ON
    -DXRT_FEATURE_SERVICE=ON
    -DXRT_FEATURE_SERVICE=ON
    -DXRT_FEATURE_SERVICE_SYSTEMD=OFF
    -DXRT_FEATURE_SLAM=ON
    -DXRT_FEATURE_SSE2=ON
    -DXRT_FEATURE_STEAMVR_PLUGIN=ON
    -DXRT_FEATURE_WINDOW_PEEK=ON
    -DXRT_HAVE_BLUETOOTH=ON
    -DXRT_HAVE_DBUS=ON
    -DXRT_HAVE_EGL=ON
    -DXRT_HAVE_GST=ON
    -DXRT_HAVE_HIDAPI=ON
    -DXRT_HAVE_JPEG=ON
    -DXRT_HAVE_LIBBSD=ON
    -DXRT_HAVE_LIBUDEV=ON
    -DXRT_HAVE_LIBUSB=ON
    -DXRT_HAVE_LIBUVC=ON
    -DXRT_HAVE_OPENCV=ON
    -DXRT_HAVE_OPENGL=ON
    -DXRT_HAVE_OPENGLES=ON
    -DXRT_HAVE_OPENGL_GLX=ON
    -DXRT_HAVE_OPENVR=ON
    -DXRT_HAVE_SDL2=ON
    -DXRT_HAVE_SYSTEM_CJSON=ON
    -DXRT_HAVE_TRACY=OFF
    -DXRT_HAVE_VULKAN=ON
    -DXRT_HAVE_WAYLAND=ON
    -DXRT_HAVE_XCB=ON
    -DXRT_HAVE_XLIB=ON
    -DXRT_HAVE_XRANDR=ON
    -DXRT_IPC_MSG_SOCK_FILENAME=monado_comp_ipc
    -DXRT_IPC_SERVICE_PID_FILENAME=monado.pid
    -DXRT_MODULE_AUX_VIVE=ON
    -DXRT_MODULE_COMPOSITOR=ON
    -DXRT_MODULE_IPC=ON
    -DXRT_MODULE_MERCURY_HANDTRACKING=ON
    -DXRT_MODULE_MONADO_CLI=ON
    -DXRT_MODULE_MONADO_GUI=ON
    -DXRT_OPENXR_INSTALL_ABSOLUTE_RUNTIME_PATH=OFF
    -DXRT_OPENXR_INSTALL_ACTIVE_RUNTIME=OFF
    -DXRT_OPENXR_INSTALL_MANIFEST_RELATIVE_RUNTIME_PATH=ON
    -DXRT_OXR_RUNTIME_SUFFIX=monado
    -GNinja

#     -DCMAKE_INSTALL_LIBDIR=lib
#     -DCMAKE_INSTALL_PREFIX=/usr/
#     -DCMAKE_BUILD_TYPE=RelWithDebInfo
#     -GNinja -B"$srcdir"/"$_dirname"-build
#     -DXRT_HAVE_SYSTEM_CJSON:BOOL='OFF'
  )

  cmake -B "${_dirname}"-build -S "${_dirname}" \
    "${_cmake_options[@]}"

  ninja -C "${srcdir}"/"${_dirname}"-build
}

package() {
  cd "${_dirname}"-build
  DESTDIR="${pkgdir}" ninja install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/monado" "${srcdir}/git.log" "${srcdir}/${_dirname}"/README.md
  # cp -rv doc "${pkgdir}/usr/share/doc/monado"/
  cp -rv "${srcdir}/${_dirname}/doc" "${pkgdir}/usr/share/doc/monado"/

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"    "${srcdir}/${_dirname}/LICENSE"
  cp -rv "${srcdir}/${_dirname}/LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}"/
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/monado/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES" "${pkgdir}/usr/share/doc/monado/LICENSES"
}
