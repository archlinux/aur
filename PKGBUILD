# $Id$
# Maintainer: Guillaume Friloux <guillaume@friloux.me>

pkgname=movim-git
pkgver=r4254
pkgrel=1
pkgdesc="Movim is a decentralized social network, written in PHP and HTML5 and based on the XMPP standard protocol."
arch=('any')
url="https://movim.eu/"
licence=('AGPL')
depends=('php-gd' 'php-imagick')
optdepends=('mariadb: to use the MySQL database backend')
makedepends=('php-composer' 'git' 'mercurial')
source=("$pkgname"::'git+https://github.com/edhelas/movim'
        'movim.env'
        'movim.service')
md5sums=('SKIP'
         'b0f837f56d80f7da3e8b01315890ec2e'
         '01c4b71e1c0c13363f8158922280b543')
backup=('etc/default/movim')

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s' "$(git rev-list --count HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  find . -type f -name .gitignore -delete
  find $(pwd) -name .git -type d -exec rm -rf {} +
  rm -fr INSTALL.md README.md .dir-locals.el \
         debian CHANGELOG.md .bzrignore build.sh tests
}

build() {
  msg "Starting build..."
  cd "$srcdir/$pkgname"
  composer install
}

package() {
  #find ${srcdir}/${pkgname}/ -type d -name .git -exec rm -rf {} \;

  # install license
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${srcdir}/${pkgname}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}

  # install project
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/
  chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}
  find ${pkgdir}/usr/share/webapps/${pkgname} -type f -exec chmod 0664 {} \;
  find ${pkgdir}/usr/share/webapps/${pkgname} -type d -exec chmod 0755 {} \;

  # move config to /etc
  install -d ${pkgdir}/etc/webapps/${pkgname}
  mv ${pkgdir}/usr/share/webapps/${pkgname}/config ${pkgdir}/etc/webapps/${pkgname}/config
  chown -R http:http ${pkgdir}/etc/webapps/${pkgname}
  ln -s /etc/webapps/${pkgname}/config ${pkgdir}/usr/share/webapps/${pkgname}/config
  
  # Add nginx example conf file

  # Add systemd service
  install -d ${pkgdir}/etc/default
  install -m 744 ${srcdir}/movim.env ${pkgdir}/etc/default/movim
  install -Dm644 ${srcdir}/movim.service "${pkgdir}"/usr/lib/systemd/system/movim.service
}
