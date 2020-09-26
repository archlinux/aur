# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=1.1.0
pkgrel=2
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://gitlab.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud>=20.0.0')
makedepends=('npm')
options=('!strip')
source=("${url}/-/archive/v${pkgver}/cospend-nc-v${pkgver}.tar.gz")
sha512sums=('24b2c3e1604934ccb67399dc928468f499fd0f8e677efd6af9912ea2244d8d3cc66a49e36292a54f80d4ec7ab63bde0041592da6b9d1b4af204f562c59d7d165')
_root="${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"

build() {
    cd "${srcdir}/cospend-nc-v${pkgver}"
    make
}

package() {
    mkdir -p "${pkgdir}/${_root}"
    # Copy main files
    cd "${srcdir}/cospend-nc-v${pkgver}"
    cp -r . "${pkgdir}/${_root}"
    cd "${pkgdir}/${_root}"
    rm -rf .git appinfo/signature.json *.swp build .gitignore \
            .travis.yml .scrutinizer.yml CONTRIBUTING.md \
            composer.{json,lock,phar} package{,-lock}.json \
            js/node_modules node_modules src translationfiles \
            webpack.* .gitlab-ci.yml crowdin.yml tools l10n \
            makefile screenshots phpunit*xml tests ci vendor/bin
    # Create translation info
    cd "${srcdir}/cospend-nc-v${pkgver}/l10n/descriptions"
    ./gen_info.xml.sh
    install info.xml "${pkgdir}/${_root}/appinfo/"
    cp -r "${srcdir}/cospend-nc-v${pkgver}/l10n" "${pkgdir}/${_root}/l10n"
}
