# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shlink"
pkgver=3.4.0
pkgrel=1
pkgdesc="The definitive self-hosted URL shortener"
url="https://shlink.io"
license=("MIT")
arch=("any")
depends=("php>=8.1" "php-gd" "php-intl" "php-apcu")
optdepends=("mariadb: database"
            "mssql-server: database"
            "mysql: database"
            "postgresql: database"
            "sqlite: database"
            "apache: web server"
            "nginx: web server")
source=("https://github.com/shlinkio/shlink/releases/download/v$pkgver/$pkgname${pkgver}_php8.1_dist.zip")
sha256sums=('e37e91cd86a8d495952783d1eeb94f157ddfe42f50849a3c2f979b1f9d991963')
install="$pkgname.install"
options=("!strip")
backup=("usr/share/webapps/shlink/config/params/generated_config.php")

# https://wiki.archlinux.org/title/DeveloperWiki:UID_/_GID_Database
_http_uid_gid=33

package(){
 cd "$pkgname${pkgver}_php8.1_dist"
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"
 install -d "data" "$pkgdir/usr/share/webapps/$pkgname/data"
 chown -R "${_http_uid_gid}:${_http_uid_gid}" "$pkgdir/usr/share/webapps/$pkgname/data"
 install -d -o "${_http_uid_gid}" -g "${_http_uid_gid}" -m 750 "config/params" "$pkgdir/usr/share/webapps/$pkgname/config/params"
 install -D -d -o "${_http_uid_gid}" -g "${_http_uid_gid}" -m 750 "$pkgdir/var/log/$pkgname"
 rm -r "$pkgdir/usr/share/webapps/$pkgname/data/log"
 ln -s "/var/log/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/data/log"
}
