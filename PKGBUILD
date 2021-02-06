# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=1.2.9
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://github.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud>=20.0.0')
makedepends=('npm')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a1e8ebd40114fb4a3bf4539c8b7b9984afb999811c2969ce5a84c2a7114548872fc93bd3ce16d9fa6dbf132eb982f5f221dcb1f709177e38e594ae958795db06')
_root="${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"

build() {
    cd "${srcdir}/cospend-nc-${pkgver}"
    make
}

package() {
    mkdir -p "${pkgdir}/${_root}"
    # Copy main files
    cd "${srcdir}/cospend-nc-${pkgver}"
    cp -r . "${pkgdir}/${_root}"
    cd "${pkgdir}/${_root}"
    rm -rf .git appinfo/signature.json *.swp build .gitignore \
            .travis.yml .scrutinizer.yml CONTRIBUTING.md \
            composer.{json,lock,phar} package{,-lock}.json \
            js/node_modules node_modules src translationfiles \
            webpack.* .gitlab-ci.yml crowdin.yml tools l10n \
            makefile screenshots phpunit*xml tests ci vendor/bin
    # Create translation info
    cd "${srcdir}/cospend-nc-${pkgver}/l10n/descriptions"
    ./gen_info.xml.sh
    install info.xml "${pkgdir}/${_root}/appinfo/"
    cp -r "${srcdir}/cospend-nc-${pkgver}/l10n" "${pkgdir}/${_root}/l10n"
}

