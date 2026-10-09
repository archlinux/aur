# Maintainer: willker <wz[dot]willker[at]gmail[dot]com>

pkgname=nipaplay-reload-bin
_pkgname=NipaPlay
_desktop_name=io.github.MCDFsteve.NipaPlay-Reload
pkgver=1.11.9
pkgrel=1
pkgdesc="一个现代化的跨平台视频播放器"
arch=('x86_64')
url="https://github.com/MCDFsteve/NipaPlay-Reload"
license=('MIT')
depends=('mpv' 'gtk3' 'ffmpeg' 'libass' 'libkeybinder3' 'libayatana-appindicator' 'libayatana-indicator'
         'gstreamer' 'gst-plugins-base-libs' 'libevdev' 'mimalloc2')
makedepends=('patchelf')
provides=("${pkgname%-reload-bin}" "${pkgname%-bin}")
conflicts=("${pkgname%-reload-bin}" "${pkgname%-bin}")
options=('!debug')
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-amd64.deb"
  "${url}/raw/main/LICENSE"
)
sha256sums=('9dc544e309d674025988eddbb4fefaa2d1440781d1b7a27c6f213d092664280c'
            'fd1d762b5ea1f4cd690235a1b8d6b8efe4ada061f5b26c1fefbd74c156f8184b')

package() {
  cd "$srcdir"
  tar -xf data.tar.zst -C "$pkgdir"

  rm -f "${pkgdir}/opt/nipaplay/lib/libmpv.so.2.2.0"

  while IFS= read -r -d '' _f; do
    _old=$(patchelf --print-rpath "${_f}" 2>/dev/null) || continue
    [[ -z ${_old} ]] && continue
    _new=$(tr ':' '\n' <<<"${_old}" | grep '^\$ORIGIN' | paste -sd: -)
    [[ -z ${_new} ]] && _new='$ORIGIN'
    [[ ${_new} == "${_old}" ]] || patchelf --set-rpath "${_new}" "${_f}"
  done < <(find "${pkgdir}/opt/nipaplay" -type f \( -name '*.so*' -o -name 'NipaPlay' \) -print0)

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
