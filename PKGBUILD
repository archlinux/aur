# Maintainer: Gunnar Bretthauer <taijian@posteo.de>

pkgname=calcardbackup
pkgver=5.0.0
pkgrel=1
pkgdesc="Bash script to backup calendars and addressbooks from a local Nextcloud installation"
arch=('any')
license=('AGPL3')
url="https://codeberg.org/BernieO/${pkgname}"
depends=('nextcloud')
makedepends=()
optdepends=('zip: for zip compression instead of tar.gz')
backup=(etc/${pkgname}/${pkgname}.conf)
source=("https://codeberg.org/BernieO/${pkgname}/archive/v${pkgver}.tar.gz"
        ${pkgname}.service
        ${pkgname}.timer)
sha256sums=('927eaba6a0919bfd6b3705c6c59bf4d0166d76cf12072d0c50633ee145f597f2'
            '2288a3c62b736c322e23c36ca3d7c07dd849e716a372e80662b86b6c4c1e5a4b'
            'f7769992870000fe550da0c95d918fa6c30f852b7c95064ec0851a7f941eb2a9')

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

