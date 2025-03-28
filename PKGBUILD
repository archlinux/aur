# Mantainer: Daniele Basso <d dot bass05 at pm dot me>
# Contributor: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz

pkgname=lando
pkgver=3.24.3
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
sha256sums=('0390d33a1c50adb0aaba376ddc8f24ceb86b6b22891d160af91babb91584b15e')
conflicts=("lando-git")
provides=("lando")

# strip breaks executable
options=(!strip)

build() {
  cd "${srcdir}/$pkgname-core" || exit

  npm clean-install --prefer-offline --frozen-lockfile --omit=dev
  # scripts/fatcore-install.sh

  mkdir -p ./dist/@lando
  npx @yao-pkg/pkg --config package.json --target node20 --compress GZip --options dns-result-order=ipv4first bin/lando
}

package() {
  cd "${srcdir}/$pkgname-core" || exit
  install -D -m 755 "dist/@lando/core" "${pkgdir}/usr/bin/lando"
}
