# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Brendan Abolivier <brendan@cozycloud.cc>

pkgname=cozy
pkgver=2.0
_pkgctrl=${pkgname}-controller
_verctrl=2.5.10
_pkgmntr=${pkgname}-monitor
_vermntr=1.3.9
pkgrel=1
pkgdesc="A personal cloud you can hack, host and delete."
arch=('i686' 'x86_64')
url="https://cozy.io/"
license=('GPL3')
depends=('python2' 'git' 'imagemagick' 'curl' 'sqlite' 'sudo'
         'libxml2' 'libxslt' 'nodejs-lts-argon' 'npm'
         'couchdb' 'coffee-script')
optdepends=('cozy-management: Helper to manage Cozy'
            'libjpeg-turbo: Needed for the Kresus app'
            'libyaml: Needed for the Kresus app'
            'weboob-git: Needed for the Kresus app')
source=(${_pkgctrl}-${_verctrl}.tar.gz::"https://github.com/${pkgname}/${_pkgctrl}/archive/v${_verctrl}.tar.gz"
        ${_pkgmntr}-${_vermntr}.tar.gz::"https://github.com/${pkgname}/${_pkgmntr}/archive/v${_vermntr}.tar.gz"
        "${pkgname}.tmpfiles"
        "${pkgname}.sysusers"
        "${_pkgctrl}.service"
        'controller.json')
sha256sums=('6988e5d1f0a7aa652af3e4dce9fce917de48f79910b853f7941cf84e0c765698'
            '76d0a3e2335a79b653f271c8d4ec1f16ece5dd1fb7fa4091175c6db1b4f8cabb'
            '2851ae1dbe60d83a2ee919b783be8c6bd39516c0290f43270605bebe7c9b22f2'
            '7b6ee2a5b91b900c81df700351ac9f3b6303c7bf3848c6d644a160c6c41e2db1'
            'e4f492e528dc83c65424c48b14d26f843f1aa454ab83d5de629e70127053b8d0'
            'f7e63b06690ba414f490f0e84bc0a3ca2328f72d690498873f4cafcd34a2749d')

package() {
  cd ${_pkgctrl}-${_verctrl}
  npm install --cache "${srcdir}"/npm-cache -g --user root --prefix "${pkgdir}"/usr

  cd "${srcdir}"/${_pkgmntr}-${_vermntr}
  npm install --cache "${srcdir}"/npm-cache -g --user root --prefix "${pkgdir}"/usr

  rmdir "${pkgdir}"/usr/etc

  cd "${srcdir}"
  install -Dm644 controller.json -t "${pkgdir}"/etc/cozy/
  install -Dm644 ${_pkgctrl}.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
  install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
}
