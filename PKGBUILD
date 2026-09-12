# Maintainer: chen-shuhan <2502820816@qq.com>
# Maintainer: asystech-chen <https://github.com/asystech-chen/Vantage>
# 非官方社区打包
pkgname=vantage-browser
pkgver=153.2.0
pkgrel=1
pkgdesc="Vantage 浏览器 - 基于 Firefox ESR 的隐私/快速/易用定制版 (编译安装) - 非官方社区打包"
arch=('x86_64' 'aarch64')
url="https://github.com/asystech-chen/Vantage"
license=('MPL-2.0')
depends=(
  dbus
  alsa-lib
  at-spi2-core
  cairo
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  git
  cbindgen
  clang
  diffutils
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  python-setuptools
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  yasm
  zip
  binutils
)
optdepends=(
  'hunspell-dictionary: Spell checking'
  'libnotify: Notification integration'
  'networkmanager: Location detection via WiFi'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
provides=('vantage-browser')
conflicts=('vantage-browser' 'vantage-browser-bin' 'vantage-browser-appimage')
source=("git+https://github.com/asystech-chen/Vantage.git#tag=v${pkgver}-${pkgrel}")
sha256sums=('SKIP')

build() {
  cd Vantage
  # 参考上游文档 手动编译（README.md#手动编译 / Makefile）
  # 不使用 build.sh，改用官方文档的 MOZCONFIG + make 流程：
  #   MOZCONFIG=$(pwd)/assets/mozconfig.new make build  (x86_64, 对应文档的 mozconfig.linux-x86_64)
  #   MOZCONFIG=$(pwd)/assets/mozconfig.linux-arm64 make build  (aarch64)
  #   MOZCONFIG=$(pwd)/assets/mozconfig.linux-loong64 make build  (loong64，见 docs/LOONG64-CROSS-COMPILE.md)
  if [ "$CARCH" = "aarch64" ]; then
    _mozconfig="assets/mozconfig.linux-arm64"
  else
    _mozconfig="assets/mozconfig.new"
  fi
  # 1. 准备源码：解压 Firefox 源码并应用 Vantage 补丁（Makefile:dir）
  make dir
  # 2. 编译（约 1–3 小时，参考 README 手动编译章节）
  MOZCONFIG="$PWD/$_mozconfig" make build
  # 3. 打包（Makefile:package，生成 .tar.xz）
  make package
}

package() {
  cd Vantage
  # 上游 make package 会在根目录生成 dist 产物，取其打包结果安装
  # 查找生成的 tar.xz（linux 打包）
  _pkg=$(ls vantage-*.linux-*.tar.xz 2>/dev/null | head -1)
  if [ -z "$_pkg" ]; then
    # 回退：直接从 librewolf-* 目录安装
    _pkgdir=$(find . -maxdepth 1 -type d -name "librewolf-*" | head -1)
    if [ -n "$_pkgdir" ] && [ -d "$_pkgdir/dist" ]; then
      _pkgdir="$_pkgdir/dist"
    else
      _pkgdir="Vantage/dist"
    fi
    mkdir -p "$pkgdir/usr/lib"
    cp -a "$_pkgdir" "$pkgdir/usr/lib/vantage" 2>/dev/null || cp -a librewolf-*/dist/* "$pkgdir/usr/lib/vantage/" 2>/dev/null || true
  else
    mkdir -p "$pkgdir/usr/lib"
    bsdtar -xf "$_pkg" -C "$pkgdir/usr/lib"
    # 解压后通常为 vantage 目录，重命名
    if [ -d "$pkgdir/usr/lib/vantage" ]; then
      :
    else
      _extracted=$(ls "$pkgdir/usr/lib" | head -1)
      mv "$pkgdir/usr/lib/$_extracted" "$pkgdir/usr/lib/vantage" 2>/dev/null || true
    fi
  fi

  # 安装桌面文件与图标（若源码中存在）
  if [ -f "browser/branding/vantage/default16.png" ]; then
    install -Dm644 browser/branding/vantage/default16.png "$pkgdir/usr/share/pixmaps/vantage.png"
  fi
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/vantage.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Vantage
GenericName=Web Browser
Comment=Vantage Browser - Privacy, Fast, Easy
Exec=/usr/lib/vantage/vantage %u
Icon=vantage
Terminal=false
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
DESKTOP

  # 符号链接
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/lib/vantage/vantage "$pkgdir/usr/bin/vantage"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
