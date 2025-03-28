# Mantainer: Daniele Basso <d dot bass05 at pm dot me>
# Contributor: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz

pkgname=lando-git
pkgver=3.23.10.r0.g7484a9de

pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology [git version]"
arch=('x86_64')
url="https://docs.devwithlando.io"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'git' 'nodejs')
source=("${pkgname}-core::git+https://github.com/lando/core.git#branch=edge")
sha256sums=('SKIP')
conflicts=("lando")
provides=("lando")

# strip breaks executable
options=(!strip)

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir:?}/$pkgname-core" || exit

  npm clean-install --prefer-offline --frozen-lockfile --omit=dev
  # scripts/fatcore-install.sh

  mkdir -p ./dist/@lando
  npx @yao-pkg/pkg --config package.json --target node22 --compress GZip --options dns-result-order=ipv4first bin/lando
}

package() {
  cd "${srcdir}/$pkgname-core" || exit
  install -D -m 755 "dist/@lando/core" "${pkgdir}/usr/bin/lando"
}
