# Maintainer: Luke Arms <luke@arms.to>

pkgname=ts-standard
pkgver=12.0.2
pkgrel=1
pkgdesc='TypeScript style guide, linter, and formatter using StandardJS'
arch=('any')
url='https://standardjs.com'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('nodejs-ts-standard')
conflicts=('nodejs-ts-standard')
replaces=('nodejs-ts-standard')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('5d7db0ac1f5f28a4df063e320f70019bd89287365c4b689670f2bc5f3941bee2f6d3ec0c88b822cff939b57819c13698ab9c1185b92cd58f4f7a586e8c5ffd6a')

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
