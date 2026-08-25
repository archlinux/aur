# Maintainer: czyt <czytcn@gmail.com>

pkgname=cherry-studio-desktop-bin
pkgver=2.0.9
pkgrel=1
pkgdesc="AI productivity studio with smart chat, autonomous agents, and 300+ assistants"
arch=('x86_64' 'aarch64')
url="https://cherryai.com"
license=('custom')

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
  'libayatana-appindicator: system tray integration'
  'ollama: use local LLMs'
)
makedepends=('libarchive')
provides=("cherry-studio=${pkgver}")
conflicts=(
  'cherry-studio'
  'cherry-studio-bin'
  'cherry-studio-electron-bin'
  'cherry-studio-git'
  'cherry-studio-git-c'
)
options=('!debug' '!strip')

_deb_x86_64="Cherry-Studio-${pkgver}-amd64.deb"
_deb_aarch64="Cherry-Studio-${pkgver}-arm64.deb"
source_x86_64=(
  "${_deb_x86_64}::https://github.com/CherryHQ/cherry-studio/releases/download/v${pkgver}/${_deb_x86_64}"
)
source_aarch64=(
  "${_deb_aarch64}::https://github.com/CherryHQ/cherry-studio/releases/download/v${pkgver}/${_deb_aarch64}"
)
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('015dc6b548a1113424c60cb8c86ada5c033e63c964c04dde1f93751facb758d2')
sha256sums_aarch64=('bcf2eaf1f64ce006766212435b8368a4419f3856a8a50bf4669517793fe027ca')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"
  local data_archive

  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    error "Could not find data.tar.* in ${deb}"
    return 1
  fi

  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/opt/Cherry Studio/CherryStudio' "${pkgdir}/usr/bin/CherryStudio"

  # Keep the Chromium sandbox fallback used by the upstream Electron package.
  chmod 4755 "${pkgdir}/opt/Cherry Studio/chrome-sandbox"

  install -Dm644 \
    "${pkgdir}/opt/Cherry Studio/resources/app.asar.unpacked/resources/cherry-studio/license.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"

  # Debian package metadata is not used on Arch Linux.
  rm -r "${pkgdir}/usr/share/doc"
}
