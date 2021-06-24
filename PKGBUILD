# Maintainer: PY Chuang <pychuang@pm.me>
pkgname=textlint-rule-proselint
pkgver=1.0.1
pkgrel=2
pkgdesc='Proselint wrapper for textlint'
arch=(any)
url='https://github.com/textlint-rule/textlint-rule-proselint'
license=('MIT')
depends=('textlint' 'proselint')
makedepends=('npm')
source=(http://registry.npmjs.org/@textlint-rule/${pkgname}/-/${pkgname}-${pkgver}.tgz)
sha1sums=('88a63c729d263a0082c7c34625d911eddcaf52c2')

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
