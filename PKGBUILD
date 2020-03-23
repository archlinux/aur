# Maintainer: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz
# https://bbs.archlinux.org/viewtopic.php?id=235884

pkgname=lando
pkgver=3.0.0_rrc.1
_target_version=${pkgver//_/-}
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.devwithlando.io"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'yarn' 'git' 'nvm')
source=("${pkgname}::git+https://github.com/lando/lando.git#tag=v${_target_version}")
sha256sums=('SKIP')
conflicts=("lando-git")
provides=("lando")

# strip breaks executable
options=(!strip)

build() {
  cd "${srcdir}/$pkgname" || exit

  # Use nodejs 10 with NVM
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install 10.16.3 && nvm use 10.16.3

  npm install
  yarn pkg:cli

  # Restore node config from nvm
  npm config set prefix "${_npm_prefix}"
  nvm unalias default
}

package() {
  cd "${srcdir}/$pkgname" || exit
  install -D -m 755 "dist/cli/lando-linux-x64-v${_target_version}" "${pkgdir}/usr/bin/lando"
}
