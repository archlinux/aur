# Maintainer: taotieren <admin@taotieren.com>

pkgbase=mfgtools-git
pkgname=(mfgtools{,-doc}-git)
pkgver=1.5.179.r0.g02da3bf
pkgrel=1
epoch=
pkgdesc="uuu (Universal Update Utility), mfgtools 3.0. Freescale/NXP I.MX Chip image deploy tools."
arch=('x86_64' 'aarch64')
url="https://github.com/nxp-imx/mfgtools"
license=('BSD-3-Clause')
groups=()
depends=(
    bzip2
    gcc-libs
    glibc
    libusb
    tinyxml2
    openssl
    zlib
    zstd)
makedepends=(
    cmake
    git
    ninja
    asciidoc
    dblatex
    findutils
    coreutils)
checkdepends=()
optdepends=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgbase}::git+${url}.git"
    "mfgtools-doc-git::git+${url}.wiki.git"
    "uuu-complete.bash")
noextract=()
sha256sums=('SKIP'
            'SKIP'
            'ffc8e32655ce574a4719c85c5c9a3530a5ec619e933fc801a291df8ec506a442')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgbase}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^uuu_//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgbase}" clean -dfx
#     cd "${srcdir}/${pkgbase}"
#     git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgbase}"
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=None \
          -GNinja

    ninja -C build
}

package_mfgtools-git() {
    provides=('uuu' 'mfgtool')
    conflicts=(${pkgname%-git})
    depends=(
    bzip2
    gcc-libs
    glibc
    libusb
    tinyxml2
    openssl
    zlib
    zstd)

    cd "${srcdir}/${pkgbase}/build"
     DESTDIR="$pkgdir/" ninja -C "${srcdir}/${pkgbase}/build" install
    install -Dm0644 "${srcdir}/uuu-complete.bash" "${pkgdir}/etc/bash_completion.d/uuu-complete.bash"
    install -Dm0644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -dm0755  "${pkgdir}/etc/udev/rules.d/"
    ./uuu/uuu -udev > "${pkgdir}/etc/udev/rules.d/70-uuu.rules"
}

package_mfgtools-doc-git() {
    pkgdesc+=" (doc)"
    depends=(asciidoc
        dblatex
        findutils
        coreutils)
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname}/"
    find . -type f -name "*.asciidoc" -exec sh -c 'mv "$0" "${0%.asciidoc}"' {} \;
    sed -i 's|=====|====|g' Release-Notes
    echo "<revhistory>" > UUU-docinfo.xml
    git log -n25 --reverse --format="format:<revision><revnumber>%h</revnumber><date>%cd</date><authorinitials>%an</authorinitials><revremark>%s</revremark></revision>" >> UUU-docinfo.xml
    echo "</revhistory>" >> UUU-docinfo.xml
    a2x -L -a docinfo UUU

    install -Dm0644 "${srcdir}/${pkgname}/UUU.pdf" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
