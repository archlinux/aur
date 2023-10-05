# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Bader <Bader@unsigned.sh>
pkgname=logseq-desktop-git
pkgver=0.9.10.r16.62445434c
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://logseq.com"
repo="https://github.com/logseq/logseq.git"
branch=master # feat/db
dev=n # y
license=("AGPL3")
depends=()
makedepends=("git" "yarn" "npm" "clojure" "nodejs>=16")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=(
    "${pkgname}::git+${repo}#branch=${branch}"
    "${pkgname%-git}.desktop"
)
md5sums=(
    "SKIP"
    "53b345faf8839be86f1e3a5f9f0db8f1"
)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s" "$(git describe --tags --match "[0-9]*.[0-9]*.[0-9]*" --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/${pkgname}"

    # download required js modules
    yarn install

    # create and sync files to folder `static`
    yarn gulp:build

    # go to folder `static` and download required js modules in static
    cd "${srcdir}/${pkgname}/static"
    yarn install

    # go back to the top-level folder and download clojure dependencies
    cd "${srcdir}/${pkgname}"
    clojure -P -M:cljs
}

build() {
    cd "${srcdir}/${pkgname}"

    # build
    if [ $dev = "y" ]; then
        yarn cljs:dev-release-electron
    else
        yarn cljs:release-electron
    fi

    # packaging javescript files to an executable
    cd "${srcdir}/${pkgname}/static"
    yarn electron-forge package
}

package() {

    # change the folder permision
    chmod 755 "${srcdir}/${pkgname}/static/out/Logseq-linux-x64"

    # important files are under static/out/Logseq-linux-x64
    cd "${srcdir}/${pkgname}/static/out/Logseq-linux-x64"

    # create destination folder and copy files
    mkdir -p "${pkgdir}/opt/${pkgname}"
    chmod 755 "${pkgdir}/opt/${pkgname}"
    cp -a -r -u --verbose ./ "${pkgdir}/opt/${pkgname}"

    # create a soft link to the executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Logseq" "${pkgdir}/usr/bin/logseq"

    # create license folder and make soft links to actual license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}"

    # install readme and additional license file (the top-level AGPL3)
    cd "${srcdir}/${pkgname}"
    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # copy xdg desktop icon
    install -Dm644 "resources/icons/logseq.png" -t "${pkgdir}/usr/share/icons"

    # copy xdg desktop files
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
