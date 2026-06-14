# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codex-plus-plus
pkgver=1.2.8
pkgrel=1
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
  "${pkgname}-plugin-unlock.patch"
  "${pkgname}-linux-port-fallback.patch"
  '90-codex-plus-plus-reapply.hook'
)
sha256sums=(
  '56684a24b9d64174efbac97bfd839ddbae75507ae6adeb1fb3e878a28b01f636'
  '7543fe883622c00467cf457e67c7d0fc0b5db9b639472a66dcb9d6a385f788db'
  '2669ce573262d96ea38f085280899e729bc8b542890c6bbdb01e23853e2cd661'
  '4097d1937593ca1e2e5dcf3bbed65f85a2cb066e4d336ad286061a822aacfd8e'
  'f817b382ad3ca0c3a000d8d476ed27ebde13e7a2a027d5b376505bd6db778087'
  'a616b0f24b46b2daf12a0de94cba44178c9a099ec85796d18daace6c8075d8bc'
  '187f5bada32771e5197506208c362778e98fa63fd6e13151e7675047932172a9'
)

prepare() {
  cd "${srcdir}/CodexPlusPlus-${pkgver}"
  patch -Np1 -i "${srcdir}/${pkgname}-plugin-unlock.patch"
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
