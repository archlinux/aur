# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=orbbec-viewer
pkgver=1.10.37
pkgrel=1
pkgdesc='Viewer for Orbbec depth cameras (prebuilt release)'
arch=('x86_64' 'aarch64')
url='https://github.com/orbbec/OrbbecSDK'
license=('custom')
depends=('glibc' 'gcc-libs' 'libglvnd' 'libx11')
depends_x86_64=('numactl')
makedepends=('patchelf')
options=('!strip' '!debug')
install="${pkgname}.install"

source=("${pkgname}.sh" "${pkgname}.desktop" 'udev-uaccess.patch')
sha256sums=('992dfc10246d0b8a55773683c0d16b69ad38533bc3253ff3116da86e78d96dbb'
            'c2a8e66b44719353b1d15ced6f77ee51733d6c7e4353cdfcbddf748d42259857'
            'f33821815ef7af1bcdb7b33777f194a8beca1b75f15694261de4f5cbf363649c')

_date_x86_64=202607070725
_date_aarch64=202607071544
source_x86_64=("${url}/releases/download/v${pkgver}/OrbbecViewer_v${pkgver}_${_date_x86_64}_linux_x64_release.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/OrbbecViewer_v${pkgver}_${_date_aarch64}_linux_arm64_release.zip")
sha256sums_x86_64=('d275c07e66dad12adbea378d3643786b9c0704aa74c78641f4c39e95691a8837')
sha256sums_aarch64=('37f3dbc774cac0cab4b9c922cb18ff6cf0698a85ea2bbfa40926c8e6b29c2e06')

_srcdir() {
  case "$CARCH" in
    x86_64)  echo "${srcdir}/OrbbecViewer_v${pkgver}_${_date_x86_64}_linux_x64_release" ;;
    aarch64) echo "${srcdir}/OrbbecViewer_v${pkgver}_${_date_aarch64}_linux_arm64_release" ;;
  esac
}

prepare() {
  local _src; _src="$(_srcdir)"

  # World-writable device nodes replaced by logind's uaccess ACL, as
  # recommended in https://wiki.archlinux.org/title/Udev.
  patch -d "${_src}" -Np1 -i "${srcdir}/udev-uaccess.patch"
}

package() {
  local _src; _src="$(_srcdir)"
  local _opt="${pkgdir}/opt/${pkgname}"

  # The release ships its own copies of ffmpeg, OpenSSL 1.1, GLEW, glfw,
  # jsoncpp, x264/x265, libcurl and the Orbbec SDK. They must stay next to
  # the executable (RPATH is $ORIGIN) and must not leak into /usr/lib where
  # they would clash with the system versions.
  install -d "${_opt}"
  cp -a "${_src}/." "${_opt}/"

  # Drop the stale SDK copy and the static build artifact; only the
  # top-level libraries next to the executable are used at runtime.
  rm -rf "${_opt}/lib" "${_opt}/staticlib"

  # The prebuilt binaries carry a build-host RPATH and an empty RPATH entry
  # (the latter makes the loader search the current directory). Point them
  # at the private library directory instead.
  local _f
  while IFS= read -r -d '' _f; do
    patchelf --set-rpath '$ORIGIN' "${_f}"
  done < <(find "${_opt}" -maxdepth 1 -type f \
             \( -name 'OrbbecViewer' -o -name '*.so*' \) -print0)

  # Wrapper that runs the viewer from a writable per-user directory.
  install -Dm755 "${srcdir}/${pkgname}.sh" \
    "${pkgdir}/usr/bin/${pkgname}"

  # Upstream name for use in scripts/docs.
  ln -s "${pkgname}" "${pkgdir}/usr/bin/OrbbecViewer"

  install -Dm644 "${_src}/res/orbbec_icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Renamed so it does not collide with orbbecsdk-v2-bin's copy; uaccess
  # replaces the vendor's world-writable nodes via udev-uaccess.patch.
  install -Dm644 "${_src}/script/99-obsensor-libusb.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/99-orbbec-viewer.rules"
}

# vim: set sw=2 ts=2 et:
