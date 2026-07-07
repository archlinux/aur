# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codex-plus-plus
pkgver=1.2.32
pkgrel=1
epoch=1
pkgdesc='Codex++ auto-injector bridge for openai-codex-desktop'
arch=('x86_64')
url='https://github.com/BigPizzaV3/CodexPlusPlus'
license=('MIT')
options=('!lto')
depends=(
  'bash'
  'openai-codex-desktop'
  'procps-ng'
  'python'
)
makedepends=(
  'cargo'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BigPizzaV3/CodexPlusPlus/archive/refs/tags/v${pkgver}.tar.gz"
  'codex-desktop-app-wrapper.sh'
  'codex-plus-plus.sh'
  'plugin-auth-unlocked.js'
  "${pkgname}-linux-port-fallback.patch"
  '90-codex-plus-plus-reapply.hook'
)
sha256sums=(
  '43eaba8081b4a58e6f4580e1a5134b7a2ff493cd202fb933c23bff7d43610de2'
  '0f45cd59ba6d0964d783cc37fc185aeaaa50cc5bdef8a027a6ca2e0e82c03619'
  '2669ce573262d96ea38f085280899e729bc8b542890c6bbdb01e23853e2cd661'
  '4097d1937593ca1e2e5dcf3bbed65f85a2cb066e4d336ad286061a822aacfd8e'
  '619db99ea1e3117ec4d6db686ce3f981fffd1adccaa7a1d55d4d9ad2646a3513'
  '187f5bada32771e5197506208c362778e98fa63fd6e13151e7675047932172a9'
)

prepare() {
  cd "${srcdir}/CodexPlusPlus-${pkgver}"
  patch -Np1 -i "${srcdir}/${pkgname}-linux-port-fallback.patch"
}

build() {
  cd "${srcdir}/CodexPlusPlus-${pkgver}"
  cargo build --release --locked -p codex-plus-launcher
}

package() {
  cd "${srcdir}/CodexPlusPlus-${pkgver}"

  install -dm755 \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/${pkgname}/app" \
    "${pkgdir}/usr/lib/${pkgname}/bin" \
    "${pkgdir}/usr/lib/${pkgname}/upstream" \
    "${pkgdir}/usr/lib/${pkgname}/webview" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/libalpm/hooks" \
    "${pkgdir}/var/lib/${pkgname}"

  install -Dm755 "${srcdir}/codex-desktop-app-wrapper.sh" \
    "${pkgdir}/usr/lib/${pkgname}/app/codex"
  ln -s codex "${pkgdir}/usr/lib/${pkgname}/app/codex.exe"

  install -Dm755 "target/release/codex-plus-plus" \
    "${pkgdir}/usr/lib/${pkgname}/bin/codex-plus-plus-upstream"
  install -Dm755 "${srcdir}/codex-plus-plus.sh" \
    "${pkgdir}/usr/bin/codex-plus-plus"
  install -Dm644 "${srcdir}/plugin-auth-unlocked.js" \
    "${pkgdir}/usr/lib/${pkgname}/webview/plugin-auth-unlocked.js"
  ln -s /usr/bin/codex-plus-plus \
    "${pkgdir}/usr/lib/${pkgname}/bin/codex-desktop-injected"
  ln -s codex-plus-plus "${pkgdir}/usr/bin/codexplusplus"

  install -Dm644 "${srcdir}/90-codex-plus-plus-reapply.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-codex-plus-plus-reapply.hook"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
