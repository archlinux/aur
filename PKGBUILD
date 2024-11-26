# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=moodle-stable
pkgver=4.5.0
pkgrel=1
pkgdesc="An open-source software learning management system"
arch=("any")
url="https://github.com/moodle/moodle/"
license=("GPLv3")
options=('!strip')
source=("https://github.com/moodle/moodle/archive/refs/tags/v${pkgver}.tar.gz"
        "moodle-cron.service"
        "moodle-cron.timer"
        "moodle.tmpfiles")
sha512sums=('df40a8f5f36668d5602201785741e3d826f3b6fc1685274f68e5545783cbf6e7a222413ff9c2181944cbf107b30488a50c03ec03c01fcefbb9de62edae538713'
            'f9d929bd5ba4cdeeb9b8c9371f14aa1fe9b9218f27ce95c4ef1e1057f56d2b7f71f47cb11a77d6af9f5fab31b3ba2b9cac4230bc251c81cc99818a3b1e7b5177'
            'eb4fec1a61e4d3d0aca550434ec40f64ed2b294ac25cbeaadb7fc583d84ce171ebb5280f093bc5983162b8739d46eb08976ddd28535e7d4a506b0c1f3d48efa7'
            '2691d64ed81a876ff6cad3de859520f30a5bb93468b493631b6d8ed9677ea43f29e0af7d0ed89c3794b5c57d4669458d5e126f825a71c4068de6847f45651fcc')
install=moodle.install
backup=("etc/webapps/moodle/config.php")

package() {
  depends=('php>=8.1' 'php-intl>=8.1' 'php-gd>=8.1' 'mariadb>=10.6.7' 'php-sodium>=8.1')
  cd "moodle-$pkgver"
  install -dm755 "${pkgdir}/usr/share/webapps/moodle"
  install -dm755 "${pkgdir}/etc/webapps/moodle"
  cp -r . "$pkgdir/usr/share/webapps/moodle/"
#  rm -rf $pkgdir/usr/share/webapps/moodle/{.[^.]*,.??*,*.txt,*.md}
  mv "$pkgdir/usr/share/webapps/moodle/config-dist.php" "$pkgdir/etc/webapps/moodle/config.php"
  sed -i "s,/home/example/moodledata,/var/lib/moodle,g" "$pkgdir/etc/webapps/moodle/config.php"
  ln -sf "/etc/webapps/moodle/config.php" "$pkgdir/usr/share/webapps/moodle/config.php"
  install -Dm 644 "${srcdir}/moodle-cron.service" "${pkgdir}/usr/lib/systemd/system/moodle-cron.service"
  install -Dm 644 "${srcdir}/moodle-cron.timer" "${pkgdir}/usr/lib/systemd/system/moodle-cron.timer"
  install -Dm 644 "${srcdir}/moodle.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/moodle.conf"
#  if you use angie instead of nginx:
#  sed -i "s,'nginx','Angie',g" /usr/share/webapps/moodle/lib/setuplib.php
}


