# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=logseq-desktop-git
pkgver=0.5.4.r153.c74fc2002
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=("AGPL3")
depends=()
makedepends=("git" "yarn" "npm" "clojure" "nodejs>=16")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "logseq-desktop-bin")
source=(
    "${pkgname}::git+https://github.com/logseq/logseq"
    "build.patch"
    "logseq-desktop.desktop"
)
md5sums=(
    "SKIP"
    "aad20b738ccd8965d7fd22cb5f34a6e1"
    "3a5ebb330fd33e59f1cc56690df1995d"
)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s" "$(git describe --tags --match "[0-9].[0-9].[0-9]" --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/${pkgname}"

    # this patch make the build process use system's electron
    patch -p1 -i "${srcdir}/build.patch"

    # patch :parallel-build true in shadow-cljs.edn

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
    yarn cljs:release

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

    # copy xdg desktop files
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -Dm644 "logseq-desktop.desktop" -t "${pkgdir}/usr/share/applications"
}
