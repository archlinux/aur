# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codex-plus-plus
pkgver=1.2.47
pkgrel=2
epoch=1
pkgdesc='Codex++ manual injection bridge for the ChatGPT desktop app'
arch=('x86_64')
url='https://github.com/BigPizzaV3/CodexPlusPlus'
license=('MIT')
options=('!lto')
depends=(
  'bash'
  'chatgpt-desktop'
  'procps-ng'
)
makedepends=(
  'cargo'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BigPizzaV3/CodexPlusPlus/archive/refs/tags/v${pkgver}.tar.gz"
  'codex-desktop-app-wrapper.sh'
  'codex-plus-plus.sh'
  "${pkgname}-linux-port-fallback.patch"
  '90-codex-plus-plus-reapply.hook'
  'codex-plus-plus.desktop'
)
sha256sums=(
  '9dcb66623d0a58950767708e192960699677ccda038faee58464357944068e3d'
  '816150af2d433113a6119d79c0564790e953d9d97af55aa6a545a915ab27b2b8'
  '7692afec19d0b242ede3b80acddd1787bbecdfcbc216058eabc2b1fb92ee7740'
  'e4698bfc87f5ae5b8349389d78b1a627dc9c6b69f39613723f2cd48e0b74875c'
  '390d5c27e972cef07da79b577924311d60afd021c4e195fc0d96aba22c1330fa'
  '4dcb0fe8fddb69957bf493f3b5de0787407b5faad275116790099b12dab09cf1'
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
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/libalpm/hooks" \
    "${pkgdir}/var/lib/${pkgname}"

  install -Dm755 "${srcdir}/codex-desktop-app-wrapper.sh" \
    "${pkgdir}/usr/lib/${pkgname}/app/ChatGPT"
  ln -s ChatGPT "${pkgdir}/usr/lib/${pkgname}/app/Codex"
  ln -s ChatGPT "${pkgdir}/usr/lib/${pkgname}/app/codex"

  install -Dm755 "target/release/codex-plus-plus" \
    "${pkgdir}/usr/lib/${pkgname}/bin/codex-plus-plus-upstream"
  install -Dm755 "${srcdir}/codex-plus-plus.sh" \
    "${pkgdir}/usr/bin/codex-plus-plus"
  ln -s /usr/bin/codex-plus-plus \
    "${pkgdir}/usr/lib/${pkgname}/bin/chatgpt-injected"
  ln -s chatgpt-injected \
    "${pkgdir}/usr/lib/${pkgname}/bin/codex-desktop-injected"
  ln -s codex-plus-plus "${pkgdir}/usr/bin/codexplusplus"

  install -Dm644 "${srcdir}/90-codex-plus-plus-reapply.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-codex-plus-plus-reapply.hook"
  install -Dm644 "${srcdir}/codex-plus-plus.desktop" \
    "${pkgdir}/usr/share/applications/codex-plus-plus.desktop"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
