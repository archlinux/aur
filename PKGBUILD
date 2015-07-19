# Maintainer: James An <james@jamesan.ca>

_pkgname=solr
pkgname="$_pkgname-undertow"
_pkgver=5.0.0
pkgver=1.3.0
pkgrel=1
pkgdesc='Solr / SolrCloud running in high performance server'
arch=('i686' 'x86_64' 'any')
url="https://github.com/bremeld/$pkgname"
license=('Apache')
depends=('java-environment>=7')
provides=("$_pkgname=5" "${_pkgname}5=5")
conflict=("$_pkgname" "${_pkgname}5")
install="$pkgname.install"
source=("https://github.com/bremeld/solr-undertow/releases/download/v1.3.0/$pkgname-$pkgver-with-$_pkgname-$_pkgver.tgz"
        'default.conf'
        "$pkgname.service")
md5sums=('03b1b4b9d63542e9b17f8bb04139f59a'
         '9c44676a7afb66443a07ddc5aebbeee8'
         'e081bb003ce7f9548992d5ccc1917f86')

prepare() {
  cd "$pkgname-$pkgver-with-$_pkgname-$_pkgver"
  sed --in-place 's#$APP_HOME/lib#/var/lib/$APP_NAME/lib#g' "bin/$pkgname"
}

package() {
  cd "$pkgname-$pkgver-with-$_pkgname-$_pkgver"

  install -Dm644 "example/$_pkgname-wars/$_pkgname-$_pkgver.war" "$pkgdir/var/lib/$pkgname/$_pkgname-$_pkgver.war"
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  for lib in lib/*; do
    install -Dm644 $lib "$pkgdir/var/lib/$pkgname/$lib"
  done
  for conf in $(ls -1 "example/$_pkgname-home"); do
    install -Dm644 "example/$_pkgname-home/$conf" "$pkgdir/etc/$pkgname/$conf"
  done
  for doc in $(basename --multiple example/*.conf); do
    install -Dm644 "example/$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
  done

  install -Dm644 ../default.conf "$pkgdir/etc/$pkgname/default.conf"
  install -Dm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -dm755 "$pkgdir/var/log/$pkgname"

  chown -R 521:521 "$pkgdir/etc/$pkgname" "$pkgdir/var/log/$pkgname"
}
