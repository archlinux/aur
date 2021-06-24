# Maintainer: PY Chuang <pychuang@pm.me>
# Contributor: Arjun Nemani <nemaniarjun@gmail.com>
pkgname=textlint-rule-unexpanded-acronym
pkgver=1.2.4
pkgrel=2
pkgdesc='textlint rule that check unexpanded acronym'
arch=(any)
url="https://github.com/azu/textlint-rule-unexpanded-acronym"
license=('MIT')
depends=('textlint' )
makedepends=('npm')
source=(http://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
sha256sums=('33893ffa564c5802c0046ca825dec2fcc20192557d8f7d54332bef529e8f8150')
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
    install -Dm644 ${srcdir}/package/README.md -t ${pkgdir}/usr/share/doc/${pkgname}

    # install LICENSE
    install -Dm644 ${srcdir}/package/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}

    # change owner
    chown -R root:root ${pkgdir}
}
