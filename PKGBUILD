# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=hunk
pkgname=hunk-bin
pkgver=0.12.0
pkgrel=2
pkgdesc="Review-first terminal diff viewer for agentic coders"
arch=('x86_64' 'aarch64')
url="https://github.com/modem-dev/hunk"
license=('MIT')
depends=('glibc')
provides=('hunk')
conflicts=('hunk' 'hunk-git' 'hunkdiff')
options=('!strip')
source=(
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
  "SKILL-${pkgver}.md::${url}/raw/v${pkgver}/skills/hunk-review/SKILL.md"
)
source_x86_64=("hunkdiff-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/hunkdiff-linux-x64.tar.gz")
source_aarch64=("hunkdiff-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/hunkdiff-linux-arm64.tar.gz")
sha256sums=('e9a844c47847aacdcb894aed09ae6359f7b4fa85895a9b78edb5864b8bfef439' '356b85488dbee34ef1134b4f89ef39aec5b787fdf739dd8eea368a7d137f8c49')
sha256sums_x86_64=('a7e350b2c52be069063a4a14f64838f26f933dec547f75ba2d8aee35d825b1db')
sha256sums_aarch64=('5de8ed2751b7a631db35643148bf810ab89b1dc35adfdb06cc1bf2daa7372654')

latestver() {
  curl -s "https://api.github.com/repos/modem-dev/hunk/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  local _libdir="${pkgdir}/usr/lib/hunkdiff"

  # The bundled `hunk skill path` command walks up the ancestors of the
  # binary's resolved exec path looking for `skills/hunk-review/SKILL.md`,
  # so we install both side-by-side under /usr/lib/hunkdiff and expose the
  # binary on PATH via a symlink in /usr/bin.
  if [[ "${CARCH}" == "x86_64" ]]; then
    install -Dm755 "hunkdiff-linux-x64/hunk" "${_libdir}/${_pkgname}"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    install -Dm755 "hunkdiff-linux-arm64/hunk" "${_libdir}/${_pkgname}"
  fi

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/hunkdiff/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "SKILL-${pkgver}.md" "${_libdir}/skills/hunk-review/SKILL.md"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
