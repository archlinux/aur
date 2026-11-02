# Maintainer: jcj <onlinecloud1 at gmail dot com>

pkgname=pi-gui
pkgver=1.0.1
pkgrel=1
pkgdesc="Electron GUI app for the pi coding agent runtime"
arch=('x86_64')
url='https://github.com/minghinmatthewlam/pi-gui'
license=('MIT')
# Rooted in the author's Debian dependency list (electron-builder.yml) plus
# Electron's usual audio/printing libraries on Arch.
depends=('gtk3' 'nss' 'libnotify' 'libxss' 'libxtst' 'at-spi2-core' \
        'e2fsprogs' 'libsecret' 'mesa' 'xdg-utils' 'alsa-lib' 'libcups')
makedepends=('nodejs>=22' 'pnpm' 'make' 'gcc' 'g++' 'python')
provides=('pi-gui')
conflicts=('pi-gui-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minghinmatthewlam/pi-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('920e110e7876821458fcc2ec3c3cfcaca0486acd5d8bf97c6093860b2b65edb2')

build() {
  cd "${pkgname}-${pkgver}"

  # Keep all package manager / Electron caches inside the build dir so the
  # build never writes to the user's home during makepkg.
  export PNPM_HOME="${srcdir}/.pnpm-home"
  export PNPM_STORE_DIR="${srcdir}/.pnpm-store"
  export ELECTRON_CACHE="${srcdir}/.cache/electron"
  export ELECTRON_BUILDER_CACHE="${srcdir}/.cache/electron-builder"

  # Install dependencies using the lockfile (compiles native deps, e.g. node-pty).
  pnpm install --frozen-lockfile

  # Run the desktop workspace's own Linux packaging script: builds the
  # shared workspaces + electron-vite bundles, then runs
  # electron-builder --linux --dir --publish never. The unpacked Electron
  # app is written to apps/desktop/release/linux-unpacked (see
  # apps/desktop/electron-builder.yml: directories.output=release).
  # Do not use 'pnpm build' at the repo root: it only produces the JS
  # bundles (and the website) and never runs electron-builder, so no
  # compiled Electron binary would exist for package().
  cd apps/desktop
  pnpm run package:linux:dir
}

package() {
  cd "${pkgname}-${pkgver}/apps/desktop/release/linux-unpacked"

  install -dm755 "$pkgdir/opt/pi-gui"
  cp -a . "$pkgdir/opt/pi-gui/"

  # Chrome Sandbox needs the setuid bit for Chromium's sandbox to run
  # without --no-sandbox (extraction drops it).
  install -m4755 chrome-sandbox "$pkgdir/opt/pi-gui/chrome-sandbox"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/pi-gui/pi-gui "$pkgdir/usr/bin/pi-gui"

  # Icon (also shipped as extraResources in the unpacked app)
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/apps/desktop/resources/icon.png" \
    "$pkgdir/usr/share/pixmaps/pi-gui.png"

  # Desktop Entry
  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/pi-gui.desktop" << 'DESKTOP'
[Desktop Entry]
Name=pi-gui
Comment=Desktop shell for pi
Exec=pi-gui
Icon=pi-gui
Terminal=false
Type=Application
Categories=Development;
# Verify with: xprop WM_CLASS (Electron derives it from app name "pi")
StartupWMClass=Pi
DESKTOP

  # License
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
