# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=ankama-transition
pkgver=3.11.1
pkgrel=1
pkgdesc="Updater for Ankama games Dofus and Wakfu"
arch=('i686' 'x86_64')
url="http://www.ankama.com"
license=('custom')
depends=('qt4' 'polkit' 'openssl')
source=('http://dl.ak.ankama.com/games/linux/ankama-transition-release.tar.gz'
        'transition.sh')
md5sums=('bac15a49942ac46c8270e8f5b94c3d1c'
         '2be6feebbe106c854ca79d623a030d70')
install='ankama-transition.install'

prepare() {
  ln -sf "$srcdir/i386" i686
  ln -sf "$srcdir/amd64" x86_64
  sed -i 's:$$${installation_path}:/opt/ankama:' \
      "$srcdir/usr/share/polkit-1/actions/com.ankama.transitionupdateservice.policy"
  # we only use usr/share/pixmaps/transition.png
  rm -rf "$srcdir/usr/share/icons/"
}

package() {
  cd "$srcdir/"
  cp -r 'etc' 'usr' 'opt' "$pkgdir/"
  cp -r "$CARCH/opt"/* "$pkgdir/opt"

  _installdir="$pkgdir/opt/ankama/transition"
  chgrp -R games "$_installdir"
  chmod -R g+w "$_installdir"

  install -Dm755 'transition.sh' "$pkgdir/usr/bin/transition"
  install -Dm644 'opt/ankama/transition/licences/README.txt' \
          "$pkgdir/usr/share/licenses/ankama-transition/licenses.txt"
}

