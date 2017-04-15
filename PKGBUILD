# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=nylas-mail-git
_pkgname=nylas-mail
pkgver=1.0.26.49.g52452d6d
pkgrel=1
epoch=1 # Versions numbers went from 2.x to 1.x during the N1 -> Mail switch, so this is necessary
pkgdesc="Nylas Mail: A new mail client for Linux, Mac and Windows, built on the modern web and designed to be extended. (formerly N1, git version)"
arch=('x86_64')
url="https://nylas.com"
license=('MIT')
makedepends=('nvm' 'grunt-cli')
depends=('gtk2' 'libgnome-keyring' 'gnome-keyring' 'desktop-file-utils' 'python2' 'gconf' 'nodejs' 'libnotify' 'libxtst' 'nss' 'alsa-lib' 'libxss')
conflicts=('nylas-mail' 'nylas-mail-bin')
source=('git://github.com/nylas/nylas-mail.git'
        ${_pkgname}.desktop
        ${_pkgname}.png)
md5sums=('SKIP'
         '267b600b1fcddc876b829c8579437770'
         'abb3ea88173fe5dd12dab8c3737dc087')
install=${_pkgname}.install
pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's|-|.|g'
}
build() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/nvm.sh
    source /usr/share/nvm/install-nvm-exec
    unset NPM_CONFIG_PREFIX
    nvm install v6.9.1
    nvm use --delete-prefix v6.9.1

    cd "${srcdir}/${_pkgname}"
    ./script/bootstrap
    npm install grunt
    ./script/grunt build
}
package() {
    mkdir -p "${pkgdir}"/usr/share/${_pkgname}
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}
    mkdir -p "${pkgdir}"/usr/share/pixmaps
    mkdir -p "${pkgdir}"/usr/share/applications

    cp "${srcdir}"/${_pkgname}.png "${pkgdir}"/usr/share/pixmaps
    cp "${srcdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications
    cp "${srcdir}"/${_pkgname}/dist/nylas-linux-x64/* "${pkgdir}"/usr/share/${_pkgname} -R

    # Remove references to $srcdir from generated package.json files
    # This doesn't remove all references, but still better than nothing.
    find . -name "package.json" -exec sed -i '/_where/d' {} \;

    cd "${pkgdir}"
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/python\s*$|#!/usr/bin/python2|' {} \;
    
    chmod 755 "${pkgdir}"/usr/share/${_pkgname}/nylas
    chmod 755 "${pkgdir}"/usr/share/${_pkgname}/resources/apm/bin/{node,apm}

    mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}/

    rm -rf "${pkgdir}/usr/bin/nylas"
    ln -s /usr/share/${_pkgname}/nylas "${pkgdir}"/usr/bin/nylas
    ln -s /usr/share/${_pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
