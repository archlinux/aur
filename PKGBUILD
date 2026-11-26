# Maintainer: lifespirit <life@crabs.pro>
# Contributor: Spolzer <132726602+SpolzerMod@users.noreply.github.com>

pkgname=yamusic-rs-bin
pkgver=1.1.9
pkgrel=1
pkgdesc='Unofficial Yandex Music client written in Rust and Slint (no Electron)'
arch=('x86_64')
url='https://github.com/SpolzerMod/yamusic-rs'
license=('GPL-3.0-only')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glibc' 'hicolor-icon-theme'
         'libgcc' 'libstdc++' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'wayland')
makedepends=('libarchive')
optdepends=('pipewire-alsa: ALSA playback via PipeWire'
            'pulseaudio-alsa: ALSA playback via PulseAudio'
            'xdg-utils: open links in a web browser'
            'zenity: file selection dialogs on GTK desktops'
            'kdialog: file selection dialogs on KDE Plasma'
            'noto-fonts-cjk: CJK song and artist names')
provides=('yamusic-rs')
conflicts=('yamusic-rs')
options=('!strip' '!debug')
source=("yamusic-rs_${pkgver}-1_amd64.deb::${url}/releases/download/v${pkgver}/yamusic-rs_${pkgver}-1_amd64.deb")
noextract=("yamusic-rs_${pkgver}-1_amd64.deb")
sha256sums=('e2b84e3afd1ccc40e2c2417467db67db08b13ca5ddb8104a4d18da79ec3c0333')

package() {
  local _deb="${srcdir}/yamusic-rs_${pkgver}-1_amd64.deb"
  local _unpacked="${srcdir}/deb-unpacked"
  local _data

  install -d "${_unpacked}" "${pkgdir}"
  bsdtar -xf "${_deb}" -C "${_unpacked}"
  for _data in "${_unpacked}"/data.tar.*; do
    [[ -f "${_data}" ]] || { printf 'Missing data.tar.* inside .deb\n' >&2; return 1; }
    break
  done
  bsdtar -xf "${_data}" -C "${pkgdir}"

  [[ -x "${pkgdir}/usr/bin/yamusic-rs" ]] || return 1
  [[ -f "${pkgdir}/usr/share/applications/yamusic-rs.desktop" ]] || return 1
  install -Dm644 "${pkgdir}/usr/share/doc/yamusic-rs/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  rm -rf "${pkgdir}/usr/share/doc"
}
