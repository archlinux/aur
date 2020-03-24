# Maintainer: hashworks<mail@hashworks.net>
pkgname=filebin
pkgver=3.4.3
pkgrel=2
pkgdesc="A pastebin service written in PHP"
arch=('any')
url="https://wiki.server-speed.net/projects/filebin"
license=('AGPL')
makedepends=('nodejs' 'git')
depends=('php'
         'pygmentize'
         'python-ansi2html'
         'php-gd'
         'imagemagick'
)
backup=('etc/webapps/filebin/config-local.php'
        'etc/webapps/filebin/contact-info.php'
        'etc/webapps/filebin/database.php'
        'etc/webapps/filebin/memcached.php'
)
install=filebin.install
options=('!strip' 'emptydirs')
source=("git+https://github.com/Bluewind/filebin.git"
        'filebin-nginx.conf'
        'filebin-php-fpm.conf'
        'filebin-file-cron.service'
        'filebin-file-cron.timer'
        'filebin-user-cron.service'
        'filebin-user-cron.timer'
)
sha256sums=('SKIP'
            '6ed404a3fbc28c6ab35bf1eba67ddcf46cfd48893237155e38d297a13020180c'
            '034442098d1608807bec2a03028a7c8bb9ae9d286c378e2f668b4aca3cc9d4e1'
            '78dd850467d89ac3d1b57fa72fe9ce8d736ce29a89abe624d9c4d2e168e59d19'
            '116b1e5031c22ad251c486b18ff203813f7227197ef853927ddc2de00e85cbe1'
            '36c82c506a058edc50b882200332c6a540aa68a5749919eb62dc6c633c47deb3'
            'd73e4b984ab95954bd18e08237c6aa8bec32ccc5699531727362e2c75ba9c25e')

build () {
  cd ${srcdir}/filebin
  git checkout ${pkgver}
  git submodule update --init --recursive
  scripts/optimize_js.sh
}

package() {
  mkdir -p ${pkgdir}/usr/share/webapps
  mkdir -p ${pkgdir}/etc/webapps/filebin
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  cp -ra ${srcdir}/filebin/ ${pkgdir}/usr/share/webapps/filebin/
  cp filebin-file-cron.service filebin-file-cron.timer filebin-user-cron.service filebin-user-cron.timer ${pkgdir}/usr/lib/systemd/system
  cp filebin-nginx.conf filebin-php-fpm.conf ${pkgdir}/usr/share/webapps/filebin
  cd ${pkgdir}/usr/share/webapps/filebin
  cp application/config/example/{config-local,database,memcached}.php ${pkgdir}/etc/webapps/filebin
  rm application/config/memcached.php
  ln -s /etc/webapps/filebin/{config-local,database,memcached}.php application/config
  cp data/local/examples/contact-info.php ${pkgdir}/etc/webapps/filebin
  ln -s /etc/webapps/filebin/contact-info.php data/local

  # http
  chown 33:33 ${pkgdir}/usr/share/webapps/filebin/data/uploads

  # removing unnecessary data for a production environment
  rm -rf .git
  rm -rf git-hooks
  rm -rf application/third_party/{test-more-php,mockery}
  rm -rf application/tests
  find . -name \*.gitignore -type f -delete 
}
