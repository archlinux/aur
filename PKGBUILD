# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: lesebas
# Contributor: Seb Deligny
pkgname=serviio
pkgver=2.4
pkgrel=1
pkgdesc="Free DLNA media server"
arch=('any')
url="http://www.serviio.org/"
license=('custom')
depends=('java-runtime-headless>=8' 'ffmpeg')
source=(http://download.serviio.org/releases/serviio-${pkgver}-linux.tar.gz
        $pkgname.sh
        $pkgname.service
        $pkgname.desktop
        $pkgname.png)
sha256sums=('b2c8b67ca6c0322cebe5e2c032783e1b6e6e8b7bfdf3308d5b3320eee2e019ab'
            'aacddfcde926bb7c9bbec59777b7c3ca44ef97a39258ef4033c34e83c69e9fe9'
            '83d402a57ee31e48e70f9a8eb100468aaf1b0966974e9389fe4720e140cdc58d'
            'ecf69649d3a68521a4c751ba9a337143f06258228635e6d458a33271995cdec0'
            '96f3fd953d77e5400714d9b20dc83d43ed43497afdeff43e58e273b3d3d87d1d')

package() {
  cd "$pkgname-$pkgver"

  # define variable for Serviio home directory
  SERVIIO_HOME=$pkgdir/usr/share/java/$pkgname

  # create the folders needed in the main directory
  install -dm755 ${SERVIIO_HOME}/{config,lib,library,plugins}

  # place the serviio scripts in the /usr/bin folder
  install -Dm755 ${srcdir}/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm755 bin/$pkgname-console.sh $pkgdir/usr/bin/$pkgname-console

  # copy xml config files to the config folder
  install -m644 config/*.xml ${SERVIIO_HOME}/config

  # copy all jar files to the lib folder
  install -m644 lib/*.jar ${SERVIIO_HOME}/lib

  # copy derby.properties to library folder
  install -m644 library/derby.properties ${SERVIIO_HOME}/library

  # copy plugins-readme.txt to plugins folder
  install -m644 plugins/plugins-readme.txt ${SERVIIO_HOME}/plugins

  # create the log folder in /var/log
  install -dm755 $pkgdir/var/log/$pkgname

  # create a symlink that puts all log files in /var/log
  ln -s /var/log/$pkgname ${SERVIIO_HOME}/log

  # supply the license file
  install -Dm644 LICENCE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # install systemd-service
  install -Dm644 "${srcdir}/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  #install the .desktop file
   install -Dm644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  #install the icon file
   install -Dm644 "${srcdir}/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
}
