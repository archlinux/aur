# Maintainer: imsyy <imsyy1024@gmail.com>
pkgname=splayer-next-unofficial_build
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern cross-platform music player built with Electron, Vue 3, and TypeScript (unofficial build)"
arch=('x86_64')
url="https://splayer.imsyy.top"
license=('AGPL-3.0')
depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify'
  'libappindicator-gtk3'
)
makedepends=(
  'git'
  'nodejs>=22'
  'pnpm>=10'
  'rust'
  'cargo'
  'npm'
)
options=(!strip)
source=("splayer-next::git+https://github.com/SPlayer-Dev/SPlayer-Next.git")
sha256sums=('SKIP')

pkgver() {
  cd "splayer-next"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g' || echo "1.0.0"
}

prepare() {
  cd "splayer-next"
  export HOME="$srcdir"
  corepack enable
  pnpm install --frozen-lockfile
}

build() {
  cd "splayer-next"
  export HOME="$srcdir"
  pnpm build:native
  pnpm typecheck
  pnpm electron-vite build
  pnpm electron-builder --config electron-builder.config.ts --dir --linux
}

package() {
  cd "splayer-next"

  install -d "$pkgdir/opt/splayer-next"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/splayer-next/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/splayer-next/SPlayer-Next" "$pkgdir/usr/bin/splayer-next"

  install -d "$pkgdir/usr/share/applications"
  install -Dm644 dist/linux-unpacked/splayer-next.desktop "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/share/icons"
  cp -r dist/linux-unpacked/resources/public/icons/* "$pkgdir/usr/share/icons/" 2>/dev/null || true
  install -Dm644 public/icons/favicon-512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/splayer-next.png"
}
