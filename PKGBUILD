# Maintainer: Simon Hanna<simon DOT Hanna AT serve-me DOT info>
pkgname=filebin
pkgver=0.9.8
pkgrel=1
pkgdesc="A pastebin service written in PHP"
arch=('any')
url="https://wiki.server-speed.net/projects/filebin"
license=('AGPL')
makedepends=('nodejs')
depends=('php'
         'pygmentize'        
         'perl-text-markdown'
         'python-ansi2html'
         'php-gd'
         'imagemagick'
         'qrencode'
)
backup=('etc/webapps/filebin/config-local.php'
        'etc/webapps/filebin/contact-info.php'
        'etc/webapps/filebin/database.php'
        'etc/webapps/filebin/memcached.php'
)
install=filebin.install
options=('!strip' 'emptydirs')
source=("https://github.com/Bluewind/filebin/archive/${pkgver}.tar.gz"
        'filebin-nginx.conf'
)
sha256sums=('df60f6dd49d5d01a82bff037bde80e9db681482eb851c06a735bf0637ddf6044'
            '5500d423d798478bf4f7bb0a147fe8a42b00e843513dd70665ec81f304a6c729')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps
  mkdir -p ${pkgdir}/etc/webapps/filebin
  cp -ra ${srcdir}/filebin-$pkgver/ ${pkgdir}/usr/share/webapps/filebin/
  cp filebin-nginx.conf ${pkgdir}/usr/share/webapps/filebin
  cd ${pkgdir}/usr/share/webapps/filebin
  cp application/config/example/{config-local,database,memcached}.php ${pkgdir}/etc/webapps/filebin
  ln -s /etc/webapps/filebin/{config-local,database,memcached}.php application/config
  cp data/local/examples/contact-info.php ${pkgdir}/etc/webapps/filebin
  ln -s /etc/webapps/filebin/contact-info.php data/local

  # optimizie javascript
  sh scripts/optimize_js.sh

  # removing unnecessary data for a production environment
	rm -rf .git
  rm -rf application/third_party/{test-more-php,mockery}
  rm -rf application/tests
  find . -name \*.gitignore -type f -delete 
}
