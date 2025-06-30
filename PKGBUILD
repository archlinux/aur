# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>
# Contributor: sukanka <su975853527 at gmail dot com>

pkgname=beast2
pkgver=2.7.8
_pkgver=2.7.6
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis by Sampling Trees. https://doi.org/10.1371/journal.pcbi.1003537"
arch=('any')
url="http://www.beast2.org/"
license=('LGPL-2.1-only')
source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/CompEvol/beast2/archive/refs/tags/v${pkgver}.tar.gz"
"BeastFX-${_pkgver}.tar.gz::https://github.com/CompEvol/BeastFX/archive/refs/tags/v${_pkgver}.tar.gz"
# desktop
{beauti,densitree,logcombiner,treeannotator,beast2,loganalyser,${pkgname}-applauncher}.desktop
# excutables
${pkgname}-{beauti,densitree,logcombiner,treeannotator,beast2,loganalyser,applauncher,packagemanager,environment}
)

sha256sums=('a616e12e72b0fde29f2686ed8924d552ff53454c34be353591488b45733a56df'
            '4d746821fd2b1da10e2b616ea33c4484f994faee65667c4c7445d2c95f163edb'
            '7f2a6633e5c2ee1ffde58191ae4403ee5b4f4323cea4d6db8fc8c1516294ddf5'
            'a4c2ae027db8ee3ed687591b25e10581380cb4a3f76f60399018da280276bdfd'
            '473657ec9975de6f5e604767ee2ee5cbb6a5c22603624fbf7a94af36d9ccf5db'
            '53de8b25293b6f3f85b0abec0678f47dc999aa009e94b863ef5ae28a53c5deb4'
            'bf6a7fe7832cc08109f0d1909dbcbbb334928448aaa3dbb4849a6bd1a41430d2'
            'f908450fbb1106aa261fc58cb2b6180174d6abe31e0dbb4d2ed34b88e103a663'
            '1d956d06386b285aff90ca52c01c2645155540fdb991f0e18c04bc5628d4d0ae'
            '102d9c9db73968dab199f88480af13746ce61974db2d22761308f6f38d7f7ee4'
            '7c32c0c3c5ea9a429d9a9b52f4c9333a6134fe0e218d16eaf14fb4aa0eba8f3e'
            '913b2ec3fcb7a0bbd6d6632abb00c016fd1ec53b9fc840da2afcf19cf3607c6c'
            '66da5c58a820a6bf1da7508b3084e9cb245e4311882cec80ac7f0ba41c4ce575'
            '35842165da98c57f40c490d7eb8a31f189d8f9099268892355d261d712910747'
            'ca7447eba08526cd607bd566a7f826d068cb35fc18c1be7429a10c03a50b0e4f'
            'cb516bf1bfddccd5e7de2c0c1feb82e353a7c872e8c45c9fc552dfd5714fc886'
            '9ca416360e1697768aa5b9cad2cae13b2d9077dd2386d0950466bad6d5cccf60'
            '7b6c125b3dbe7f65cd4903ebca6106893c808f2b444c29aba082f9a66c7ac6af')
depends=('java-runtime=23' 'java-openjfx=23')
makedepends=('ant' 'java-environment=23')
optdepends=('beagle-lib')
prepare(){
    cd ${srcdir}
    test -d "BeastFX-${pkgver}" && rm -rf "BeastFX-${pkgver}"
    mv "BeastFX-${_pkgver}" "BeastFX-${pkgver}"
}
build(){
    cd "$srcdir/BeastFX-${pkgver}"
    install -Dm755 $srcdir/${pkgname}-${pkgver}/release/Linux/jrebin/* \
        -t release2/Linux/jrebin
    ant linux -nouserlib -noinput \
        -Drelease_dir=release2 \
        -Dbeast2="../${pkgname}-${pkgver}" \
        -Dbeast2path="../${pkgname}-${pkgver}" \
        -lib "/usr/lib/jvm/default-runtime/lib" \
        -Dcommon_dir="../${pkgname}-${pkgver}/release/common/" \
        -DopenjreLnx="/usr/lib/jvm/default/" \
        -DBEASTappName="BeastFX-${pkgver}" \
        -DBeastFX="BeastFX-${pkgver}"
}
package() {
    install -d "$pkgdir"/usr/share/beast2
    install -d ${pkgdir}/usr/bin/
    cd "$srcdir/BeastFX-${pkgver}/release2/Linux/"
    cp -rf beast/* "${pkgdir}/usr/share/${pkgname}"

    # shipped modules
    for module in {beastfx,beast}
    do
        install -d "${pkgdir}/usr/share/${pkgname}/lib/${module}"
    done
    cp -rf ${srcdir}/BeastFX-${pkgver}/build/beastfx/* "${pkgdir}/usr/share/${pkgname}/lib/beastfx"
    cp -rf ${srcdir}/${pkgname}-${pkgver}/build/beast/* "${pkgdir}/usr/share/${pkgname}/lib/beast"

    # shipped library
    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/lib/*.jar -t  "${pkgdir}/usr/share/${pkgname}/lib"

    # for 2.7.4+
#    install -d "${pkgdir}/usr/share/${pkgname}/lib/packages"
#    mv ${pkgdir}/usr/share/${pkgname}/lib/BEAST.app.* "${pkgdir}/usr/share/${pkgname}/lib/packages"
#    mv ${pkgdir}/usr/share/${pkgname}/lib/BEAST.base.* "${pkgdir}/usr/share/${pkgname}/lib/packages"

    # correct excutable
    rm -rf $pkgdir/usr/share/beast2/bin/*
    for exe in {"beauti","densitree","logcombiner","treeannotator","beast2","loganalyser","applauncher","packagemanager"}
    do
        install -Dm755 $srcdir/${pkgname}-${exe} -t $pkgdir/usr/share/beast2/bin/
    done
    mv $pkgdir/usr/share/beast2/bin/${pkgname}-beast2  $pkgdir/usr/share/beast2/bin/${pkgname}

    for bin in $(ls $pkgdir/usr/share/beast2/bin)
    do
        ln -s /usr/share/beast2/bin/$bin ${pkgdir}/usr/bin/$bin
    done
    install -Dm 755 ${srcdir}/*.desktop -t ${pkgdir}/usr/share/applications
    # Do NOT  link this file to /usr/bin
    install -Dm755 $srcdir/${pkgname}-environment -t $pkgdir/usr/share/beast2/bin/

    # clear files
    rm -rf $pkgdir/usr/share/beast2/jre
    ln -sf /usr/lib/jvm/default/  $pkgdir/usr/share/beast2/jre
}

