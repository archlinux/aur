pkgname=forgecode-fish-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc='Fish-shell plugin for Forge colon-command workflows (git HEAD)'
arch=('any')
url='https://github.com/OneNoted/forgecode.fish'
license=('Apache-2.0')
depends=('fish' 'fzf')
makedepends=('git')
optdepends=(
  'fd: preferred file discovery backend for @ file completion'
  'forge: required Forge CLI backend'
)
provides=('forgecode-fish')
conflicts=('forgecode-fish')
source=(
  'git+https://github.com/OneNoted/forgecode.fish.git'
)
sha256sums=('SKIP')

pkgver() {
  cd forgecode.fish
  printf '0.0.0.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd forgecode.fish

  install -dm755 \
    "${pkgdir}/usr/share/fish/vendor_conf.d" \
    "${pkgdir}/usr/share/fish/vendor_functions.d" \
    "${pkgdir}/usr/share/fish/vendor_completions.d" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 conf.d/forgecode.fish \
    "${pkgdir}/usr/share/fish/vendor_conf.d/forgecode.fish"
  install -Dm644 completions/forge.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/forge.fish"

  local fn
  for fn in functions/*.fish; do
    install -Dm644 "$fn" "${pkgdir}/usr/share/fish/vendor_functions.d/$(basename "$fn")"
  done

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local doc
  for doc in docs/*.md; do
    install -Dm644 "$doc" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "$doc")"
  done
}
