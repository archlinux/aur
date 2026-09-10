# Maintainer: czyt <czytcn@gmail.com>

pkgname=vlaina-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A purest sanctuary,for your deepest thoughts."
arch=('x86_64' 'aarch64')
url='https://github.com/vladelaina/vlaina'
license=('AGPL-3.0-only')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
  'glibc' 'gtk3' 'libcups' 'libglvnd' 'libnotify' 'libsecret' 'libx11'
  'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango'
  'systemd-libs' 'util-linux-libs' 'xdg-utils'
)
optdepends=('libappindicator-gtk3: system tray icon support')
provides=("vlaina=${pkgver}")
conflicts=('vlaina')
options=('!strip' '!debug')

_deb_x86_64="vlaina-${pkgver}-linux-amd64.deb"
_deb_aarch64="vlaina-${pkgver}-linux-arm64.deb"
source_x86_64=("${_deb_x86_64}::${url}/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::${url}/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('10f3f6b841722c98d047714ac59c1e07a09a810d2d7b929c5d5961efdea25802')
sha256sums_aarch64=('86efc92d5507c4d9c04d4866de7e0cea7874006c9941ba53e141c9d841b1cfeb')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${srcdir}/${!deb_var}"
  local data_member
  data_member=$(bsdtar -tf "${deb}" | sed -n '/^data\.tar\([.].*\)\?$/p')
  test -n "${data_member}"
  bsdtar -xOf "${deb}" "${data_member}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/vlaina/vlaina "${pkgdir}/usr/bin/vlaina"
  chmod 4755 "${pkgdir}/opt/vlaina/chrome-sandbox"
  install -Dm644 "${pkgdir}/opt/vlaina/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  sed -i 's/^MimeType=.*/MimeType=text\/markdown;/' \
    "${pkgdir}/usr/share/applications/vlaina.desktop"
}
