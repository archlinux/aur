# Maintainer: Teddy Zhu <teddyzhu15@gmail.com>
pkgname=super-paste-git
pkgver=1.0.0.r98.gf927451
pkgrel=1
pkgdesc='Clipboard manager with local OCR and synchronization (Git version)'
arch=('x86_64')
url='https://github.com/Teddy-Zhu/super_paste_app'
license=('MIT')
depends=('electron44' 'libx11' 'cairo' 'pango' 'libjpeg-turbo' 'giflib' 'librsvg' 'xdg-utils')
makedepends=('git' 'nodejs>=22.14.0' 'pnpm>=11.4.0' 'python' 'rust>=1.88' 'pkgconf')
optdepends=('kwin: active-window detection on KDE Plasma 6 Wayland'
            'xorg-xwayland: panel positioning on Wayland'
            'xdg-desktop-portal: global shortcuts on Wayland'
            'libappindicator-gtk3: tray integration on supported desktops')
provides=("super-paste=${pkgver}")
conflicts=('super-paste' 'super_paste_app' 'super-paste-app')
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf '%s.r%s.g%s' "$(node --input-type=module -e "import { archVersion } from './scripts/prepare-aur.mjs'; console.log(archVersion())")" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  # 单独准备构建工具和原生模块，避免项目 postinstall 下载另一份 Electron。
  pnpm install --frozen-lockfile --ignore-scripts
  pnpm rebuild esbuild
}

build() {
  cd "${srcdir}/${pkgname}"
  local electron_version
  electron_version=$(cat /usr/lib/electron44/version)
  pnpm exec electron-rebuild --force --build-from-source --version "$electron_version" \
    --only 'better-sqlite3,canvas,@paymoapp/active-window'
  pnpm run build
  pnpm exec electron-builder --linux dir \
    --config.electronDist=/usr/lib/electron44 \
    --config.electronVersion="$electron_version" \
    --config.npmRebuild=false
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/lib/super-paste"
  cp -a dist/linux-unpacked/resources/. "${pkgdir}/usr/lib/super-paste/"
  install -Dm755 packaging/arch/super-paste "${pkgdir}/usr/bin/super-paste"
  install -Dm644 packaging/arch/super-paste.desktop \
    "${pkgdir}/usr/share/applications/com.v2dawn.sp.desktop"
  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "build/icon/icons/${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.v2dawn.sp.png"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
