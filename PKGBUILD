# Maintainer: Luke Arms <luke@arms.to>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=standard
pkgver=17.1.2
pkgrel=1
pkgdesc='JavaScript style guide, linter, and formatter'
arch=('any')
url='https://standardjs.com'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('nodejs-standard')
conflicts=('nodejs-standard')
replaces=('nodejs-standard')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('58b9b5d96a17bde2a4be73e73e76855141ee381d9c51d02c2780221872f61b450d32b7110166365ab890695f08437a11998af401651b2cdafde1e9181401ceac')

_maybe_unload_nvm() {
  # If makepkg is running in an environment serviced by nvm, load and deactivate
  # it to remove nvm directories from PATH and ensure node and npm run from /usr
  set -- "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
  [[ -e $1 ]] || return 0
  echo "nvm found at $1, deactivating in build environment" >&2
  . "$1"
  nvm deactivate
  nvm unload
}

package() {
  _maybe_unload_nvm
  npm install \
    --global \
    --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/.npm" \
    --no-save \
    --no-progress \
    --no-audit \
    --no-fund \
    "${srcdir}/${pkgname}-${pkgver}.tgz"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sr "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # See https://github.com/npm/npm/issues/9359 and
  # https://bugs.archlinux.org/task/63396
  chmod -R u=rwX,go=rX "${pkgdir}"
  chown -R root:root "${pkgdir}"
}
