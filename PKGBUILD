pkgname=pele-git
pkgver=1.13.0.r0.g3a2f075
pkgrel=1
pkgdesc="Fast, lightweight Mermaid renderer that outputs themeable SVG (Git version)"
arch=('any')
url="https://github.com/obsidianmd/pele"
license=('MIT')
depends=('nodejs>=20')
makedepends=('git' 'npm')
provides=("pele=${pkgver}")
conflicts=('pele')
source=("pele::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd pele
  git describe --long --tags --match '[0-9]*' --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pele
  npm ci --cache "${srcdir}/npm-cache" --no-audit --no-fund
}

build() {
  cd pele
  npm run build
}

package() {
  local module_dir="${pkgdir}/usr/lib/node_modules/pele"

  cd pele
  install -d "${module_dir}"
  cp -r dist package.json LICENSE "${module_dir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
