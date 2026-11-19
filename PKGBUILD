# Maintainer: czyt <czytcn@gmail.com>

pkgname=cherry-studio-desktop-bin
pkgver=2.2.3
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

# Upstream switched the Debian assets from -amd64/-arm64 to -linux-x64 and
# -linux-arm64; the payload (opt/Cherry Studio) is unchanged.
_deb_x86_64="Cherry-Studio-${pkgver}-linux-x64.deb"
_deb_aarch64="Cherry-Studio-${pkgver}-linux-arm64.deb"
source_x86_64=(
  "${_deb_x86_64}::https://github.com/CherryHQ/cherry-studio/releases/download/v${pkgver}/${_deb_x86_64}"
)
source_aarch64=(
  "${_deb_aarch64}::https://github.com/CherryHQ/cherry-studio/releases/download/v${pkgver}/${_deb_aarch64}"
)
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('c3b23daed85b081361b04d4e7c3ccacaf0a8b5e87da5ed2b5979c019d09ddc31')
sha256sums_aarch64=('38c0e03457635b852f3aeef4b2ce4e559cd6f0d3536729fc6439584c29c1af83')

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
