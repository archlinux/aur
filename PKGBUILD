# Mantainer: Daniele Basso <d dot bass05 at pm dot me>
# Contributor: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz

pkgname=lando
pkgver=3.21.0
_target_version=${pkgver//_/-}
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'git' 'nodejs-lts-hydrogen')
source=("${pkgname}::git+https://github.com/lando/cli.git#tag=v${_target_version}")
sha256sums=('6277f55042703804510ce8d3d913d1e8014e06404ae572e5309c6d6f91edb81a')
conflicts=("lando-git")
provides=("lando")

# strip breaks executable
options=(!strip)

build() {
  cd "${srcdir}/$pkgname" || exit

  npm clean-install --prefer-offline --frozen-lockfile --omit="dev"
  scripts/fatcore-install.sh

  npm run pkg
}

package() {
  cd "${srcdir}/$pkgname" || exit
  install -D -m 755 "dist/@lando/cli" "${pkgdir}/usr/bin/lando"
}
