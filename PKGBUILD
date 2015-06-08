# Maintainer: Runnytu < runnytu at gmail dot com >
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Daenyth
# Contributor: Lyle Putnam <lcputnam@amerytel.net>

pkgname=noip
pkgver=2.1.9
pkgrel=6
pkgdesc='Dynamic DNS Client Updater for no-ip.com services'
arch=('x86_64' 'i686' 'armv7h' 'armv6h')
url='http://www.no-ip.com/downloads.php?page=linux'
license=('GPL')
install="$pkgname.install"
depends=('glibc')
source=('http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz'
        'noip.service')
sha256sums=('82b9bafab96a0c53b21aaef688bf70b3572e26217b5e2072bdb09da3c4a6f593'
            '624553d92d69bb76cb457a056a7722dc051b5bbd17ea0e622b5cc08909019ea5')


prepare() {
  cd "$pkgname-$pkgver-1"

  sed -i '/^#define CONFIG_FILEPATH/s/PREFIX//' noip2.c
  sed -i '/^#define CONFIG_FILENAME/s/PREFIX//' noip2.c
}

build() {
  cd "$pkgname-$pkgver-1"

  cc -Wall $CLFAGS $LDFLAGS -g -Dlinux -DPREFIX=/usr noip2.c -o noip2 -Wno-unused-but-set-variable
}

package() {
  cd "$pkgname-$pkgver-1"

  install -Dm755 noip2 "$pkgdir/usr/bin/noip2"
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/noip2.service"
}

