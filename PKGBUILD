# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=1.0.0
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://gitlab.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm')
options=('!strip')
source=("${url}/-/archive/v${pkgver}/cospend-nc-v${pkgver}.tar.gz")
sha512sums=('8c2e58aa621c50dac56872803e5633e4b73d7e4bd424c2b802e8d2fcc1794ed364d4e38de0b441f7683a7e39676006912a1f45b090115f8d020215bb52f1fabc')
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
