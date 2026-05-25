# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codex-plus-plus
pkgver=1.1.7
pkgrel=2
pkgdesc='Codex++ auto-injector bridge for openai-codex-desktop'
arch=('x86_64')
url='https://github.com/BigPizzaV3/CodexPlusPlus'
license=('MIT')
options=('!lto')
depends=(
  'bash'
  'openai-codex-desktop'
  'python'
)
makedepends=(
  'cargo'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BigPizzaV3/CodexPlusPlus/archive/refs/tags/v1.1.7.tar.gz"
  'codex-desktop-app-wrapper.sh'
  'codex-plus-plus.sh'
  '90-codex-plus-plus-reapply.hook'
)
sha256sums=(
  '7c804f8b5788866fa150ef62b9ec829f8d45af30ad2d3cbd0b8b43a9cd858537'
  '7d8175ab7cb40a919b6fbd58c5b42d912330aa97967544ba2b311bb10e94139b'
  '0ff9eda5aa0df8f002bc257beaa30118676a6a6f80ef2e637126299ec55a430e'
  '187f5bada32771e5197506208c362778e98fa63fd6e13151e7675047932172a9'
)

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
  ln -s /usr/bin/codex-plus-plus \
    "${pkgdir}/usr/lib/${pkgname}/bin/codex-desktop-injected"
  ln -s codex-plus-plus "${pkgdir}/usr/bin/codexplusplus"

  install -Dm644 "${srcdir}/90-codex-plus-plus-reapply.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-codex-plus-plus-reapply.hook"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
