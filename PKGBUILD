# Maintainer: Jacob Morgan <arch_aur@slackspace.io>
pkgname=rotorflight-blackbox
pkgver=2.3.0
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
sha512sums=('78141cd2de1569cab20de3136ae3d813cf1ab3ba706bdf51b1d317bfe4ae8229b0a358f7e197f03136b42d50838f319d47bcc218a00d75a4430d74af686e8d26'
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



