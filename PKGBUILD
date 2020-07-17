# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: Ruben Kelevra <ruben+aur-engelsystem@vfn-nrw.de>

pkgname=engelsystem
pkgver=3.1.0
_dl_pkgver="v$pkgver"
pkgrel=1
pkgdesc='tool for coordinating helpers and shifts on large events'
arch=(any)
url='https://engelsystem.de/index_en.html'
_download_url_base='https://github.com/engelsystem/engelsystem'
license=('GPL2')
depends=('php' 'mariadb' 'php-gettext-enabler' 'composer' 'npm')
optdepends=('nginx: a supported application server'
                       'apache: a supported application server')
makedepends=('yarn' 'nodejs')
backup=(usr/share/webapps/engelsystem/config/config.php)
install='engelsystem.install'
source=("${pkgname}-${pkgver}.tar.gz::${_download_url_base}/archive/${_dl_pkgver}.tar.gz"
              'engelsystem.install')
sha512sums=('12f931994d9ab73ffe6926228709f9774a80e11a14ad7cc64b99d4a6d68b03c897dd196e1ac3226aac91a1f755bfcd0af07700a0bb9f07e3b0aa6fdd262fdf8b'
                        'SKIP'
            )
# validpgpkeys=('SKIP') # version 3.0.0 is not signed on github

build() {
  cd "$srcdir"/"${pkgname}-${pkgver}"

  #this will fail with due to memory restrictions
  #composer install
  #yarn
  #echo "running test suit..."
  #./vendor/bin/phpunit --testsuite Unit > /dev/null

  composer install --no-dev
  composer dump-autoload --optimize
  yarn
  
  yarn build
}

package() {
  _instdir="$pkgdir"/usr/share/webapps/engelsystem
  
  cd "$srcdir"/"${pkgname}-${pkgver}"

  rm -f .gitignore .gitlab-ci.yml README.md

  cp -ax config/config.default.php config/config.php

  install -dm 644 "$_instdir"
  cp -dr --no-preserve=ownership . "$_instdir"
}
