# Maintainer: xmengnet <my@liyp.cc>

pkgname=videodown
pkgver=1.0.0_alpha.3
pkgrel=1
pkgdesc='哔哩哔哩、抖音、YouTube 视频下载工具（MyGo/MujicaUI 原生界面）'
arch=('x86_64' 'aarch64')
url='https://github.com/kamiertop/videodown'
license=('GPL-3.0-only')
depends=('gtk3' 'libayatana-appindicator' 'ffmpeg')
optdepends=('xdg-utils: 在文件管理器中打开下载目录')
makedepends=('go>=1.27.3' 'git')
options=('!debug')

# pkgver 不允许连字符，tag 形如 v1.0.0-alpha.3。
_tag="v${pkgver//_/-}"

source=("git+https://github.com/kamiertop/videodown.git#tag=${_tag}")
sha256sums=('SKIP')

_srcname=videodown

build() {
  cd "${_srcname}"

  export CGO_ENABLED=0

  local _ldflags="-s -w -bindnow -X github.com/kamiertop/videodown/internal/updater.Version=${_tag} -X github.com/kamiertop/videodown/logger.Mode=prod"

  install -d "${srcdir}/bin"
  go build -buildmode=pie -trimpath -buildvcs=false \
    -ldflags "${_ldflags}" -o "${srcdir}/bin/videodown" .
  go build -buildmode=pie -trimpath -buildvcs=false \
    -ldflags "-s -w -bindnow" -o "${srcdir}/bin/videodown-updater" ./cmd/updater
}

package() {
  cd "${_srcname}"

  # 程序默认把配置/历史/日志写在可执行文件旁，/usr/lib 不可写，
  # 因此由启动器用 -data 指向用户可写目录。
  install -Dm755 "${srcdir}/bin/videodown" "${pkgdir}/usr/lib/videodown/videodown"
  install -Dm755 "${srcdir}/bin/videodown-updater" "${pkgdir}/usr/lib/videodown/videodown-updater"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/videodown" <<'EOF'
#!/bin/sh
data="${XDG_DATA_HOME:-$HOME/.local/share}/videodown"
mkdir -p "$data"
exec /usr/lib/videodown/videodown -data "$data" "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/videodown"

  sed -e '/^#/d' \
      -e 's|^Exec=.*|Exec=videodown|' \
      -e 's|^Icon=.*|Icon=videodown|' \
      build/videodown.desktop > videodown.desktop
  install -Dm644 videodown.desktop "${pkgdir}/usr/share/applications/videodown.desktop"

  install -Dm644 build/appicon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/videodown.svg"
  install -Dm644 build/appicon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/videodown.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
