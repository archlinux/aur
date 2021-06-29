# $Id: PKGBUILD 194888 2016-11-07 16:13:16Z spupykin $
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sébastien Luttringer

pkgname=dokuwiki-git
pkgver=20200729.r127.g66ed1b5e1
pkgrel=2
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
sha512sums=('SKIP'
            '0575ad5d1db22e931bcb878db86dc2b60a23bb7d2ce6dc6801906f1358e35a4bee16a70fed11cf67483d8739a216e6063012750792b733735256c4e0f7887e2e')
provides=("dokuwiki")
conflicts=("dokuwiki")

pkgver() {
  cd "dokuwiki"
  TAG=$(git tag -l --sort=-version:refname release_stable_* | head -n1)
  printf "%s.r%s.g%s" \
	$(sed -r 's/release_stable_(\S+)/\1/;s/-//g' <<< ${TAG}) \
	$(git rev-list --count HEAD..${TAG}) \
	$(git rev-parse --short HEAD)
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
