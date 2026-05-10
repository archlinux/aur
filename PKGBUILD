# Maintainer: Wenxuan Shen <bushigemen114@gmail.com>

pkgname=statusinsights-client
_srcname=StatusInsights-Client
pkgver=1.0.0
pkgrel=3
pkgdesc='Desktop app for StatusInsights built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/xuanxuan1231/StatusInsights-Client'
license=('MIT')
options=('!debug')
depends=(
  'gtk3'
  'libayatana-appindicator'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'pkgconf'
  'flutter'
)
source=(
  "git+${url}.git#tag=v${pkgver}"
  "${pkgname}.desktop"
)
sha256sums=(
  'SKIP'
  '55eb6e8fb78e0c9f04f192d7e204c2587df870983f0116aef7df2216d6da980b'
)

build() {
  cd "${srcdir}/${_srcname}"
  flutter pub get
  flutter gen-l10n
  flutter build linux --release
}

package() {
  cd "${srcdir}/${_srcname}"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a build/linux/x64/release/bundle/. "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
cat > "${pkgdir}/usr/bin/${pkgname}" <<'LAUNCHER'
#!/usr/bin/env sh
exec /opt/statusinsights-client/StatusInsights "$@"
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 linux/packaging/statusinsights.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
