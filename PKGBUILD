# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.25.7
pkgrel=1
pkgdesc="Web-based issue tracking system"
arch=(any)
url="https://www.mantisbt.org/"
license=(GPL2)
depends=(php)
optdepends=(
  'curl: interface Twitter'
  'mariadb: use local MySQL server'
  'php-fpm: run in fastCGI process manager'
  'php-gd: generate captcha'
  'php-pgsql: use PostgreSQL database backend'
  'postgresql: use local PostgreSQL database'
  'uwsgi-plugin-php: run as application container'
)
backup=(
  etc/webapps/$pkgname/config_inc.php
  etc/webapps/$pkgname/custom_strings_inc.php
  etc/webapps/$pkgname/custom_relationships_inc.php
  etc/webapps/$pkgname/custom_functions_inc.php
  etc/webapps/$pkgname/custom_constants_inc.php
)
# building from source requires dead tooling for documentation:
# https://mantisbt.org/bugs/view.php?id=27140
# source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/release-$pkgver.tar.gz"
source=(
  https://downloads.sourceforge.net/project/$pkgname/mantis-stable/$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname.sysusers
  $pkgname.tmpfiles
  $pkgname.uwsgi
)
sha512sums=('5afbf0820dcd572c326abbde14564242bfbcf4d7937e6821ce71c228a57b05da259b0bea97b241aa71e4bb03a0d759eaf58cb61ea1cb0c3d8ea63da57e6aa816'
            '3fd4e7faad7774892abfd20006ae3efcd7b0ba315447da9cea8d7352d5fd1e7f0c558d3855ad4e667a0bfe6ae0d95d12c848a78d53312521a7f551f2edca723e'
            'b1b9145d1ba423055d5e45734a9d74c639b75ae5b5d580024b50626332a74830dd39b976de590549ff1c47c400ba4e1c20b27b69fb140f7d8527d8d281d0c7bd'
            '1b36d8956986360306eb15a9279c54eba46e74dfe0623dc26b3be3e8f409ab4f0afe6b34a9001cbeb9f33452fec5ccc8089a53352fa885894cc262ca9c12bc39')
b2sums=('4c28eeb1312c7a3f40fa9660dacf841574a5985df49b8a17ee629ed47c39b650c546c7121de12dea8309d0a14b1fb1ac0e8b71fdd1b19d102d165b9f4254bd98'
        'a533265d7bbbf1ae059a128baa43fb639e803094c62179252b416957fcfdb43a6068182d2bf29003c8fa55757a95bb1c3f054622bb0926055819c5dc989fe067'
        'c70218e3aae3f7af3d5e7989545f3a21b93c0eae80d40ea2f89571d4a6d9181ec069323478fa20f6db66137f0c26777dceb37d19aeccc2351229dc8be3fc4417'
        '2aa889fc1ded36b4229c3c77fad20c9699604f7d67bcecf09b0ba7cb81e01c0ba0cf309195475d6f96a28016bc2941e7241c4fce75db97056f77cbbe12d4e3bc')
install=$pkgname.install

prepare() {
  cd $pkgname-$pkgver
  # create customization files
  touch ../custom_{constants,functions,relationships,strings}_inc.php
  # remove useless scripts
  find vendor/ -type f -iname "*.py" -delete
}

package() {
  cd $pkgname-$pkgver
  # configuration
  install -vDm 640 config/config_inc.php.sample "$pkgdir/etc/webapps/$pkgname/config_inc.php"
  rm -v config/config_inc.php.sample
  install -vDm 644 ../*.php -t "$pkgdir/etc/webapps/$pkgname/"
  # doc
  install -vDm 644 ./*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  rm -v ./*.md
  # web application
  find . -type f -exec install -vDm 644 {} "$pkgdir/usr/share/webapps/$pkgname/"{} \;
  # symlink configuration and customization
  for config in {config,custom_{constants,functions,relationships,strings}}_inc.php ;do
    ln -sv /etc/webapps/$pkgname/$config "$pkgdir/usr/share/webapps/$pkgname/config/$config"
  done
  # tmpfiles.d
  install -vDm 644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  # sysusers.d
  install -vDm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  # uWSGI
  install -vDm 644 ../$pkgname.uwsgi "$pkgdir/etc/uwsgi/$pkgname.ini"
}

# vim: ts=2 sw=2 et:
