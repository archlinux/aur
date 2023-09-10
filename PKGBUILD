# Maintainer: Elaina Martineau <elainamartineau@gmail.com>
pkgname=ttf-octicons
pkgver=19.7.0
pkgrel=1
pkgdesc="A scalable set of icons handcrafted with <3 by GitHub"
arch=('any')
license=('MIT')
url="https://octicons.github.com/"
makedepends=('git' 'npm' 'nvm')
depends=('fontconfig' 'xorg-font-util' 'xorg-mkfontscale')
source=("https://github.com/primer/octicons/archive/v${pkgver}.tar.gz")
sha256sums=('649b7d7dd44cb71817ac044fc5864cb5cd3563eee61e4fb3d6d8ba148f0747ef')
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
}

package() {
  cd "${srcdir}/octicons-${pkgver}"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  npm install fantasticon
  mkdir 'font'
  npm exec -- fantasticon icons -o font -t ttf -n octicons

  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 font/octicons.ttf $pkgdir/usr/share/fonts/TTF/
}
