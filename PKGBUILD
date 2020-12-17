# Maintainer: luxcem <a@luxcem.fr>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: vscncls <lucaslou4@protonmail.com>

pkgname=insomnia
pkgver=2020.5.1
pkgrel=3
_nodeversion=12.18.3
pkgdesc="Cross-platform HTTP and GraphQL Client"
url="https://github.com/Kong/insomnia"
arch=('any')
license=('MIT')
depends=()
makedepends=('npm' 'nvm')
source=(
  "https://github.com/Kong/insomnia/archive/core@${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "insomnia.desktop"
)
b2sums=('9c13d6bc6c7908f7eaec7b2d249b68dc703f68271ccbd1c6d4abb9ec107b2909f09973190de6caf73cb4ff72c65b82ac8960854575a99fd7ccc2e741a9a01613'
        '38c2edd681b012931e25498a4a65007cc2a2152c9bbc5505dbb7cf03e1143a7365c41e9ad7eb2318c8ea894dccad0e0b6601cf76f680ea4085d12b5059e61a6e')

_ensure_local_nvm() {
  # lets be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

  export NVM_DIR="${srcdir}/${pkgname}-core-${pkgver}/.nvm"
  # The init script returns 3 if version
  #   specified in ./.nvrc is not (yet) installed in $NVM_DIR
  #   but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  
  cd ${pkgname}-core-${pkgver}

  # Install .nvmrc node version 
  nvm install 
}

build() {
  _ensure_local_nvm
  
  cd ${pkgname}-core-${pkgver}
  
  npm run bootstrap  
  GIT_TAG="core@${pkgver}" npm run app-package
}

package() {
  install -Dm644 ${pkgname}.desktop -t "${pkgdir}/usr/share/applications"

  cd ${pkgname}-core-${pkgver}
  install -d "${pkgdir}/opt/insomnia"
  cp -r "packages/insomnia-app/dist/com.insomnia.app/linux-unpacked/." "$pkgdir/opt/insomnia"
  install -Dm644 packages/insomnia-app/app/ui/images/insomnia-core-logo.png "${pkgdir}/usr/share/pixmaps/insomnia.png"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

