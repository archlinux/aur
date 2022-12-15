# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Bader <Bad3r@pm.me>
pkgname=logseq-desktop-git
pkgver=0.8.9.r829.022f990f2
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://logseq.com"
license=("AGPL3")
depends=()
makedepends=("git" "yarn" "npm" "clojure" "nodejs>=16")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=(
    "${pkgname}::git+https://github.com/logseq/logseq.git#branch=master"
    "build.patch"
    "${pkgname%-git}.desktop"
)
md5sums=(
    "SKIP"
    "bba8acbfbe599e5e1621f9d91a003e21"
    "3f3c332592b47c84f3a44f582103151b"
)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s" "$(git describe --tags --match "[0-9].[0-9].[0-9]" --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/${pkgname}"

    # patch :parallel-build true in shadow-cljs.edn
    patch -p1 -i "${srcdir}/build.patch"

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
    yarn cljs:release-electron

    # packaging javescript files to an executable
    cd "${srcdir}/${pkgname}/static"
    yarn electron-forge package
}

package() {

    # important files are under static/out/Logseq-linux-x64 
    cd "${srcdir}/${pkgname}/static/out/Logseq-linux-x64"

    # create destination folder and copy files
    mkdir -p "${pkgdir}/opt/${pkgname}"
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
