pkgname=half-beat-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='实现 b 站电脑端听视频的桌面音乐播放器'
arch=('x86_64')
url='https://github.com/Sheyiyuan/Half-Beat-Player'
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
provides=('half-beat')
conflicts=('half-beat')
source=("${url}/releases/download/v${pkgver}/half-beat_${pkgver}_amd64.deb")
sha256sums=('7c60687ab41aa9ede93bb6e80b8b7d444ddf60fe1031471200effea7c39aec94')

package() {
  local deb_file="${srcdir}/half-beat_${pkgver}_amd64.deb"
  local data_tar

  bsdtar -xf "${deb_file}" -C "${srcdir}"
  data_tar="$(find "${srcdir}" -maxdepth 1 -type f -name 'data.tar.*' | head -n 1)"

  if [[ -z "${data_tar}" ]]; then
    echo 'data.tar.* not found in deb package' >&2
    return 1
  fi

  bsdtar -xf "${data_tar}" -C "${pkgdir}"

  if [[ -f "${pkgdir}/usr/share/doc/half-beat/copyright" ]]; then
    install -Dm644 \
      "${pkgdir}/usr/share/doc/half-beat/copyright" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
