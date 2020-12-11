# Maintainer: luxcem <a@luxcem.fr>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: vscncls <lucaslou4@protonmail.com>

pkgname=insomnia
pkgver=2020.5.1
pkgrel=2
_nodeversion=12.18.3
pkgdesc="Cross-platform HTTP and GraphQL Client"
url="https://github.com/Kong/insomnia"
arch=('any')
license=('MIT')
depends=('electron')
makedepends=('npm' 'nvm' 'imagemagick')
source=(
  "https://github.com/Kong/insomnia/archive/core@${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "insomnia.desktop"
  "insomnia.sh"
)
b2sums=('9c13d6bc6c7908f7eaec7b2d249b68dc703f68271ccbd1c6d4abb9ec107b2909f09973190de6caf73cb4ff72c65b82ac8960854575a99fd7ccc2e741a9a01613'
        'd2ceeb224fa3a35551b0929648d5e066da93a451a66b73373c13ed0dd89575a2482c2dc8e7499b214d0d62cca2532189dac9a681537751a5a86b592cae5686c7'
        '7ea4aff2779267bfc5f7be5533d70b07a3da1c8bfed424c9f6cc9806fe6567a4cd40144264a8827b016e51f31c6dbb395c90aac4d333f297070213c77a0b2c9c')

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
  # Use local electron version
  # See https://wiki.archlinux.org/index.php/Electron_package_guidelines
  _ensure_local_nvm
  
  cd ${pkgname}-core-${pkgver}
  electron_version=$(electron --version | sed s/v//)
  sed -i 's/"electron": ".\+"/"electron": "'"$electron_version"'"/g' packages/insomnia-app/package.json

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
  # Install start script
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/insomnia"
  install -Dm644 ${pkgname}.desktop -t "${pkgdir}/usr/share/applications"

  cd ${pkgname}-core-${pkgver}
  install -Dm644 packages/insomnia-app/dist/com.insomnia.app/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/share/insomnia"

  # Add icons
  for size in 16 32 48 128 256 512 1024; do
     install -dm744 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/"
     convert -resize "${size}x${size}" packages/insomnia-app/app/ui/images/insomnia-core-logo.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/insomnia.png"
  done

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

