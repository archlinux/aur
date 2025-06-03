# Maintainer: Jacob Morgan <arch_aur@slackspace.io>
pkgname=rotorflight-blackbox
pkgver=2.2.0
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
sha512sums=('79c5e5351ab3e1ed6c5026ba9ae24879ff52f3c183655891978c55de2c0695004b1a8f7bb92f7696b641962b1b3e67ba74b492cdafe28916442d00e8ac329311'
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



