# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codex-plus-plus
pkgver=1.2.41
pkgrel=5
epoch=1
pkgdesc='Codex++ manual injection bridge for openai-codex-desktop'
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
  'codex-plus-plus.desktop'
)
sha256sums=(
  '831326ed17dbfd9f97c0f04a0a5494f4b7b619d09b97483fca41b3754f938141'
  '417e7417a00b0a4bca6febe23e0549a91c597856b7b190a8b8492abdeb5075df'
  '2669ce573262d96ea38f085280899e729bc8b542890c6bbdb01e23853e2cd661'
  '4097d1937593ca1e2e5dcf3bbed65f85a2cb066e4d336ad286061a822aacfd8e'
  '29ce576c8bf9fdc9c0082c7380f7b0d3aaec630d835aa981ab4ac888d1251ed1'
  '187f5bada32771e5197506208c362778e98fa63fd6e13151e7675047932172a9'
  'edcfffcf75f9aad5f4c4a7daa747d67e6e0712b44be52d1f38f603468bb3a86f'
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
  install -Dm644 "${srcdir}/codex-plus-plus.desktop" \
    "${pkgdir}/usr/share/applications/codex-plus-plus.desktop"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
