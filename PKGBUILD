# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Charles K. Neimog <charlesneimog@outlook.com>

_pkgbasename=openmusic
pkgname=${_pkgbasename}-bin
pkgver=7.6
pkgrel=1
pkgdesc="A visual programming language designed for music composition (prebuilt upstream binary)"
arch=('x86_64')
url="https://github.com/openmusic-project/openmusic"
license=('GPL')
depends=(
  'desktop-file-utils'
  'gdk-pixbuf2'
  'portmidi'
  'libsndfile'
)
optdepends=(
  'jack: JACK audio support'
  'libsamplerate: Speed up audio-waveform drawing'
)
makedepends=('tar' 'gzip')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
options=(!strip)
_srcfile="openmusic_${pkgver}-1_amd64.deb"
source=(
  "https://github.com/openmusic-project/openmusic/releases/download/v${pkgver}/${_srcfile}"
)
sha256sums=(
  '69a1fdb7d48df95b32f283b58f0b86ee80e611bf75ab270eb92d9ef8c09f98dd'  
)

package() {
  cd "${srcdir}"
  bsdtar -xf "${_srcfile}"
  local data_tar
  data_tar=$(ls data.tar.*)
  bsdtar -xf "${data_tar}" -C "${pkgdir}"
  if [[ -d "${pkgdir}/opt/${_pkgbasename}" && ! -e "${pkgdir}/usr/bin/openmusic" ]]; then
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgbasename}/openmusic" "${pkgdir}/usr/bin/openmusic" 2>/dev/null || true
  fi
  if [[ ! -f "${pkgdir}/usr/share/applications/openmusic.desktop" ]]; then
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/openmusic.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=OpenMusic
Comment=Visual programming language for music composition
Exec=openmusic
Icon=openmusic
Terminal=false
Categories=Audio;AudioVideo;Development;
EOF
  fi
}
