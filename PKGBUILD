# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=messengerfordesktop-git
_pkgname=${pkgname/-git/}
pkgver=2.0.9.r0.g19a9000
pkgrel=1
pkgdesc="Beautiful desktop client for Facebook Messenger. Git version."
arch=('i686' 'x86_64')
url="http://messengerfordesktop.com/"
license=('MIT')
conflicts=('messengerfordesktop' 'messengerfordesktop-bin')
depends=('electron')
makedepends=('apm' 'npm' 'git')
options=(!emptydirs)
source=("${pkgname}::git+https://github.com/Aluxian/Facebook-Messenger-Desktop.git"
        "${_pkgname}.js"
        'use-system-electron.patch')
sha256sums=('SKIP'
            '55e6da47ddbf383fc8a6ef6e0aae5621b7800c8efe46422c1c352d6c029c1f45'
            '42c8639fb69f636cd818da550b64469c755ead1885ee22063774fb2192963207')

if [ "${CARCH}" == 'i686' ]; then
    _target=linux32
else
    _target=linux64
fi

pkgver() {
    cd ${pkgname}
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname}

    patch -Np1 -i "${srcdir}"/use-system-electron.patch
    sed -e 's|/opt/{{ name }}/||' \
        -i resources/linux/app.desktop \
        -i resources/linux/startup.desktop
}

build() {
    cd ${pkgname}

    npm install
    cd src
    ATOM_HOME="${PWD}" apm install --production
    cd ..

    ./node_modules/.bin/gulp build:${_target}
}

package() {
    cd ${pkgname}

    appdir=/usr/lib/${_pkgname}

    install -dm755 "${pkgdir}"${appdir}
    cp -r build/${_target}/opt/${_pkgname}/resources/app/* "${pkgdir}"${appdir}

    cp -r build/${_target}/usr/share "${pkgdir}"/usr

    install -Dm755 "${srcdir}"/${_pkgname}.js "${pkgdir}"/usr/bin/${_pkgname}

    install -Dm644 -t "${pkgdir}"/usr/share/licenses/${_pkgname} LICENSE.md

    # Clean up
    find "${pkgdir}"${appdir}/node_modules \
        -name 'package.json' \
            -exec sed -e "s|${srcdir}/Messenger-for-Desktop-${pkgver}/src|${appdir}|" \
                -i {} \; \
        -or -name '.*' -prune -exec rm -r '{}' \; \
        -or -name '*.a' -exec rm '{}' \; \
        -or -name '*.cc' -exec rm '{}' \; \
        -or -name '*.h' -exec rm '{}' \; \
        -or -name '*.gyp' -exec rm '{}' \; \
        -or -name '*.gypi' -exec rm '{}' \; \
        -or -name '*.Makefile' -exec rm '{}' \; \
        -or -name '*.mk' -exec rm '{}' \; \
        -or -name '*.mm' -exec rm '{}' \; \
        -or -name 'appveyor.yml' -exec rm '{}' \; \
        -or -name 'benchmark' -prune -exec rm -r '{}' \; \
        -or -name 'bin' -prune -exec rm -r '{}' \; \
        -or -name 'bin.js' -exec rm '{}' \; \
        -or -name 'build.js' -exec rm '{}' \; \
        -or -name 'cli.js' -exec rm '{}' \; \
        -or -name 'deps' -prune -exec rm -r '{}' \; \
        -or -name 'doc' -prune -exec rm -r '{}' \; \
        -or -name 'docs' -prune -exec rm -r '{}' \; \
        -or -name 'example' -prune -exec rm -r '{}' \; \
        -or -name 'examples' -prune -exec rm -r '{}' \; \
        -or -name 'hunspell' -prune -exec rm -r '{}' \; \
        -or -name 'Makefile' -exec rm '{}' \; \
        -or -name 'obj.target' -prune -exec rm -r '{}' \; \
        -or -name 'test' -prune -exec rm -r '{}' \; \
        -or -name 'tests' -prune -exec rm -r '{}' \; \
        -or -name 'tools' -prune -exec rm -r '{}' \;
}
