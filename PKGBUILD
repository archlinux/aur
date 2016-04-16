# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>

pkgname=selfoss-git
_gitname=selfoss
pkgver=2.15.r1.g7fdf087
pkgrel=1
pkgdesc="The new multipurpose rss reader, live stream, mashup, aggregation web application"
arch=('any')
url="http://selfoss.aditu.de/"
license=('GPL3')
depends=('php>=5.3' 'php-gd')
optdepends=('apache: server, depedency if not using lighttpd or nginx'
            'lighttpd: server, depedency if not using apache or nginx'
            'nginx: server, depedency if not using lighttpd or apache'
            'mariadb: database, depedency if not using postgresql or sqlite'
            'postgresql: database, depedency if not using mariadb or sqlite'
            'sqlite: database, depedency if not using postgresql or mariadb'
            'php-sqlite: dependency if using sqlite'
            'wget: for automatic updating feeds with cron'
            'curl: for automatic updating feeds with cron')
makedepends=('git')
provides=('selfoss')
conflicts=('selfoss')
backup=('etc/webapps/selfoss/config.ini'
        'usr/share/webapps/selfoss/config.ini')
install=${pkgname}.install
source=('git://github.com/SSilence/selfoss.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_gitname}
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"/${_gitname}
  git submodule init
  git submodule update
}

package() {
  rm -rf "${srcdir}"/${_gitname}/{.git,.gitignore,_docs,README.md}
  rm -rf "${srcdir}"/${_gitname}/data/fulltextrss/standard/.git*

  install -d "${pkgdir}"/usr/share/webapps/${_gitname}
  cp -af "${srcdir}"/${_gitname}/. "${pkgdir}"/usr/share/webapps/${_gitname}/

  # create config in /etc
  install -d "${pkgdir}"/etc/webapps/${_gitname}
  sed '4,$s/^/;/' "${pkgdir}"/usr/share/webapps/${_gitname}/defaults.ini > "${pkgdir}"/etc/webapps/${_gitname}/config.ini
  ln -sf /etc/webapps/${_gitname}/config.ini "${pkgdir}"/usr/share/webapps/${_gitname}/config.ini

  chmod 755 "${pkgdir}"/usr/share/webapps/${_gitname}/{data/cache,data/favicons,data/logs,data/sqlite,data/thumbnails,public}
  chown -R http: "${pkgdir}"/usr/share/webapps/${_gitname}
}

# vim:set ts=2 sw=2 et:
