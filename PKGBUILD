pkgname=forgecode-nu-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc='Nushell plugin for Forge colon-command workflows (git HEAD)'
arch=('any')
url='https://github.com/OneNoted/forgecode.nu'
license=('Apache-2.0')
depends=('nushell')
makedepends=('git')
optdepends=(
  'forge: required Forge CLI backend'
)
provides=('forgecode-nu')
conflicts=('forgecode-nu')
source=(
  'git+https://github.com/OneNoted/forgecode.nu.git'
)
sha256sums=('SKIP')

pkgver() {
  cd forgecode.nu
  printf '0.0.0.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd forgecode.nu

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
