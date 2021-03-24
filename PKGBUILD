# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="openstamanager"
pkgver=2.4.22
pkgrel=1
pkgdesc="Il software gestionale open source per l'assistenza tecnica e la fatturazione"
url="https://www.openstamanager.com/"
license=("GPL3")
arch=("any")
depends=("php>=5.6")
optdepends=("mariadb: database"
            "apache: web server"
            "nginx: web server")
source=("https://github.com/devcode-it/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.zip")
sha256sums=("SKIP")
backup=("etc/webapps/$pkgname/config.inc.php")
options=("!strip")

prepare(){
 # remove unneded vertical bars in configuration file
 # use default backup path
 sed -i "config.example.php" \
     -e "s/|host|/host/" -e "s/|username|/username/" -e "s/|password|/password/" -e "s/|database|/database/" -e "s/|port|/port/" \
     -e "s|__DIR__.'/backup/'|'/usr/share/webapps/$pkgname/backup/'|"
}

package(){
 unlink "$pkgname-$pkgver.zip"
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"
 # move the configuration file to /etc and symlink it
 install -D -o root -g http -m 640 "config.example.php" "$pkgdir/etc/webapps/$pkgname/config.inc.php"
 ln -s "/etc/webapps/$pkgname/config.inc.php" "$pkgdir/usr/share/webapps/$pkgname/config.inc.php"
 # allow write access by "http" user only for these folders
 install -d -o http -g http -m 750 "$pkgdir/usr/share/webapps/$pkgname/backup" \
                                   "$pkgdir/usr/share/webapps/$pkgname/files" \
                                   "$pkgdir/usr/share/webapps/$pkgname/logs" \
                                   "$pkgdir/usr/share/webapps/$pkgname/vendor/mpdf/mpdf/tmp/mpdf"
}
