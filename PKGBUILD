pkgname=forgecode-nu
pkgver=0.1.0
pkgrel=1
pkgdesc='Nushell plugin for Forge colon-command workflows'
arch=('any')
url='https://github.com/OneNoted/forgecode.nu'
license=('Apache-2.0')
depends=('nushell')
optdepends=(
  'forge: required Forge CLI backend'
)
conflicts=('forgecode-nu-git')
source=(
  "https://github.com/OneNoted/forgecode.nu/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('d60f527516882a148d305e12a451b8448187712cbee58aa65ad901ae34834993')

package() {
  cd "${srcdir}/forgecode.nu-${pkgver}"

  install -dm755 \
    "${pkgdir}/usr/share/nushell/vendor/autoload" \
    "${pkgdir}/usr/share/forgecode.nu/lib/actions" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 forgecode.nu \
    "${pkgdir}/usr/share/forgecode.nu/forgecode.nu"

  local file
  for file in lib/*.nu; do
    install -Dm644 "$file" "${pkgdir}/usr/share/forgecode.nu/${file}"
  done
  for file in lib/actions/*.nu; do
    install -Dm644 "$file" "${pkgdir}/usr/share/forgecode.nu/${file}"
  done

  cat > "${pkgdir}/usr/share/nushell/vendor/autoload/forgecode.nu" <<'SHIM'
use /usr/share/forgecode.nu/forgecode.nu *
SHIM

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local doc
  for doc in docs/*.md; do
    install -Dm644 "$doc" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "$doc")"
  done
}
