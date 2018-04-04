# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=nodejs-svgo
pkgver=1.0.5
pkgrel=1
pkgdesc='Nodejs-based tool for optimizing SVG vector graphics files'
arch=('any')
url='https://github.com/svg/svgo'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)

package() {
    npm install --user root -g --prefix="${pkgdir}"/usr svgo@${pkgver}

    appdir=/usr/lib/node_modules/svgo
    install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
    ln -s $(realpath -m --relative-to=/usr/share/licenses/${pkgname} ${appdir}/LICENSE) \
        "${pkgdir}"/usr/share/licenses/${pkgname}

    # Fix directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} \;

    # Clean up
    rm "${pkgdir}"${appdir}/Makefile
    sed -e "s|${srcdir}|/usr/lib|" -i "${pkgdir}"${appdir}/package.json
    find "${pkgdir}"${appdir}/node_modules \
        -name 'package.json' \
            -exec sed -e "s|${pkgdir}||" \
                -i {} \; \
        -or -name '.*' -prune -exec rm -r '{}' \; \
        -or -name '*.coffee' -exec rm '{}' \; \
        -or -name 'Cakefile' -exec rm '{}' \; \
        -or -name 'angular-sprintf.js' -exec rm '{}' \; \
        -or -name 'bin' -prune -exec rm -r '{}' \; \
        -or -name 'bower.json' -exec rm '{}' \; \
        -or -name 'demo' -prune -exec rm -r '{}' \; \
        -or -name 'dist' -prune -exec rm -r '{}' \; \
        -or -name 'example' -prune -exec rm -r '{}' \; \
        -or -name 'examples' -prune -exec rm -r '{}' \; \
        -or -name 'GNUmakefile' -exec rm '{}' \; \
        -or -name 'gruntfile.js' -exec rm '{}' \; \
        -or -name 'test' -prune -exec rm -r '{}' \; \
        -or -name 'tests' -prune -exec rm -r '{}' \;
}
