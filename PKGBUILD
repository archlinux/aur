# Maintainer: Jerzy Mansarliński <jerzy at mansar dot eu>

pkgname=got-your-back
pkgver=1.82
pkgrel=1
pkgdesc="A command line tool for backing up your Gmail messages to your local computer."
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
    '9cd29c81c78fceebe1e7ed34627bb27d758a250ccae92aecf6bacf1da6dfed09' 
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
    find . -type f -name "*.py" -exec install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
}
