# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=0.5.5
pkgrel=2
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://gitlab.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm')
options=('!strip')
source=("${url}/-/archive/v${pkgver}/cospend-nc-v${pkgver}.tar.gz")
sha512sums=('09c202bdca7bc0ae1268b7660e5df790b326456439338328ff4ebf64370b7f1f5847bf0b66fa43f93c03d8484707be2fc819bbca15526b68a6c9d03337c33cce')
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
