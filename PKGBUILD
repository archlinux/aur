# Maintainer: Ruben Kelevra <ruben+aur-engelsystem@vfn-nrw.de>

pkgname=engelsystem
pkgver=3.0.0
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
sha512sums=('1508ea888eda23b3f5e8d600c2793556942b9849c75b1341d9c5c17db4a4db207f7c5840363150f12dfd11751307738f8856b7b911dd55d0bb63618af9113474'
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
