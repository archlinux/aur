# Maintainer: Elaina Martineau <elainamartineau@gmail.com>
pkgname=ttf-octicons
pkgver=19.12.0
pkgrel=1
pkgdesc="A scalable set of icons handcrafted with <3 by GitHub"
arch=('any')
license=('MIT')
url="https://octicons.github.com/"
makedepends=('git' 'npm' 'nvm')
depends=('fontconfig' 'xorg-font-util' 'xorg-mkfontscale')
source=("https://github.com/primer/octicons/archive/v${pkgver}.tar.gz")
sha256sums=('08be590886d4440d3ca5acfcb4f994c482053a0047ec8daa43df0f74b0cc71cb')
install=$pkgname.install

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
    _ensure_local_nvm
    nvm install 16.0.0
}

build() {
    _ensure_local_nvm
    npm install

  npm install fantasticon
  mkdir -p 'font'
  npm exec -- fantasticon octicons-${pkgver}/icons -o font -t ttf -n octicons
}

package() {
  cd "${srcdir}/octicons-${pkgver}"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 ../font/octicons.ttf $pkgdir/usr/share/fonts/TTF/
}
