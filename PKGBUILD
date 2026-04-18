# Maintainer: Ismet Togay <ismet.togay+archlinux@gmail.com>

pkgname=akia-bin
pkgver=6.8.7
pkgrel=1
pkgdesc="TÜBİTAK AKİS smart card application"
arch=('x86_64')
url='https://akiskart.bilgem.tubitak.gov.tr/destek/'
license=('LicenseRef-custom')
depends=(
    'java-runtime>=8'
    'pcsclite'
    'ccid'
    'hicolor-icon-theme'
)
optdepends=(
    'pcsc-tools: smart card reader debugging utilities'
)
makedepends=(
    'icoutils'
)
provides=("akia=${pkgver}")
conflicts=('akia')
replaces=('akia')
install="${pkgname%-bin}.install"

# Upstream serves the .deb inside a WordPress-uploaded .zip whose path embeds
# the upload year/month. Bumping pkgver requires updating _debver and the
# _debyear/_debmonth segments below, then running `updpkgsums`.
_debver="${pkgver//./_}"
_debyear=2026
_debmonth=04

source=(
    "${pkgname}-${pkgver}.deb.zip::${url%/destek/}/wp-content/uploads/sites/33/${_debyear}/${_debmonth}/Akia_linux_${_debver}.deb_.zip"
    'akia.sh'
    'akia.desktop'
    'akia.install'
    'LICENSE'
)
sha256sums=(
    '0d971eb5200a119b779b732144b4d9727bf1841fcb5c46bf3c0316f4df9d3e15'
    'f5854b72bc40f08747e5c9c7fa35fb890d28265eadb8efd9adb8dfda0d6bfa20'
    '2be59701fc5064051bb848eceb896bc90e25f5a141651576ce92c274fb01daf4'
    '82bda1d0f457d0e25db5186d1526b59daeb0cdab7db33a874fb3dc66bc87985a'
    '5afd2398f945b9d067e2e9834da1ee7d0a62fb3ed98bebbe13c65c7536697410'
)

# NOTE: namcap will warn that libakisp11.so lacks FORTIFY; this is a
# pre-built vendor binary we cannot recompile, so the warning is accepted.

prepare() {
    cd "${srcdir}"

    bsdtar -xf "${pkgname}-${pkgver}.deb.zip"

    local debfile
    debfile=$(find . -maxdepth 3 -type f -name "Akia_linux_${_debver}.deb" | head -n1)
    if [ -z "${debfile}" ]; then
        echo "error: could not locate extracted .deb" >&2
        return 1
    fi

    bsdtar -xf "${debfile}"
    bsdtar -xf data.tar.gz

    icotool -x -i 2 -o akia.png opt/Akia/Akia.png
}

package() {
    cd "${srcdir}"

    install -Dm644 "opt/Akia/akia-${pkgver}.jar" \
        "${pkgdir}/usr/share/java/akia/akia.jar"

    install -Dm755 opt/Akia/libakisp11.so \
        "${pkgdir}/usr/lib/akia/libakisp11.so"

    # The jar (model.MRegistry) hardcodes the PKCS#11 library lookup to
    # /usr/lib/libakisp11.so. Ship a symlink so the jar finds it without
    # polluting /usr/lib with an unowned copy (upstream postinst `cp`s it
    # there; we use a pacman-owned symlink instead).
    install -dm755 "${pkgdir}/usr/lib"
    ln -s akia/libakisp11.so "${pkgdir}/usr/lib/libakisp11.so"

    install -Dm755 "${srcdir}/akia.sh" "${pkgdir}/usr/bin/akia"

    install -Dm644 "${srcdir}/akia.desktop" \
        "${pkgdir}/usr/share/applications/akia.desktop"

    install -Dm644 akia.png \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/akia.png"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 "opt/Akia/docs/Akia Uygulaması Kullanım Kılavuzu.pdf" \
        "${pkgdir}/usr/share/doc/${pkgname}/akia-user-guide.pdf"
    install -m644 "opt/Akia/docs/AkilliKartTeknolojisi.pdf" \
        "${pkgdir}/usr/share/doc/${pkgname}/smartcard-technology.pdf"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
