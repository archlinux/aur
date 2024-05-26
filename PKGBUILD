# Maintainer: Object42 <object42 at tutamail.com>
pkgname=ente-desktop-git
_pkg_git_src=https://github.com/ente-io/ente.git
pkgver=1.7.0_rc
pkgrel=2
pkgdesc="Desktop client for (self hosted) Ente server"
arch=(x86_64)
url="https://github.com/ente-io"
license=('AGPL-3.0-only')
depends=(
    'alsa-lib'
    'gtk3'
    'hicolor-icon-theme'
    'nss'
    'nodejs'
)
#optdepends=('')
makedepends=('electron' 'git' 'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin" "${pkgname%-git}-appimage")
#backup=(
#    ""
#)
options=('!debug')
source=(
    "https://raw.githubusercontent.com/ente-io/ente/main/LICENSE"
    "${pkgname%-git}.desktop"
    "self-hosted-ente-README.txt"
)
sha256sums=(
    "0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0"
    "11b041398bd3ebbb3ebe4ba504bb51537043695611ab4e592d153271c0a6e367"
    "293748df64ccf96518efac3aeb3d60ffc04a32ef2a1d0f58e8f439b0a4e51ccc"  
)

pkgver() {
  # obtain package version
  echo "$(grep '"version"' "${srcdir}/${pkgname%-*-*}/desktop/package.json"| sed 's/.*: "\(.*\)".*/\1/'| sed 's/-/_/g')"
}

prepare() {
  # only checkout ente desktop and web directory
  cd "${srcdir}"
  git clone --no-checkout --depth=1 --filter=tree:0 "${_pkg_git_src}"
  cd "${pkgname%-*-*}"
  git sparse-checkout set --no-cone 'desktop' 'web'
  git checkout
  rm -rf "auth"
  git submodule update --init --recursive 'desktop' 'web'
}

build() {
  cd "${srcdir}/${pkgname%-*-*}/desktop"
  yarn install 2>&1 | grep -v 'warning'

  # build ente web as requirement of ente desktopA
  yarn build-renderer 2>&1 | grep -v 'warning'

  # disable telemetry
  cd "${srcdir}/${pkgname%-*-*}/web"
  yarn next telemetry disable
  cd -

  # build ente desktop as directory structure
  yarn build-main --x64 --linux dir

  # cleanup non-linux-x64 objects
  cd "${srcdir}/${pkgname%-*-*}/desktop/dist/linux-unpacked/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/"
  rm -rf darwin win32 linux/arm64
}

package() {
  # install main data
  install -Dm755 -d "${pkgdir}/"{usr/lib/"${pkgname%-*}",usr/bin}
  cp -r "${srcdir}/${pkgname%-*-*}/desktop/dist/linux-unpacked/"* "${pkgdir}/usr/lib/${pkgname%-*}/"
  ln -sf "/usr/lib/${pkgname%-*}/${pkgname%-*-*}" "${pkgdir}/usr/bin/${pkgname%-*}"

  # install README about self-hosted ente ENV
  install -Dvm644 "${srcdir}/self-hosted-ente-README.txt" -t "${pkgdir}/usr/lib/${pkgname%-*}/"

  # install license
  install -Dvm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"

  # install desktop shortcut
  install -Dm644 "${srcdir}/${pkgname%-*}.desktop" -t "${pkgdir}/usr/share/applications/"

  # install icons
  install -Dm644 "${srcdir}/${pkgname%-*-*}/desktop/dist/linux-unpacked/resources/taskbar-icon-Template.png" \
          "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname%-*}.png"
  install -Dm644 "${srcdir}/${pkgname%-*-*}/desktop/dist/linux-unpacked/resources/taskbar-icon-Template@2x.png" \
          "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname%-*}.png"
  install -Dm644 "${srcdir}/${pkgname%-*-*}/desktop/dist/linux-unpacked/resources/taskbar-icon-Template@3x.png" \
          "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname%-*}.png"
  install -Dm644 "${srcdir}/${pkgname%-*-*}/desktop/dist/linux-unpacked/resources/icon.png" \
          "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-*}.png"
}
