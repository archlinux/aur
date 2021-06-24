# Maintainer: PY Chuang <pychuang@pm.me>
pkgname=textlint-rule-ginger
pkgver=2.2.1
pkgrel=2
pkgdesc='textlint rule to check your English grammar with Ginger Proofreading'
arch=(any)
url='https://github.com/textlint-rule/textlint-rule-ginger'
license=('MIT')
depends=('nodejs' 'textlint')
makedepends=('npm')
source=(http://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
sha256sums=('464cbe8a5e1e2fe550b875da5af1c185a5f91cbd6ffcca6871be8dbf06cd3b3e')

package() {
    cd ${srcdir}

    # remove cache folder
    if [[ -d npm-cache ]]; then rm -rf npm-cache; fi

    # npm install with the local tarball
    npm install \
        --cache ${srcdir}/npm-cache \
        --production \
        --no-optional \
        --no-audit \
        -g \
        --prefix ${pkgdir}/usr \
        ${pkgname}-${pkgver}.tgz

    # change the destination of references
    grep -Rl ${pkgdir} ${pkgdir} | xargs -r sed -i "s@${pkgdir}@@g"
    grep -Rl ${srcdir} ${pkgdir} | xargs -r sed -i "s@\"${srcdir}.*\"@\"\"@g"

    # install README
    install -Dm644 ${srcdir}/package/ReadMe.md -t ${pkgdir}/usr/share/doc/${pkgname}

    # install LICENSE (splitting sed to several lines for readability)
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    curl -sL http://nodaguti.mit-license.org -o ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    sed -i -e '/<article>/,/<\/article>/!d' ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    sed -i -e 's/^[[:blank:]]*//g; s/<[^>]*>//g' ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    sed -i -e '/./,$!d' ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    sed -i -e '${/^$/d;}' ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # change owner
    chown -R root:root ${pkgdir}
}
