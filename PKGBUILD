# Mantainer: Daniele Basso <d dot bass05 at pm dot me>
# Contributor: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz

pkgname=lando
pkgver=3.21.2
_target_version=${pkgver//_/-}
pkgrel=4
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'git' 'nodejs')
source=("${pkgname}::git+https://github.com/lando/cli.git#tag=v${_target_version}")
sha256sums=('15570ce4ffec23cf21559f998facc217bc3c78e65870be8232083f3727c68b44')
conflicts=("lando-git")
provides=("lando")

# strip breaks executable
options=(!strip)

build() {
  cd "${srcdir}/$pkgname" || exit

  npm clean-install --prefer-offline --frozen-lockfile --omit="dev"
  scripts/fatcore-install.sh

  npx @yao-pkg/pkg --config package.json -C Brotli --targets latest --options dns-result-order=ipv4first bin/lando
}

package() {
  cd "${srcdir}/$pkgname" || exit
  install -D -m 755 "dist/@lando/cli" "${pkgdir}/usr/bin/lando"
}
