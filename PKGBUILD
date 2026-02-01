# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Scott Dickson <scottfoesho@gmail.com>

pkgname=cops-mikespub-org
_name="cops"
_github_name="seblucas-cops"
provides=('cops')
conflicts=('cops')
pkgver=4.0.2
pkgrel=1
pkgdesc='Lightweight Calibre OPDS (and HTML) PHP Server (mikespub.org fork)'
arch=('any')
url="https://github.com/mikespub-org/$_github_name"
license=('GPL-2.0-or-later')
depends=(
  'php'
  'php-gd'
  'php-intl'
  'php-sqlite'
)
optdepends=(
  'apache: Web server to run COPS'
  'nginx: Web server to run COPS'
  'cherokee: Web server to run COPS'
)
makedepends=('composer')
backup=("etc/webapps/${_name}/local.php")
install="${_name}.install"
source=("${pkgname}_${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip")
sha256sums=('ac05055cfffa3ed27243d71c1a72a28dd7807915800dbc9d77c54e3cdf0cb523')

prepare () {
    cd "${_github_name}-$pkgver"
    # The external packages are requirements, and they cause composer errors if
    # building in chroot, but we have them in deps so ignore them here
    composer update --no-dev \
	--ignore-platform-req=ext-gd \
	--ignore-platform-req=ext-intl \
	--ignore-platform-req=ext-pdo_sqlite \
	--ignore-platform-req=ext-iconv
}

build () {
    cd "${_github_name}-$pkgver"
    composer install --no-dev --optimize-autoloader \
	--ignore-platform-req=ext-gd \
	--ignore-platform-req=ext-intl \
	--ignore-platform-req=ext-pdo_sqlite \
	--ignore-platform-req=ext-iconv
}

package () {
    cd "${_github_name}-$pkgver"
    install -d "$pkgdir/etc/webapps/${_name}/"
    install -d "$pkgdir/usr/share/webapps"
    cp -r ./ "$pkgdir/usr/share/webapps/${_name}"
    cp "$pkgdir/usr/share/webapps/${_name}/config/local.php.example" "$pkgdir/etc/webapps/${_name}/local.php"
    ln -s "/etc/webapps/${_name}/local.php" "$pkgdir/usr/share/webapps/${_name}/config/local.php"
    rm -R "${pkgdir}/usr/share/webapps/${_name}/tests"
    rm -R "${pkgdir}/usr/share/webapps/${_name}/tools"
}
