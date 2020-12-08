# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=roundcubemail-git
pkgver=1.4.rc2.r633.gf979b0ce1
pkgrel=1
pkgdesc="A PHP web-based mail client"
arch=('any')
url="https://roundcube.net/"
license=('GPL')
depends=('php' 'php-gd')
makedepends=('systemd' 'composer' 'php-gd' 'git' 'unzip' 'java-runtime' 'nodejs-less-plugin-clean-css')
optdepends=('python2')
provides=('roundcubemail')
conflicts=('roundcubemail')
backup=('etc/webapps/roundcubemail/.htaccess'
        'etc/webapps/roundcubemail/apache.conf')
source=("git+https://github.com/roundcube/roundcubemail.git"
        "apache.conf")
sha256sums=('SKIP'
            'c90981405527ebaf153a407af6b8178b41d078bd4472d63b837b3b4cd5ae36b0')

pkgver() {
  cd "roundcubemail"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"/roundcubemail
  sed -i \
    -e "s|RCUBE_INSTALL_PATH . 'temp.*|'/var/cache/roundcubemail';|" \
    -e "s|RCUBE_INSTALL_PATH . 'logs.*|'/var/log/roundcubemail';|" \
    config/defaults.inc.php \
    program/lib/Roundcube/rcube_config.php

  sed -i 's!"dest": "program/js/tinymce"!"dest": "program/js/tinymce/langs"!' jsdeps.json

  mv composer.json-dist composer.json

}

build(){
  cd "$srcdir"/roundcubemail
  php -d extension=gd.so /usr/bin/composer install --no-dev --ignore-platform-req=ext-gd
  bin/install-jsdeps.sh
  bin/jsshrink.sh

  cd skins/elastic
  lessc --clean-css="--s1 --advanced" styles/styles.less > styles/styles.min.css
  lessc --clean-css="--s1 --advanced" styles/print.less > styles/print.min.css
  lessc --clean-css="--s1 --advanced" styles/embed.less > styles/embed.min.css

  cd ../..

  bin/updatecss.sh
  bin/cssshrink.sh
  #rm transifexpull.sh package2composer.sh importgettext.sh exportgettext.sh README.md INSTALL UPGRADING, LICENSE, CHANGELOG
  rm -rf tests/ public_html/ installer/ .tx*

}


package() {
  mkdir -p "$pkgdir"/etc/webapps/roundcubemail
  mkdir -p "$pkgdir"/usr/share/webapps
  cd "$pkgdir"/usr/share/webapps
  cp -ra "$srcdir"/roundcubemail roundcubemail
  cd roundcubemail

  mv .htaccess "$pkgdir"/etc/webapps/roundcubemail/
  ln -s /etc/webapps/roundcubemail/.htaccess .htaccess

  mv config "$pkgdir"/etc/webapps/roundcubemail/
  ln -s /etc/webapps/roundcubemail/config config

  install -Dm0644 "$srcdir"/apache.conf "$pkgdir"/etc/webapps/roundcubemail/apache.conf
  chown http:http "$pkgdir"/etc/webapps/roundcubemail/config/config.inc.php.sample
  chmod 0640 "$pkgdir"/etc/webapps/roundcubemail/config/config.inc.php.sample

  install -dm0750 -o http -g http "$pkgdir"/var/cache/roundcubemail
  install -dm0750 -o http -g http "$pkgdir"/var/log/roundcubemail

  rm -rf temp logs
  find "$pkgdir" -name .git -exec rm -rf {} \; || true

#  sed -i "s|"$srcdir"/roundcubemail/vendor/pear-pear.php.net/Console_CommandLine/data|/usr/share/webapps/roundcubemail/vendor/pear-pear.php.net|g" \
#    vendor/pear-pear.php.net/Console_CommandLine/Console/CommandLine/XmlParser.php

#  sed -i "s|"$srcdir"/roundcubemail|/usr/share/webapps/roundcubemail|g" \
#    vendor/pear-pear.php.net/Crypt_GPG/bin/crypt-gpg-pinentry \
#    vendor/pear-pear.php.net/Crypt_GPG/Crypt/GPG/Engine.php \
#    vendor/pear-pear.php.net/Crypt_GPG/Crypt/GPG/PinEntry.php
}
