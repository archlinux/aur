# Maintainer: robertfoster
pkgname=openspec
pkgver=1.0.0 # renovate: datasource=github-tags depName=Fission-AI/OpenSpec
pkgrel=1
pkgdesc="AI-native system for spec-driven development"
arch=('any')
url="https://github.com/Fission-AI/OpenSpec"
license=('MIT')
depends=('nodejs')
makedepends=('pnpm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Fission-AI/OpenSpec/archive/v${pkgver}.tar.gz")
sha256sums=('1371bb132f17be1f6ce2e3ec3ed1ac10bb1174aa0e8dcf1f6c74b481fefedbfc')

prepare() {
  cd "${srcdir}/OpenSpec-${pkgver}"
  # Install dependencies without building yet
  pnpm install --no-frozen-lockfile
}

build() {
  cd "${srcdir}/OpenSpec-${pkgver}"
  # Run the build script to compile TypeScript
  pnpm run build
}

package() {
  cd "${srcdir}/OpenSpec-${pkgver}"

  # Create directories
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"

  # Install application files - include node_modules for runtime dependencies
  cp -r dist bin node_modules package.json README.md LICENSE "${pkgdir}/usr/lib/${pkgname}/"

  # Install the CLI executable
  install -Dm755 "bin/openspec.js" "${pkgdir}/usr/lib/${pkgname}/bin/openspec.js"

  # Create symlink for the CLI
  ln -sf "/usr/lib/${pkgname}/bin/openspec.js" "${pkgdir}/usr/bin/openspec"
}
