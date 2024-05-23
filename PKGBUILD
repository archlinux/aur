# Maintainer: Jacob Morgan <arch_aur@slackspace.io>
pkgname=rotorflight-configurator
pkgver=2.0.0 # You'll need to update this dynamically
pkgrel=1
pkgdesc="Rotorflight Configurator for Rotorflight FBL Controller"
arch=('x86_64')
url="https://github.com/rotorflight/rotorflight-configurator"
license=('MIT')
depends=('python' 'nodejs' 'npm' 'nvm')
makedepends=('yarn')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotorflight/rotorflight-configurator/archive/refs/tags/release/${pkgver}.tar.gz"
        "$pkgname.desktop")
sha512sums=('4e344c15a014102bc102fdbe7ce46119b2aaa44f025eff1f16b0f97c71a2af564251f45f6e47f8ef644b6e888360b8c00e79bac8d7639aef1c1215bace8ab4d8'
            '415dd974a570d35fd0c42004005584a8da0c91cf2d3bb030f42ce068ada27a31c2d517637b962f1085266a0e6c2dce1dda6230cdcb1d65de85b9761f48accb06')


_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  pwd

  cd "${pkgname}-release-${pkgver}"
  _ensure_local_nvm
  nvm install 16
}

build() {
  cd "${pkgname}-release-${pkgver}"

  _ensure_local_nvm
  npm install  yarn
  yarn install 

  make version SEMVER="${pkgver}"

  yarn gulp apps --linux64 
}

package() {
  cd "${pkgname}-release-${pkgver}"
  install -d "$pkgdir/opt/$pkgname/"
  cp -r  apps/rotorflight-configurator/linux64/* "${pkgdir}/opt/$pkgname/"
  chmod -R a=u,g-w,o-w "$pkgdir/opt/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

}


