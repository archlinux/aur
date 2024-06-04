# Mantainer: Daniele Basso <d dot bass05 at pm dot me>
# Contributor: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz

pkgname=lando-git
pkgver=3.21.0.r0.gec6b7eef

pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology [git version]"
arch=('x86_64')
url="https://docs.devwithlando.io"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'git' 'nodejs-lts-hydrogen')
source=("${pkgname}::git+https://github.com/lando/cli.git")
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
  cd "${srcdir:?}/$pkgname"

  npm clean-install --prefer-offline --frozen-lockfile --omit="dev"
  scripts/fatcore-install.sh

  npm run pkg
}

package() {
  cd "${srcdir}/$pkgname" || exit
  install -D -m 755 "dist/@lando/cli" "${pkgdir}/usr/bin/lando"
}
