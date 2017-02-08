# $Id: PKGBUILD 194888 2016-11-07 16:13:16Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sébastien Luttringer

pkgname=dokuwiki-git
pkgver=release_candidate_2009.12.02.r5954.g9c5f31158
pkgrel=1
pkgdesc='Simple to use and highly versatile Open Source wiki software'
arch=('any')
url='https://www.dokuwiki.org/'
license=('GPL')
depends=('php')
backup=('etc/webapps/dokuwiki/.htaccess'
        'etc/httpd/conf/extra/dokuwiki.conf')
options=('!strip')
source=("git+https://github.com/splitbrain/dokuwiki.git"
        'apache.example.conf')
md5sums=('SKIP'
         'c5bed40abf5bb737bad8df29bb7020dc')
provides=("dokuwiki")
conflicts=("dokuwiki")

pkgver() {
  cd "dokuwiki"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgdir"
  install -dm0755 usr/share/webapps var/lib/dokuwiki etc/webapps
  cp -a "$srcdir"/dokuwiki usr/share/webapps/dokuwiki

  # move data in var
  mv usr/share/webapps/dokuwiki/data var/lib/dokuwiki
  ln -s {../../../../../var/lib/dokuwiki,usr/share/webapps/dokuwiki}/data

  # move plugins in var
  mv usr/share/webapps/dokuwiki/lib/plugins var/lib/dokuwiki
  ln -s {../../../../../../var/lib/dokuwiki,usr/share/webapps/dokuwiki/lib}/plugins

  # move templates in var
  mv usr/share/webapps/dokuwiki/lib/tpl var/lib/dokuwiki
  ln -s {../../../../../../var/lib/dokuwiki,usr/share/webapps/dokuwiki/lib}/tpl

  # move config in /etc
  mv usr/share/webapps/dokuwiki/conf etc/webapps/dokuwiki
  chmod g=rwx etc/webapps/dokuwiki
  ln -s ../../../../../etc/webapps/dokuwiki usr/share/webapps/dokuwiki/conf

  # inform update on changes.log
  touch var/lib/dokuwiki/data/changes.log
  chmod 0644 var/lib/dokuwiki/data/changes.log

  # use default htaccess
  cp usr/share/webapps/dokuwiki/.htaccess.dist etc/webapps/dokuwiki/.htaccess
  ln -s /etc/webapps/dokuwiki/.htaccess usr/share/webapps/dokuwiki/.htaccess

  # fix rights and ownership
  chown http:http var/lib/dokuwiki/plugins
  chown -R http:http var/lib/dokuwiki/data
  chown -R http:http etc/webapps/dokuwiki

  # apache config
  install -Dm0644 "$srcdir"/apache.example.conf etc/httpd/conf/extra/dokuwiki.conf

  # php.ini
#  install -dm0755 "$pkgdir"/etc/php/conf.d/
#  echo 'open_basedir = ${open_basedir}:/etc/webapps/dokuwiki/:/var/lib/dokuwiki/' >"$pkgdir"/etc/php/conf.d/dokuwiki.ini
}

# vim:set ts=2 sw=2 et:
