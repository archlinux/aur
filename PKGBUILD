# Maintainer: David Parrish <daveparrish@tutanota.com>
# Thank you inversechi and eschwartz
# https://bbs.archlinux.org/viewtopic.php?id=235884

# shellcheck disable=SC2034,SC2164

pkgname=lando-git
pkgver=3.0.0.rrc.1.r0.g55efb0e0

# Transform git tag into target version string
_target_version=${pkgver: 0:-10}
_target_version=${_target_version%%[[:digit:]]}
_target_version=${_target_version%%[[:digit:]]}
_target_version=${_target_version%%[[:digit:]]}
_target_version=${_target_version%%[[:digit:]]}
_target_version=${_target_version%%.r}
_target_version=${_target_version/.rc/-rc}
_target_version=${_target_version/.rrc/-rrc}
_target_version=${_target_version/.aft/-aft}

pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.devwithlando.io"
license=('GPL')
depends=('docker' 'docker-compose')
optdepends=('gcc-libs')
makedepends=('npm' 'yarn' 'git' 'nvm')
source=("${pkgname}::git+https://github.com/lando/lando.git")
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

  # Use nodejs 10 with NVM
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  # shellcheck disable=SC1091
  source /usr/share/nvm/init-nvm.sh
  nvm install 10.16.3 && nvm use 10.16.3

  npm install
  yarn pkg:cli

  # Restore node config from nvm
  npm config set prefix "${_npm_prefix}"
  nvm unalias default
}

package() {
  cd "${srcdir}/$pkgname"
  install -D -m 755 "dist/cli/lando-linux-x64-v${_target_version}" "${pkgdir:?}/usr/bin/lando"
}
