# Contributions by: Timothée Ravier <tim@siosm.fr>, Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Ruben Kelevra <ruben@freifunk-nrw.de>

pkgname=etherpad-lite-systemd
pkgver=1.5.2
pkgrel=2
pkgdesc="etherpad-lite with systemd socket-activation"
arch=(any)
url="http://etherpad.org"
_watch=('http://etherpad.org','Documentation <small>v([\d.]*)</small>')
license=('GPL2')
depends=('curl' 'python2' 'openssl' 'nodejs<0.13.0' 'git' 'npm')
optdepends=('sqlite: to use sqlite as databse'
            'mariadb: to use mariadb as database'
            'postgresql: to use postgresql as database')
conflicts=('etherpad-lite-git')
backup=('usr/share/webapps/etherpad-lite/settings.json'
        'etc/webapps/etherpad-lite/settings.json')
install='etherpad-lite.install'
source=("etherpad-lite-${pkgver}.tar.gz::https://github.com/ether/etherpad-lite/archive/${pkgver}.tar.gz"
        "etherpad-lite.service"
        "etherpad-lite.socket"
        "socket-activation.patch"
        )

prepare() {
  cd "$srcdir/etherpad-lite-${pkgver}"
  sed -i "s/9001/19001/" settings.json.template
  patch -p0 -i "$srcdir/socket-activation.patch"
}

build() {
  cd "$srcdir/etherpad-lite-${pkgver}"
  export PYTHON=python2
  ./bin/installDeps.sh
}

package() {
  cd "$srcdir/etherpad-lite-${pkgver}"
  echo 'cleaning up unneeded files...'
  rm bin/installOnWindows.bat start.bat bin/buildDebian.sh bin/buildForWindows.sh  
  rm -r var bin/deb-src doc 
  echo 'move files...'
  install -dm 755 "${pkgdir}"/usr/share/webapps/etherpad-lite
  cp -a . "${pkgdir}"/usr/share/webapps/etherpad-lite
  mkdir -p "${pkgdir}"/etc/webapps/etherpad-lite
  mv "${pkgdir}"/usr/share/webapps/etherpad-lite/settings.json "${pkgdir}"/etc/webapps/etherpad-lite/settings.json
  ln -s /etc/webapps/etherpad-lite/settings.json "${pkgdir}"/usr/share/webapps/etherpad-lite/settings.json
  install -Dm644 "${srcdir}"/etherpad-lite.service "${pkgdir}"/usr/lib/systemd/system/etherpad-lite.service
  install -Dm644 "${srcdir}"/etherpad-lite.socket "${pkgdir}"/usr/lib/systemd/system/etherpad-lite.socket
  install -Dm644 "${srcdir}"/etherpad-lite.service "${pkgdir}"/usr/lib/systemd/system/etherpad-lite.service
  install -D LICENSE 	"${pkgdir}"/usr/share/licenses/etherpad-lite/LICENSE
  echo "setting rights..."
  #touch "${pkgdir}"/usr/share/webapps/etherpad-lite/APIKEY.txt
  find "${pkgdir}"/usr/share/webapps/etherpad-lite \
      \( -type f -exec chmod ug+rw,o+r {} \; \) , \
      \( -type d -exec chmod ug+rwxs,o+rx {} \; \)
  chmod u+x "${pkgdir}"/usr/share/webapps/etherpad-lite/bin/run.sh
  chmod u+x "${pkgdir}"/usr/share/webapps/etherpad-lite/bin/installDeps.sh
}
md5sums=('d218b5b2d6c1e9390e314df78a507165'
         '6204c73a5d04019e09ef86e1d0a1a61a'
         '987fe3ab72dc495c7e8101658ff673ea'
         '50476ce9e5c1b9bd53063bb875972be7')
sha1sums=('8e2e55f6e4c4237028e0a6e9f2b66b88455f415e'
          'a6fdde2ccbe4044e7679d3d0d45f7c54e1d703d6'
          '8768c601d7920427c6906a5ac3eca8f725981a2c'
          '24f76b29a17ac9eba704913d136a54968d1152c0')
sha256sums=('6bdfc3c22a36fd98e72e68e0be4a889d1611b7b1d10e7ebe6dffd1c09bf54bc2'
            '0eafab2c0385ac8b5b70c5a6e7db502304a0c9accc13a5155cb02f84fb241b0d'
            '0b6f0f45e4892649e442f6082150c3181352a356926be959a72c9e9dca7973b1'
            'e1f7cda94688788f2c8a988312ba712f8467c66e702eef275faf03eda4410f36')
