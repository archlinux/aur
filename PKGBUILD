# Maintainer: Sivasubramanian Ramanathan <sivasub987@gmail.com>

pkgname=learnharness-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Agent harness for adaptive teaching, practice, and a knowledge graph"
arch=('x86_64')
url="https://learnharness.ai/"
license=('AGPL-3.0-only')
makedepends=('asar')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libgcc'
  'libnotify'
  'libsecret'
  'libstdc++'
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
  'xdg-utils'
)
provides=('learnharness')
conflicts=('learnharness')
options=('!strip' '!debug')
source=(
  "learnharness-${pkgver}.svg::https://raw.githubusercontent.com/amosblomqvist/learnharness/v${pkgver}/build/icon-flat.svg"
  'disable-auto-update.patch'
)
source_x86_64=("learnharness-${pkgver}.deb::https://github.com/amosblomqvist/learnharness/releases/download/v${pkgver}/LearnHarness-${pkgver}-amd64.deb")
sha256sums=(
  '6cf253fe5b5dcc88329faa24391249b996518ed6ba394980da945981b2981927'
  '2fd7cbcc049d2af339f79d83df49cf852581b29793a58fab535fc449759017ad'
)
sha256sums_x86_64=('0ccf2276043fc3ca4b969ea13c428992cc35165198473864bf6e86ee2c5178a7')

package() {
  local resources="${pkgdir}/opt/LearnHarness/resources"
  local standalone="${resources}/server/standalone"
  local asar_tree="${srcdir}/app-asar"

  bsdtar -xf "${srcdir}/learnharness-${pkgver}.deb" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Arch is glibc-only; remove the bundled musl build and non-English Electron
  # locales from this English-only application.
  rm -rf \
    "${standalone}/node_modules/@img/sharp-linuxmusl-x64" \
    "${standalone}/node_modules/@img/sharp-libvips-linuxmusl-x64"
  find "${pkgdir}/opt/LearnHarness/locales" -type f \
    ! -name 'en-US.pak' ! -name 'en-GB.pak' -delete

  # Pacman owns upgrades. Patch the shell so it does not download or attempt to
  # install upstream Debian packages, then remove the now-unused update feed.
  rm -rf "${asar_tree}" "${srcdir}/app.asar"
  asar extract "${resources}/app.asar" "${asar_tree}"
  patch -d "${asar_tree}" -Np1 < "${srcdir}/disable-auto-update.patch"
  asar pack "${asar_tree}" "${srcdir}/app.asar"
  install -m644 "${srcdir}/app.asar" "${resources}/app.asar"
  rm -rf "${asar_tree}" "${srcdir}/app.asar"
  rm -f "${resources}/app-update.yml"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/LearnHarness/learnharness "${pkgdir}/usr/bin/learnharness"

  sed -i 's|^Exec=/opt/LearnHarness/learnharness|Exec=/usr/bin/learnharness|' \
    "${pkgdir}/usr/share/applications/learnharness.desktop"
  install -Dm644 "${srcdir}/learnharness-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/learnharness.svg"

  install -Dm644 "${standalone}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
