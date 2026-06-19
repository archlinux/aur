# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=hunk
pkgname=hunk-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Review-first terminal diff viewer for agentic coders"
arch=('x86_64' 'aarch64')
url="https://github.com/modem-dev/hunk"
license=('MIT')
depends=('glibc')
provides=('hunk')
conflicts=('hunk' 'hunk-git' 'hunkdiff')
options=('!strip')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("hunkdiff-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/hunkdiff-linux-x64.tar.gz")
source_aarch64=("hunkdiff-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/hunkdiff-linux-arm64.tar.gz")
sha256sums=('e9a844c47847aacdcb894aed09ae6359f7b4fa85895a9b78edb5864b8bfef439')
sha256sums_x86_64=('0dd80c7679265df72617877a02dafefd6ac6a834528e10257567642eb2c05ea6')
sha256sums_aarch64=('7e2e64ecdefec7fb024a7772ea0bb620d4014203613e7bd4638043ad6be2eee3')

latestver() {
  curl -s "https://api.github.com/repos/modem-dev/hunk/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  local _libdir="${pkgdir}/usr/lib/hunkdiff"
  local _srcdir

  if [[ "${CARCH}" == "x86_64" ]]; then
    _srcdir="hunkdiff-linux-x64"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    _srcdir="hunkdiff-linux-arm64"
  fi

  # The bundled `hunk skill path` command walks up the ancestors of the
  # binary's resolved exec path looking for `skills/hunk-review/SKILL.md`,
  # so we install both side-by-side under /usr/lib/hunkdiff and expose the
  # binary on PATH via a symlink in /usr/bin.
  install -Dm755 "${_srcdir}/hunk" "${_libdir}/${_pkgname}"
  install -Dm644 "${_srcdir}/skills/hunk-review/SKILL.md" "${_libdir}/skills/hunk-review/SKILL.md"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/hunkdiff/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
