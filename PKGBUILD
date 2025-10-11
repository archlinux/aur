# Maintainer: Gunnar Bretthauer <taijian@posteo.de>

pkgname=calcardbackup
pkgver=10.0.0
pkgrel=1
pkgdesc="Bash script to backup calendars and addressbooks from a local Nextcloud installation"
arch=('any')
license=('AGPL-3.0-or-later')
url="https://codeberg.org/BernieO/${pkgname}"
depends=('nextcloud')
makedepends=()
optdepends=('zip: for zip compression instead of tar.gz')
backup=(etc/${pkgname}/${pkgname}.conf)
source=("https://codeberg.org/BernieO/${pkgname}/archive/v${pkgver}.tar.gz"
        ${pkgname}.service
        ${pkgname}.timer)
sha256sums=('db41646e83c7b704eb1e56c07d533133f68f22d5e6eb6c37eb5df33ba082ca4c'
            '2288a3c62b736c322e23c36ca3d7c07dd849e716a372e80662b86b6c4c1e5a4b'
            '9cdb10575f2ed260ac6a403ca522ab1c5e523d58acda7ece6c353ddfc16a2476')

prepare() {
  # replace default Nextcloud path in config file
  sed -i '/nextcloud_path/s/nginx\/www/webapps\/nextcloud/' $srcdir/$pkgname/examples/${pkgname}.conf.example
  # point default backup location to default Nextcloud data dir
  sed -i '/backupfolder/s/backups/\/var\/lib\/nextcloud\/data\/.calcardbackup/' $srcdir/$pkgname/examples/${pkgname}.conf.example
}

package() {
  cd "$srcdir/${pkgname}"
  
  # install the shell script
  install -Dm755 ./${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  
  # install systemd files
  install -Dm644 $srcdir/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 $srcdir/${pkgname}.timer "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
  
  # copy the readmes
  install -Dm644 ./README.md "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
  install -Dm644 ./README_GER.md "${pkgdir}/usr/share/doc/${pkgname}/readme_de.txt"
  install -Dm644 ./changelog.md "${pkgdir}/usr/share/doc/${pkgname}/changelog.txt"
  install -Dm644 examples/users.txt.example "${pkgdir}/usr/share/doc/${pkgname}/users.txt.example"
  install -Dm644 examples/${pkgname}.conf.example "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.conf.example"
  
  # copy example config to /etc/${pkgname}
  install -Dm644 examples/${pkgname}.conf.example "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}

