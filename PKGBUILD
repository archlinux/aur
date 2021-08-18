# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=snappymail
pkgver=2.6.2
pkgrel=1
pkgdesc="modern PHP webmail client"
arch=('any')
license=('AGPL3')
url="https://snappymail.eu"
depends=('php-fpm')
makedepends=('nodejs' 'yarn' 'gulp' 'php' 'brotli' 'rollup')
optdepends=('mariadb: storage backend for contacts'
            'php-pgsql: storage backend for contacts'
            'php-sqlite: storage backend for contacts')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/the-djmaze/snappymail/archive/v$pkgver.tar.gz"
  'sysusers.conf'
  'tmpfiles.conf'
)
b2sums=('f9df25b1bf4259e72a6886008a38540969020857a5b1a77986a6941599a472bae39b2db17d8d18eaf7f7f81056800bb42845acc6adec47326b900ee7a6eae2fa'
        'e020b2d4bc694ca056f5c15b148c69553ab610b5e1789f52543aa65e098f8097a41709b5b0fc22a6a01088a9d3f14d623b1b6e9ae2570acd4f380f429301c003'
        'be25b05d775ac4e88065e8018a1026b4c41a073639e59e6520818b7ca578cc93ac2120bd090caf1d255fade69a6680ca764b14cb32f6dd61c80b521d1b16f205')

prepare() {
  # ensure data path is set to /var/lib/snappymail
  sed -i "s/\$sCustomDataPath = '';/\$sCustomDataPath = '\/var\/lib\/$pkgname';/" "$pkgname-$pkgver/$pkgname/v/0.0.0/include.php"

  # create folder for build output
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  yarn install

  # build snappymail
  php release.php --aur
  bsdtar -x \
    -C "$srcdir/build" \
    -f "build/dist/releases/webmail/$pkgver/$pkgname-$pkgver.tar.gz"
  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
}

package() {
  # directories
  install -vdm755 "$pkgdir/usr/share/snappymail" \
    "$pkgdir/var/lib/snappymail"

  # application files
  cp -rv "$srcdir/build/snappymail" "$pkgdir/usr/share/snappymail"
  install -vDm644 -t "$pkgdir/usr/share/snappymail" \
    "$srcdir/build/index.php" \
    "$srcdir/build/include.php" \
    "$srcdir/build/serviceworker.js" \
    "$srcdir/build/.htaccess"

  # data files
  cp -rv "$srcdir/build/data" "$pkgdir/var/lib/snappymail"

  # systemd configuration
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
