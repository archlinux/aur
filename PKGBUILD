# Maintainer: Jacob Morgan <arch_aur@slackspace.io>
pkgname=rotorflight-configurator
pkgver=2.2.0
# You'll need to update this dynamically
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
sha512sums=('fb70d4aa757c3f3531a967a4199d2302798ae54fbdf2eb1f21bf0ecbae0315d70bf071b7edce27cc6decfd290d7c0f306aad7c38274db43ea5b7d10861f1cbae'
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
  nvm install 22
}

build() {
  cd "${pkgname}-release-${pkgver}"

  _ensure_local_nvm
  npm install
  npm install -g pnpm

  make version SEMVER="${pkgver}"

  pnpm gulp app --linux64 
}

package() {
  cd "${pkgname}-release-${pkgver}"
  install -d "$pkgdir/opt/$pkgname/"
  cp -r  app/linux_x86_64/* "${pkgdir}/opt/$pkgname/"
  chmod -R a=u,g-w,o-w "$pkgdir/opt/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

}


