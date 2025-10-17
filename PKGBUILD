# Maintainer: jopicornell <jopicornell@pm.me>
# Contributor: tjbp <archlinux at tjbp dot net>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: pohl7589

pkgname=php56-composer
epoch=1
pkgver=2.2.25
pkgrel=1
pkgdesc="Dependency Manager for PHP 5.6"
arch=('any')
license=('MIT')
url='https://getcomposer.org/'
depends=('php56-cli')
makedepends=('git')
source=(
    "${pkgname}::git+https://github.com/composer/composer.git#tag=${pkgver}"
    'php56.patch'
    'https://raw.githubusercontent.com/composer/getcomposer.org/1c8d2b11a3b7ba1bff7fce9c936cd36c61ddb791/web/installer'
)
sha384sums=(
    'SKIP'
    '7c0ceb28e5f8a4e9ea64a0fad3eaecd8234b46e7a71a7f42cde87a8c82d865ae4858bb1133c268cbf941d4fa52a93a96'
    'ed0feb545ba87161262f2d45a633e34f591ebb3381f2e0063c345ebea4d228dd0043083717770234ec00c5a9f9593792'
)

prepare() {
    php56 "${srcdir}/installer" --quiet

    cd "${srcdir}/${pkgname}"

    php56 "${srcdir}/composer.phar" -n install --no-dev
}

build() {
    cd "${srcdir}/${pkgname}"

    patch -p0 < "${srcdir}/php56.patch"

    php56 -d phar.readonly=Off bin/compile
}

check() {
    cd "${srcdir}/${pkgname}"

    bin/composer -n install
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 composer.phar "${pkgdir}/usr/bin/composer56"
}
