# Maintainer: Braulio Oliveira <brauliobo at gmail dot com>

pkgname=alacrium-browser
pkgver=151.0.7922.138
pkgrel=1
pkgdesc='Performance-focused Chromium browser tracking stable releases'
arch=('x86_64')
url='https://github.com/brauliobo/alacrium'
license=('BSD-3-Clause')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'ttf-liberation'
  'vulkan-icd-loader'
  'xdg-utils'
)
makedepends=(
  'bison'
  'clang'
  'flex'
  'git'
  'gperf'
  'java-runtime-headless'
  'lld'
  'nasm'
  'ninja'
  'nodejs'
  'perl'
  'pkgconf'
  'python'
  'rust'
  'unzip'
  'wget'
  'yasm'
)
optdepends=(
  'gnome-keyring: password storage in GNOME'
  'kdialog: native file dialogs in KDE'
  'kwallet: password storage in KDE'
  'pipewire: WebRTC desktop sharing under Wayland'
)
options=('!debug' '!strip')
_commit=126d37eeee0f6cdbd060b695901811e64eb3b039
_depot_tools_commit=7bd73dcd391b3f83437f2bd50724c04044806728
source=(
  "alacrium::git+https://github.com/brauliobo/alacrium.git#commit=${_commit}"
  "depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=${_depot_tools_commit}"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  export HOME="$srcdir"
  export PATH="$srcdir/depot_tools:$PATH"

  cd alacrium
  ./trunk.sh
  ./version.sh
  ./setup.sh
}

build() {
  local jobs

  jobs="$(nproc)"
  if [[ ${MAKEFLAGS:-} =~ -j([0-9]+) ]]; then
    jobs="${BASH_REMATCH[1]}"
  fi

  export HOME="$srcdir"
  export PATH="$srcdir/depot_tools:$PATH"

  cd alacrium
  ./build.sh "$jobs"
}

package() {
  local deb_path="$srcdir/alacrium/chromium/src/out/alacrium/alacrium-browser_${pkgver}_AVX.deb"

  bsdtar -xOf "$deb_path" data.tar.xz | bsdtar -xf - -C "$pkgdir"
  rm -rf "$pkgdir/etc/cron.daily"
  chmod 4755 "$pkgdir/opt/alacrium-browser/chrome-sandbox"
  install -Dm644 "$srcdir/alacrium/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
