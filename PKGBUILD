# Maintainer: Bink

pkgname=signal-desktop-git
_pkgname=Signal-Desktop
pkgver=7.89.0.alpha.1.r23.g753766e4de
pkgrel=1
pkgdesc="Signal Private Messenger for Linux"
license=('AGPL-3.0-only')
arch=('x86_64')
url="https://signal.org"
provides=('signal-desktop')
conflicts=('signal-desktop')
depends=(
  'alsa-lib' 'libasound.so'
  'at-spi2-core' 'libatk-bridge-2.0.so'
  'cairo' 'libcairo.so'
  'dbus' 'libdbus-1.so'
  'expat' 'libexpat.so'
  'gcc-libs'
  'glib2' 'libgio-2.0.so'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libnotify'
  'libpulse'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon' 'libxkbcommon.so'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango' 'libpango-1.0.so'
  'systemd-libs' 'libudev.so'
)
makedepends=(
  'git'
  'git-lfs'
  'libxcrypt-compat'
  'node-gyp'
  'nodejs'
  'pnpm'
  'python'
  'jq'
)
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
source=(
  "git+https://github.com/signalapp/${_pkgname}.git"
  "${_pkgname,,}.desktop"
)
sha256sums=('SKIP'
            'bf388df4b5bbcab5559ebbf220ed4748ed21b057f24b5ff46684e3fe6e88ccce')
b2sums=('SKIP'
        'ffb8f7bab4fd84aacf13e7b6d2835daf449b6650b4b3fa723456792ba7fb6cae352928fea11cb030510d558ce30036ff5a1513444f067b94c7fff0158b4f2265')

pkgver() {
  # Grab version from package.json and append revisions since and last git commit_hash.
  cd "${_pkgname}"
  version=$(jq -r '.version' package.json 2>/dev/null | tr '-' '.')
  commit_hash=$(git rev-parse --short HEAD 2>/dev/null)
  latest_tag=$(git tag --sort=-v:refname | head -n1 2>/dev/null)
  commits_ahead=$( [[ -n "$latest_tag" ]] && git rev-list --count HEAD --not "$latest_tag" || echo 0 )
  [[ -n "$version" ]] && [[ -n "$commit_hash" ]] && echo "${version}.r${commits_ahead}.g${commit_hash}" || echo "unknown"
}

prepare() {
  cd "${_pkgname}"

  # git-lfs hook needs to be installed for one of the dependencies
  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  # Install dependencies for sticker-creator
  pnpm install --dir sticker-creator

  # Install dependencies for signal-desktop
  pnpm install
}

build() {
  cd "${_pkgname}"

  # Build the sticker creator
  pnpm --prefix ./sticker-creator/ run build

  # Build signal-desktop
  pnpm run build
}

package() {
  cd "${_pkgname}"

  install -d "${pkgdir}/usr/"{lib,bin}
  cp -a release/linux-unpacked "${pkgdir}/usr/lib/${_pkgname,,}"
  ln -s "/usr/lib/${_pkgname,,}/${_pkgname,,}" "${pkgdir}/usr/bin/"
  chmod u+s "${pkgdir}/usr/lib/${_pkgname,,}/chrome-sandbox"

  install -Dm 644 "../${_pkgname,,}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname,,}.png"
  done
}
