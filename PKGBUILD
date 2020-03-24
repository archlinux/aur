# Maintainer: Simon Hanna<simon DOT Hanna AT serve-me DOT info>
pkgname=filebin
pkgver=3.4.3
pkgrel=1
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
)
sha256sums=('SKIP'
            '5500d423d798478bf4f7bb0a147fe8a42b00e843513dd70665ec81f304a6c729')

build () {
  cd ${srcdir}/filebin
  git checkout ${pkgver}
  git submodule update --init --recursive
  scripts/optimize_js.sh
}

package() {
  mkdir -p ${pkgdir}/usr/share/webapps
  mkdir -p ${pkgdir}/etc/webapps/filebin
  cp -ra ${srcdir}/filebin/ ${pkgdir}/usr/share/webapps/filebin/
  cp filebin-nginx.conf ${pkgdir}/usr/share/webapps/filebin
  cd ${pkgdir}/usr/share/webapps/filebin
  cp application/config/example/{config-local,database,memcached}.php ${pkgdir}/etc/webapps/filebin
  rm application/config/memcached.php
  ln -s /etc/webapps/filebin/{config-local,database,memcached}.php application/config
  cp data/local/examples/contact-info.php ${pkgdir}/etc/webapps/filebin
  ln -s /etc/webapps/filebin/contact-info.php data/local

  # removing unnecessary data for a production environment
  rm -rf .git
  rm -rf application/third_party/{test-more-php,mockery}
  rm -rf application/tests
  find . -name \*.gitignore -type f -delete 
}
