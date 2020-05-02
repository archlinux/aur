# Maintainer: Daniel Mason <daniel@m2.nz>
pkgbase=riot-desktop-beta-git
pkgver=v1.6.0.rc.6.r0.gbe76d2ef
pkgrel=1
pkgname=riot-desktop-beta-git
pkgdesc="A glossy Matrix collaboration beta client for the desktop."
arch=('any')
url="https://riot.im"
license=('Apache')
depends=('electron')
makedepends=('git' 'nodejs' 'jq' 'yarn')
conflicts=('riot-desktop' 'riot-desktop-beta' 'riot-web')
provides=('riot-desktop-beta')
backup=("etc/riot/config.json")
source=('riot-desktop-beta-git::git://github.com/vector-im/riot-web.git#tag=v1.6.0-rc.6'
        "riot-desktop-beta.desktop"
        "riot-desktop-beta.sh"
        "fetch-develop.deps.sh")
sha256sums=('SKIP'
            '8851c9ce0b25b56efa3d4d4120142f763df75166e3f01e4adda22252d3d59a89'
            'e566567a35fdf882b63c5acf332fdde30030bf1e98288a1078aca9c0b8413e64'
            '245ded7c413569217d76d354193f00edb0899000742e40620ba266d02c03e5bf')

pkgver() {
    cd "$srcdir/${pkgname}"

    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/${pkgname}"
    sed -i 's@https://riot.im/download/desktop/update/@null@g' electron_app/riot.im/config.json
}

build() {
    cd "$srcdir/${pkgname}"
    "${srcdir}"/fetch-develop.deps.sh "${srcdir}/npm-cache"

    yarn install --cache-folder="${srcdir}/npm-cache"

    rm -r node_modules/matrix-js-sdk; ln -s ../matrix-js-sdk node_modules/
    rm -r node_modules/matrix-react-sdk; ln -s ../matrix-react-sdk node_modules/
    
    yarn build
}

package() {
    cd "$srcdir/${pkgname}"

    install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/riot

    cp -r webapp/* "${pkgdir}"/usr/share/webapps/riot/
    install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/riot/
    ln -s /etc/webapps/riot/config.json "${pkgdir}"/usr/share/webapps/riot/
    echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/riot/version

    cd electron_app
    yarn --cache-folder "${srcdir}/npm-cache"
    cd ..

    install -d "${pkgdir}"{/usr/lib/riot/electron_app,/etc/webapps/riot}

    ln -s /usr/share/webapps/riot "${pkgdir}"/usr/lib/riot/webapp
    ln -s /etc/riot/config.json "${pkgdir}"/etc/webapps/riot/config.json

    install -Dm644 package.json -t "${pkgdir}"/usr/lib/riot
    cp -r electron_app/src "${pkgdir}"/usr/lib/riot/electron_app/
    cp -r electron_app/node_modules "${pkgdir}"/usr/lib/riot/electron_app/
    install -Dm644 electron_app/img/riot.png -t "${pkgdir}"/usr/lib/riot/electron_app/img
    install -Dm644 electron_app/riot.im/config.json -t "${pkgdir}"/etc/riot

    install -Dm644 "${srcdir}"/riot-desktop-beta.desktop "${pkgdir}"/usr/share/applications/riot-beta.desktop
    install -Dm755 "${srcdir}"/riot-desktop-beta.sh "${pkgdir}"/usr/bin/riot-desktop-beta

    install -Dm644 "${srcdir}"/riot-desktop-beta-git/webapp/themes/riot/img/logos/riot-im-logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/riot.svg
    for i in 16 24 48 64 96 128 256 512; do
        install -Dm644 electron_app/build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/riot.png
    done
}
