# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=min
pkgver=1.29.0
_electronver=24
pkgrel=1
pkgdesc='A fast, minimal browser that protects your privacy'
arch=('x86_64')
url='https://minbrowser.org/'
license=('Apache')
depends=("electron${_electronver}" 'libsecret')
makedepends=('git' 'npm')
options=(!emptydirs)
source=(https://github.com/minbrowser/min/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        'min.desktop'
        'min.js'
        'icon.patch')
sha256sums=('b9d71a460a4bd65d54299c3cc4a5e62072883bc0c5516beeb001e07e50a50525'
            'a069caac07638ca2bafde5f96a4db646ec7484741ff9b44788c2e159b5142650'
            '58925a72ab69500d4b2b2b9fe216aca44276423dfcb337063516fb8024a01b0a'
            '3cff8e5613907c3776115ccdb14f37a4899c96874f662281a630912d893c1d87')

prepare() {
    cd $pkgname-$pkgver

    patch -Np1 -i "${srcdir}"/icon.patch
}

build() {
    cd $pkgname-$pkgver

    npm install
    npm run build
    rm -r node_modules

    npm install --production --no-optional
}

package() {
    cd $pkgname-$pkgver

    appdir=/usr/lib/${pkgname}

    install -dm755 "${pkgdir}"${appdir}
    cp -r * "${pkgdir}"${appdir}

    install -dm755 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
    mv icons/icon256.png \
        "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

    install -d "${pkgdir}/usr/bin"
    sed "s|@ELECTRON@|electron${_electronver=19}|" "${srcdir}/${pkgname}.js" \
        > "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}"/${pkgname}.desktop \
            "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    # Clean up
    rm "${pkgdir}"${appdir}/dist/build.js
    rm -r "${pkgdir}"${appdir}/icons
    rm -r "${pkgdir}"${appdir}/localization
    rm -r "${pkgdir}"${appdir}/main
    rm -r "${pkgdir}"${appdir}/scripts
    find "${pkgdir}"${appdir} \
        -name "package.json" \
            -exec sed -e "s|${srcdir}/${pkgname}|${appdir}|" \
                -i {} \; \
        -or -name ".*" -prune -exec rm -r '{}' \; \
        -or -name "*.Makefile" -exec rm '{}' \; \
        -or -name "*.h" -exec rm '{}' \; \
        -or -name "*.c" -exec rm '{}' \; \
        -or -name "*.cc" -exec rm '{}' \; \
        -or -name "*.gypi" -exec rm '{}' \; \
        -or -name "*.mk" -exec rm '{}' \; \
        -or -name "Gruntfile.js" -exec rm '{}' \; \
        -or -name "Makefile" -exec rm '{}' \; \
        -or -name "bin" -prune -exec rm -r '{}' \; \
        -or -name "bin.js" -exec rm '{}' \; \
        -or -name "bower.json" -exec rm '{}' \; \
        -or -name "cli.js" -exec rm '{}' \; \
        -or -name "cmd.js" -exec rm '{}' \; \
        -or -name "coffee" -prune -exec rm -r '{}' \; \
        -or -name "example" -prune -exec rm -r '{}' \; \
        -or -name "examples" -prune -exec rm -r '{}' \; \
        -or -name "gulpfile.js" -exec rm '{}' \; \
        -or -name "man" -prune -exec rm -r '{}' \; \
        -or -name "obj.target" -prune -exec rm -r '{}' \; \
        -or -name "scripts" -prune -exec rm -r '{}' \; \
        -or -name "test" -prune -exec rm -r '{}' \; \
        -or -name "tests" -prune -exec rm -r '{}' \;
}
