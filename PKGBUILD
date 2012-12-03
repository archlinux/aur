# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=swapspace
pkgver=1.10
pkgrel=3
pkgdesc="A dynamic swap manager"
arch=('i686' 'x86_64')
url="http://pqxx.org/development/swapspace"
license=('GPL')
backup=(etc/swapspace.conf)
source=(http://pqxx.org/download/software/swapspace/$pkgname-$pkgver.tar.gz
        Makefile.patch
        swapspace.confd
        swapspace
        systemd.scripts.swapspace
        systemd.system.swapspace)
sha256sums=('37256d6759be5cefbb50afbeba8bb0f159b3488aecd972898fcc6f4d5e6a3573'
            'bc7abed7a240e5b5ebb183cb2d1f2fb65dfb4864fc8c56a2d6f18bec5d5abc8b'
            '233fec29540b5cf7ae3d49d34deac9a9a044665bd942e817d6b98ae3a91b9857'
            '632e7dae7cb5e47904c584f5086861684193dfea9425e337fb807e8dbb9aa482'
            '7d5f6b608a89b7975213bea5fc5146e7939401264147b9e7ea17b4f17d952ce1'
            '4b270924b6b27e47b7e4fe8981bc4761929730069e1ecb78b43f10987e9151f4')
options=(!buildflags)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ${srcdir}/Makefile.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm755 ../swapspace "${pkgdir}"/etc/rc.d/swapspace
  install -Dm644 ../swapspace.confd "${pkgdir}"/etc/conf.d/swapspace

  install -Dm755 ../systemd.scripts.swapspace \
    "${pkgdir}"/usr/lib/systemd/scripts/swapspace
  install -Dm644 ../systemd.system.swapspace \
    "${pkgdir}"/usr/lib/systemd/system/swapspace
}

# vim:set ts=2 sw=2 et:
