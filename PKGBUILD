# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Contributor: danieltetraquark

pkgname=grocy-git
_pkgname=grocy
pkgver=3.3.0.r11.g845e69fb
pkgrel=1
pkgdesc="Web-based self-hosted groceries & household management solution for your home"
depends=('php' 'php-sqlite' 'php-gd' 'php-intl')
makedepends=('composer' 'yarn' 'git')
license=('MIT')
arch=('any')
options=(!strip)
url="https://grocy.info/"
provides=('grocy')
conflicts=('grocy')
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git")
sha256sums=('SKIP')
backup=("etc/webapps/${_pkgname}/config.php")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"

    # composer need to have php-gd extension enabled, otherwise it will fail for a dependency of grocy.
    # note: you may need to adjust your php open_basedir setting, so that php can run!
    php -n -dextension=gd.so /usr/bin/composer install --no-interaction --no-dev --optimize-autoloader --ignore-platform-reqs
    php /usr/bin/composer clear-cache 

    yarn install --modules-folder public/node_modules --production
    yarn cache clean
}

package() {
    cd "$srcdir/$_pkgname"

    _instdir="$pkgdir/usr/share/webapps/${_pkgname}"
    install -d "$_instdir"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -ra . "$_instdir"

    install -d "$pkgdir/var/lib/webapps"
    mv "$pkgdir/usr/share/webapps/${_pkgname}/data" "$pkgdir/var/lib/webapps/${_pkgname}"
    ln -s "/var/lib/webapps/${_pkgname}" "$pkgdir/usr/share/webapps/${_pkgname}/data"
    chown -R http:http "$pkgdir/usr/share/webapps/${_pkgname}/data"

    install -d "$pkgdir/etc/webapps/${_pkgname}"
    ln -s "/etc/webapps/${_pkgname}/config.php" "$pkgdir/var/lib/webapps/${_pkgname}/config.php"

    install -Dm644 config-dist.php "$pkgdir/etc/webapps/${_pkgname}/config.php"
}
