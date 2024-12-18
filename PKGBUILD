# Maintainer:  dreieck
# Contributor: Karim Abou Zeid <karim23697 at gmail dot tld>

_pkgbase="nonicons"
pkgbase="${_pkgbase}-bin-git"
pkgname=(
  "${_pkgbase}-license-git"
  "${_pkgbase}-doc-git"
  "ttf-${pkgbase}"
  "woff-${pkgbase}"
)
pkgver=r68.20241213.5f56cf0
pkgrel=1
pkgdesc="A next-generation icon set for developers that extends octicons."
arch=("any")
url="https://github.com/yamatsum/nonicons"
license=('MIT')
makedepends=('git')
source=(
  "${_pkgbase}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgbase}"
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package_nonicons-license-git() {
  optdepends=(
    "ttf-nonicons: TTF font this license is for."
    "woff-nonicons: WOFF font this license is for."
  )
  provides=(
    "nonicons-license"
  )
  conflicts=(
    "nonicons-license"
  )

  install -Dvm644 "${srcdir}/${_pkgbase}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgbase}/"
}

package_nonicons-doc-git() {
  optdepends=(
    "ttf-nonicons: TTF font this documentation is for."
    "woff-nonicons: WOFF font this documentation is for."
  )
  provides=(
    "nonicons-doc"
  )
  conflicts=(
    "nonicons-doc"
  )

  cd "${srcdir}/${_pkgbase}"

  install -Dvm644 README.md dist/{nonicons.html,nonicons.css} "${srcdir}/git.log" -t "${pkgdir}/usr/share/doc/${_pkgbase}/"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-nonicons-bin-git() {
  depends=(
    "nonicons-license"
  )
  optdepends=(
    "nonicons-doc: For information files about nonicons."
  )
  provides=(
    "ttf-nonicons"
    "nonicons-git=${pkgver}"
  )
  conflicts=(
    "ttf-nonicons"
    "nonicons-git"
  )
  replaces=(
    "nonicons-git<=r67.8454b3b"
  )

  cd "${srcdir}/${_pkgbase}"

  install -Dvm644 "dist/nonicons.ttf" -t "$pkgdir/usr/share/fonts/nonicons"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff-nonicons-bin-git() {
  depends=(
    "nonicons-license"
  )
  optdepends=(
    "nonicons-doc: For information files about nonicons."
  )
  provides=(
    "woff-nonicons"
  )
  conflicts=(
    "woff-nonicons"
  )

  cd "${srcdir}/${_pkgbase}"

  install -Dvm644 "dist/nonicons.woff" -t "$pkgdir/usr/share/fonts/nonicons"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
