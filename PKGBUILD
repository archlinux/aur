# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Scott Dickson <scottfoesho@gmail.com>

pkgname=cops-mikespub-org
_name="cops"
_github_name="seblucas-cops"
provides=('cops')
conflicts=('cops')
pkgver=4.3.5
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
  'apache: Web server to serve COPS with'
  'nginx: Web server to serve COPS with'
  'cherokee: Web server to serve COPS with'
)
makedepends=(
  'composer'
  'libxml2' # for xmllint
)
backup=("etc/webapps/${_name}/local.php")
install="${_name}.install"
source=("${pkgname}_${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip")
sha256sums=('58a102e1e0001bd1a1fafbc85b11e60a45ed79380188f9396c8ea0df3143aa20')

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
    xmllint --xpath "//project/target/zip/fileset/exclude/@name" "build.xml" | \
        sed -e 's#^\s*name="##' -e 's#"$##' -e 's#/\*\*$##g' -e 's#\*\*#\*#g' | \
        while read -r exclude; do 
            echo "Removing $exclude"
	    rm -R $exclude || echo "This one does not exist, passing.";
        done
    install -d "$pkgdir/etc/webapps/${_name}/"
    install -d "$pkgdir/usr/share/webapps"
    cp -r ./ "$pkgdir/usr/share/webapps/${_name}"
    cp "$pkgdir/usr/share/webapps/${_name}/config/local.php.example" "$pkgdir/etc/webapps/${_name}/local.php"
    ln -s "/etc/webapps/${_name}/local.php" "$pkgdir/usr/share/webapps/${_name}/config/local.php"
    rm -R "${pkgdir}/usr/share/webapps/${_name}/tests" || echo "No tests folder to remove"
    rm -R "${pkgdir}/usr/share/webapps/${_name}/tools" || echo "No tools folder to remove"
}
