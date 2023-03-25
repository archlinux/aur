# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=yacd-git
_pkgname=yacd
pkgver=0.3.8.r24.g2236c0d
pkgrel=1

pkgdesc='Yet Another Clash Dashboard'
arch=('any')
_repo="haishanh/${_pkgname}"
url="https://github.com/${_repo}"
license=('MIT')

makedepends=('git' 'pnpm')
optdepends=('clash: A rule-based tunnel in Go'
            'sing-box: The universal proxy platform')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  "${_pkgname}::git+${url}.git#branch=master"
  "issues#751.patch::https://patch-diff.githubusercontent.com/raw/haishanh/yacd/pull/753.patch"
)
sha256sums=(
  SKIP
  e27451911f48aed1127b1d3baa1d3a9d52ac8c74012a571b5c013f8ca9ed43c8
)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "$_pkgname"
  git am "../issues#751.patch" && pnpm i && pnpm build
}

package() {
  cd "$_pkgname/public"

  find . -type f -exec install -Dm 644 {} "${pkgdir}"/usr/share/"${_pkgname}"/{} \;
}
