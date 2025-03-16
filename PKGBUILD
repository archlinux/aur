# Maintainer: Jacob Morgan <arch_aur@slackspace.io>
pkgname=rotorflight-blackbox
pkgver=2.1.1
pkgrel=1
pkgdesc="Rotorflight Blackbox for Rotorflight FBL Controller"
arch=('x86_64')
url="https://github.com/rotorflight/rotorflight-blackbox"
license=('MIT')
options=('!debug' '!strip')
depends=('python' 'nodejs' 'npm' 'nvm')
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotorflight/rotorflight-blackbox/archive/refs/tags/release/${pkgver}.tar.gz"
        "$pkgname.desktop")
sha512sums=('0d0af29c7fc15595d865f7769193dc0ca74bdcc887cbffc558aaed93cd16149df8a8ef38502f334b8c7c46d5128567143d4013199785cb9c17c8dffd18f64b0d'
            'dc323d2e7bab4d0f65a9cd62d99e7bc696ac880bbe3ed824959c9d6b5142f9095195b3a234fb4676ef49dc5419f41218107e9f324e6351870a47aa19571b64f7')


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

  cd "${pkgname}-release-${pkgver}"
  _ensure_local_nvm
  nvm install 16
}

build() {
  cd "${pkgname}-release-${pkgver}"

  _ensure_local_nvm
  npm install  yarn -g
  yarn install 
  
  make version SEMVER="${pkgver}"
  yarn gulp apps --linux64 




}

package() {
  cd "${pkgname}-release-${pkgver}"

  install -d "$pkgdir/opt/$pkgname/"
  cp -r  apps/rotorflight-blackbox/linux64/* "${pkgdir}/opt/$pkgname/"
  chmod -R a=u,g-w,o-w "$pkgdir/opt/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

}



