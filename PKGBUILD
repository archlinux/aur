# Mantainer: Daniele Basso <d dot bass05 at pm dot me>
# Contributor: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz

pkgname=lando
pkgver=3.23.26
_target_version=${pkgver//_/-}
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'git' 'nodejs')
source=("${pkgname}-core::git+https://github.com/lando/core.git#tag=v${_target_version}")
sha256sums=('74d417eb38b31fc4efb72e8ce2db01647a60a24c528114e88c2188c38242bfcd')
conflicts=("lando-git")
provides=("lando")

# strip breaks executable
options=(!strip)

build() {
  cd "${srcdir}/$pkgname-core" || exit

  npm clean-install --prefer-offline --frozen-lockfile --omit=dev
  # scripts/fatcore-install.sh

  npx @yao-pkg/pkg --config package.json --target node20 --options dns-result-order=ipv4first bin/lando
}

package() {
  cd "${srcdir}/$pkgname-core" || exit
  install -D -m 755 "dist/@lando/core" "${pkgdir}/usr/bin/lando"
}
