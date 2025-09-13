# Maintainer: Jerzy Mansarliński <jerzy at mansar dot eu>

pkgname=got-your-back
pkgver=1.95
pkgrel=1
pkgdesc="A command line tool for backing up Gmail messages. Known as GYB."
arch=(any)
url=https://github.com/GAM-team/got-your-back
license=(Apache-2.0)
depends=(
    'bash' 
    'python>=3.13' 
    'python-httplib2>=0.17.0' 
    'python-google-api-python-client>=2.0' 
    'python-google-auth>=1.11.2'
    'python-google-auth-httplib2'
    'python-google-auth-oauthlib>=0.4.1'
    'python-packaging>=25.0'
)
provides=(gyb)
conflicts=(python-gyb-git)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "001-default-config-dir.patch"
    )
sha256sums=(
    '96d8ec7c63bb33e5484f5ad6ac28c5762e9f2a2296d55955e0f48527ebcde45c'
    'e89329299e2040d0f565a69f05dcda0da7465d0f795d39c59a7b0646ab9c858b'
    )

prepare () {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i ../001-default-config-dir.patch
}

package () {
    echo "#!/bin/sh" > ./gyb
    echo "python /usr/lib/${pkgname}/gyb.py \"\$@\"" >> ./gyb 

    install -Dm755 ./gyb ${pkgdir}/usr/bin/gyb
    install -dm700 ${pkgdir}/var/lib/gyb/

    cd "${pkgname}-${pkgver}"
    find . -type f -name "*.py" -not -path "./tools/hooks/*" -exec install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
}
