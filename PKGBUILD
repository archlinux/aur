# Maintainer: James An <james@jamesan.ca>

pkgname=solr-undertow
pkgver=1.7.0_RC_3
pkgrel=1
pkgdesc='Solr / SolrCloud running in high performance server'
arch=('i686' 'x86_64' 'any')
url="https://github.com/kohesive/$pkgname"
license=('Apache')
depends=('java-environment>=7')
optdepends=('solr5-war: Solr 5.x WAR file'
            'solr4-war: Solr 4.x WAR file'
            'solr3-war: Solr 3.x WAR file')
install="$pkgname.install"
source=("$url/releases/download/v${pkgver//_/-}/$pkgname-${pkgver//_/-}.tgz"
        'default.conf'
        "$pkgname.service")
md5sums=('SKIP'
         '3f8f716ddf4daa9073f32fc3666d1004'
         '4f48f542c296933ee35cd739e2189448')

pkgver()  {
  curl --silent "${url/github.com/api.github.com\/repos}/releases" | \
    grep --max-count=1 tag_name | \
    cut --fields=4 --delimiter=\" | \
    sed 's/^v//' | \
    tr '-' '_'
}

prepare() {
  cd "$pkgname-${pkgver//_/-}"
  sed --in-place "s#\$APP_HOME/lib#/usr/share/java/$pkgname#g" "bin/$pkgname"
}

package() {
  cd "$pkgname-${pkgver//_/-}"

  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  for lib in $(basename --multiple lib/*); do
    install -Dm644 lib/$lib "$pkgdir/usr/share/java/$pkgname/$lib"
  done
  for conf in $(basename --multiple example/solr-home/*); do
    install -Dm644 "example/solr-home/$conf" "$pkgdir/etc/solr/$conf"
  done
  for doc in $(basename --multiple example/*.conf); do
    install -Dm644 "example/$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
  done

  install -Dm644 ../default.conf "$pkgdir/etc/solr/default.conf"
  install -Dm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -dm755 "$pkgdir/var/log/$pkgname"

  chown -R 521:521 "$pkgdir/etc/solr" "$pkgdir/var/log/$pkgname"
}
