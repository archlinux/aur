# Mantainer: Daniele Basso <d dot bass05 at pm dot me>
# Contributor: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz

_pkgname=lando
pkgname=lando-beta
_pkgver=3.24.0
_beta=12
pkgver=${_pkgver}.b${_beta}
_target_version=${_pkgver}-beta.${_beta}
pkgrel=2
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'git' 'nodejs')
source=("${_pkgname}-core::git+https://github.com/lando/core.git#tag=v${_target_version}")
sha256sums=('ea318069a0f1fb6224b08801322c92c88dbdb1e7560ed598eeaa1291e1a5bf47')
conflicts=("lando")
provides=("lando")

# strip breaks executable
options=(!strip)

build() {
  cd "${srcdir}/$_pkgname-core" || exit

  npm clean-install --prefer-offline --frozen-lockfile --omit=dev
  # scripts/fatcore-install.sh

  mkdir -p ./dist/@lando
  npx @yao-pkg/pkg --config package.json --target node22 --compress GZip --options dns-result-order=ipv4first bin/lando
}

package() {
  cd "${srcdir}/$_pkgname-core" || exit
  install -D -m 755 "dist/@lando/core" "${pkgdir}/usr/bin/lando"
}
