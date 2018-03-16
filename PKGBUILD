# Maintainer: Boris Timofeev <btimofeev@emunix.org>
pkgname=insteadman
pkgver=2.1.0
pkgrel=1
pkgdesc="Manager for INSTEAD interpreter."
arch=('i686' 'x86_64')
url="https://github.com/jhekasoft/insteadman"
license=('MIT')
depends=('instead')
makedepends=('npm' 'nodejs')
source=("https://github.com/jhekasoft/insteadman/archive/v$pkgver.tar.gz"
	"build-x86.js"
	"build-x64.js"
	"insteadman.desktop")
sha256sums=('b582bce4188ff4c98bd90484422599407073e9fced21c1bc988c6a01959d741d'
            'a041a851218b1e8a769becff26e5ec6ba5b4b5021c6463977f03b997c576ddb9'
            'efef590ba7d432cc74ea03315ba9f363ac15fb58f9d324ae0d25e6df4bffe041'
            '90d7d51b416ae51bdd8091fd12fef953e67f6c951f714a19ce954d39ddfecee7')

build() {
  cp build-x86.js build-x64.js $srcdir/$pkgname-$pkgver/src
  cd $srcdir/$pkgname-$pkgver/src
  npm install
  [[ $CARCH == "i686" ]] && node build-x86.js
  [[ $CARCH == "x86_64" ]] && node build-x64.js
}

package() {
  install -D -m644 insteadman.desktop $pkgdir/usr/share/applications/insteadman.desktop
  [[ $CARCH == "i686" ]] && cd $srcdir/$pkgname-$pkgver/build/dist/InsteadMan-linux-x86
  [[ $CARCH == "x86_64" ]] && cd $srcdir/$pkgname-$pkgver/build/dist/InsteadMan-linux-x64
  mkdir -p $pkgdir/opt/$pkgname
  mkdir -p $pkgdir/usr/bin
  cp -R * $pkgdir/opt/$pkgname/
  ln -s /opt/$pkgname/insteadman $pkgdir/usr/bin/insteadman

  find $pkgdir/opt/$pkgname -type d -print0 | xargs -0 chmod 755
  find $pkgdir/opt/$pkgmane -type f -print0 | xargs -0 chmod 644
  chmod 755 $pkgdir/opt/$pkgname/insteadman
}

# vim:set ts=2 sw=2 et:
