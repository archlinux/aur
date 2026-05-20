# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codex-plus-plus
pkgver=1.1.3
pkgrel=1
pkgdesc='Codex++ auto-injector bridge for openai-codex-desktop'
arch=('any')
url='https://github.com/BigPizzaV3/CodexPlusPlus'
license=('NOASSERTION')
depends=(
  'bash'
  'openai-codex-desktop'
  'python'
  'python-requests'
  'python-websocket-client'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BigPizzaV3/CodexPlusPlus/archive/refs/tags/v1.1.3.tar.gz"
  'codex-desktop-app-wrapper.sh'
  'codex-plus-plus-launch.py'
  'codex-plus-plus.sh'
  '90-codex-plus-plus-reapply.hook'
)
sha256sums=(
  '2f0c3b3a3f5cb8770352286837631e9b028bb11d5ea9f19a019463cf4f9e930e'
  '7d8175ab7cb40a919b6fbd58c5b42d912330aa97967544ba2b311bb10e94139b'
  '2a005b347e4d6314cb25a064c63bfe60f4ed3a946b5a0b5b2b853e8c09ec9420'
  'c066bed965a86f533c5a63498a26cd5816d617edd9d7e66a4a3a2aeef3b0b04b'
  '187f5bada32771e5197506208c362778e98fa63fd6e13151e7675047932172a9'
)

build() {
  cd "${srcdir}/CodexPlusPlus-${pkgver}"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/CodexPlusPlus-${pkgver}"

  /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl

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

  install -Dm755 "${srcdir}/codex-plus-plus-launch.py" \
    "${pkgdir}/usr/lib/${pkgname}/bin/codex-plus-plus-launch.py"
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
