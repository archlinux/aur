# Maintainer: James An <james@jamesan.ca>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: David Danier <david.danier@team23.de>

_pkgname=solr
pkgname=solr5
pkgver=5.2.1
pkgrel=2
pkgdesc="Popular, blazing fast open source enterprise search platform from the Apache Lucene project"
arch=('any')
license=('Apache')
url="http://lucene.apache.org/$_pkgname/"
depends=('java-runtime>=7.u55')
optdepends=('java-runtime>=8: for improved performance compared to older runtime systems.')
makedepends=('unzip')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("http://archive.apache.org/dist/lucene/$_pkgname/$pkgver/$_pkgname-$pkgver.tgz"
        "$_pkgname"
        "$_pkgname.service")
install=$_pkgname.install
backup=(etc/$_pkgname/{webdefault.xml,zoo.cfg}
        etc/$_pkgname/jetty{,-{http,https,https-ssl,ssl}}.xml)

sha256sums=('3f54cec862da1376857f96f4a6f2044a5addcebc4df159b8797fd71f7ba8df86'
            '08e89de3711e158b5b031241f2d5233e54a8e87747b4518d9fa64754664ab30b'
            '37318da4f5aaad606e3d97bf49f038bde34d8d947de178b1c9a86fa5f815c9ee')

prepare() {
  cd "$_pkgname-$pkgver/server"

  msg2 'Unpacking war archive'
  mkdir --parents "$_pkgname-webapp/webapp"
  unzip -foq webapps/solr.war -d "$_pkgname-webapp/webapp" #&>/dev/null
}

package() {
  cd "$_pkgname-$pkgver/server"

  msg2 'Installing configuration files'
  for path in etc/*.xml $_pkgname/$_pkgname.xml $_pkgname/zoo.cfg; do
    file="$(basename $path)"
    install -Dm644 $path "$pkgdir/etc/$_pkgname/conf/$file"
  done
  install -Dm644 contexts/solr-jetty-context.xml "$pkgdir/etc/$_pkgname/contexts/solr-jetty-context.xml"
  for module in modules/{http,https,server,ssl}.mod; do
    install -Dm644 $module "$pkgdir/etc/$_pkgname/$module"
  done
  for resource in resources/{jetty-logging,log4j}.properties; do
    install -Dm644 $resource "$pkgdir/etc/$_pkgname/$resource"
  done
  install -dm755 "$pkgdir/var/log/$_pkgname"

  msg2 'Installing jar files'
  for path in lib/*.jar; do
    file="$(basename $path)"
    install -Dm644 $path "$pkgdir/usr/lib/$_pkgname/$file"
  done
  for path in lib/ext/*.jar; do
    file="$(basename $path)"
    install -Dm644 $path "$pkgdir/usr/lib/$_pkgname/ext/$file"
  done

  msg2 'Installing documentation'
  install -dm755 "$pkgdir/usr/share/doc/$_pkgname"
  for file in README.txt scripts $_pkgname/configsets; do
    cp --archive $file "$pkgdir/usr/share/doc/$_pkgname"
  done

  msg2 'Installing main application files'
  for file in start.jar webapps/$_pkgname.war; do
    install -Dm644 $file "$pkgdir/usr/share/webapps/$_pkgname/$file"
  done
  install -Dm755 "../bin/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname/$_pkgname"
  install -Dm755 "../bin/$_pkgname.in.sh" "$pkgdir/usr/share/webapps/$_pkgname/$_pkgname.in.sh"
  cp --archive "$_pkgname-webapp" "$pkgdir/usr/share/webapps/$_pkgname"

  msg2 'Installing original files'
  install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  msg2 'Adding symlinks and applying file ownership scheme.'
  ln -s "/etc/$_pkgname/conf" "$pkgdir/usr/share/webapps/$_pkgname/etc"
  ln -s "/etc/$_pkgname/contexts" "$pkgdir/usr/share/webapps/$_pkgname/contexts"
  ln -s "/etc/$_pkgname/modules" "$pkgdir/usr/share/webapps/$_pkgname/modules"
  ln -s "/etc/$_pkgname/resources" "$pkgdir/usr/share/webapps/$_pkgname/resources"
  ln -s "/usr/lib/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname/lib"
  for file in README.txt configsets contexts resources scripts; do
    ln -s "/usr/share/doc/$_pkgname/$file" "$pkgdir/usr/share/webapps/$_pkgname/$file"
  done
  ln -s "/var/log/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname/logs"
  chown --recursive 521:521 "$pkgdir/etc/$_pkgname" "$pkgdir/var/log/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname/$_pkgname-webapp"
}
