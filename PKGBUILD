# Maintainer: PY Chuang <pychuang@pm.me>
# Contributor: Arjun Nemani <nemaniarjun@gmail.com>
pkgname=textlint-rule-write-good
pkgver=1.6.2
pkgrel=2
pkgdesc='textlint rule to check your English style with write good'
arch=(any)
url='https://github.com/textlint-rule/textlint-rule-write-good'
license=('MIT')
depends=('nodejs' 'textlint')
makedepends=('npm')
source=(http://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
sha256sums=('898faf1f76a641392bf874d573dd291d346966338fdb77b419f6e52e44285e5f')

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
        --user root \
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
