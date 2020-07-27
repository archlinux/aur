pkgname=oss-cvc-git
pkgver=r11.d01c4ab
pkgrel=2
pkgdesc="a full IEEE 1364 2005 compliant Verilog Hardware Description Language (HDL) simulator"
arch=("x86_64")
# original provider: http://www.tachyon-da.com/
url="https://github.com/cambridgehackers/open-src-cvc"
license=('custom')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('oss-cvc::git+https://github.com/cambridgehackers/open-src-cvc.git'
        'header-fix.patch'
        'mem-mgmt-fix.patch'
        'vpi-header-fix.patch'
        'oss-cvc-vpi.pc')
noextract=()
md5sums=('SKIP'
         '87e282ade0fc00012cc2061f464276ad'
         '288f25791fe0148f7c9fa8b009300add'
         'e067b67f9453cf61629cc9d8f8d58b2b'
         'e0b29b4e45f3e16e2da33fb95e02317d')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    patch -p1 -i "${srcdir}/header-fix.patch"
    patch -p1 -i "${srcdir}/mem-mgmt-fix.patch"
    patch -p1 -i "${srcdir}/vpi-header-fix.patch"
}

build() {
    cd "${srcdir}/${pkgname%-git}/src"
    make -f makefile.cvc64 cvc64

    cd "${srcdir}/${pkgname%-git}/toggle_coverage/src"
    make -f makefile.lnx all
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -d "${pkgdir}/usr/bin"
    for b in \
        src/cvc64 \
        toggle_coverage/src/{chk_tgldat,tgldat_merge,tgldat_report,tvcd_to_tgldat}
        do
        install -m 755 -t "${pkgdir}/usr/bin" $b
    done
    ln -s cvc64 "${pkgdir}/usr/bin/cvc"

    install -d "${pkgdir}/usr/include/oss-cvc"
    for h in pli_incs/*.h ; do
        install -m 644 -t "${pkgdir}/usr/include/oss-cvc" $h
    done

    install -d "${pkgdir}/usr/share/licenses/oss-cvc"
    for l in \
        OSS-CVC-MODIFIED-ARTISTIC-LIC.TXT \
        OSS-CVC-ARTISTIC-LICENSING-FAQ.pdf
        do
        install -m 644 -t "${pkgdir}/usr/share/licenses/oss-cvc" $l
    done

    install -d "${pkgdir}/usr/share/doc/oss-cvc"
    for d in \
        *README \
        doc/*{README,txt,pdf} \
        doc/systemverilog.doc/*README \
        toggle_coverage/README*
        do
        install -m 644 -t "${pkgdir}/usr/share/doc/oss-cvc" $d
    done

    install -d "${pkgdir}/usr/lib/pkgconfig"
    install -m 644 -t "${pkgdir}/usr/lib/pkgconfig" "${srcdir}/oss-cvc-vpi.pc"
}
