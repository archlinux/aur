# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=moodle-stable
pkgver=4.5.1
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
sha512sums=('82997c9932ff746d5d76eadf2a74147432a636d283833a166747eaa60151f556b3471387ead26737b1c18b8714a2de65e6a96c1270dde8a5083c5238f1316c6c'
            'c23ef22cea5a8a8626d81cd754769c801b969c742b0cc034ead6e9e8048b3c17d8b8636c3527ca3bc5afd98c9aff507ec8ea03c7213cf855f6473c88cb26f160'
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


