# Maintainer: Luke Arms <luke@arms.to>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=standard
pkgver=17.1.0
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
sha512sums=('8da0ea94d4b32ed5985b896f426534127c563141908b01dab19979644230c774bf8a36438d93b3b35cb542a2b02ace6faa71691ad8b3a3834e617dacd15a2afe')

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
