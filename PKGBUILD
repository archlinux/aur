# Maintainer: czyt <czytcn@gmail.com>

pkgname=minke-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Minke desktop agent powered by DeepSeek Harness"
arch=('x86_64')
url="https://github.com/lencx/Minke"
license=('Apache-2.0')

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libevdev'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'wayland'
  'xdg-utils'
)
optdepends=(
  'pulseaudio: audio playback (or pipewire)'
)
makedepends=('libarchive')
provides=("minke=${pkgver}")
conflicts=('minke')
options=('!debug' '!strip')

_deb="Minke-linux-x64-${pkgver}.deb"
source=("${_deb}::https://github.com/lencx/Minke/releases/download/v${pkgver}/Minke-linux-x64.deb")
noextract=("${_deb}")
sha256sums=('5d1a55b984c591f396b5a41e23786ea9ca05f20b3faab405de073378e42265f9')

package() {
  local data_archive

  data_archive="$(bsdtar -tf "${srcdir}/${_deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    error "Could not find data.tar.* in ${_deb}"
    return 1
  fi

  bsdtar -xOf "${srcdir}/${_deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # Restore the Chromium sandbox setuid bit (lost when extracting as non-root).
  chmod 4755 "${pkgdir}/usr/lib/minke/chrome-sandbox"

  # Debian packaging metadata is not used on Arch Linux.
  rm -r "${pkgdir}/usr/share/lintian"
}
