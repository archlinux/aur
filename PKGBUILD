# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>
# Contributor: sukanka <su975853527 at gmail dot com>

pkgname=beast2
pkgver=2.7.3
_pkgver=2.7.2
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis by Sampling Trees. https://doi.org/10.1371/journal.pcbi.1003537"
arch=('any')
url="http://www.beast2.org/"
license=('LGPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CompEvol/beast2/archive/refs/tags/v${pkgver}.tar.gz"
"BeastFX-${_pkgver}.tar.gz::https://github.com/CompEvol/BeastFX/archive/refs/tags/v${_pkgver}.tar.gz"
# desktop
{beauti,densitree,logcombiner,treeannotator,beast2,loganalyser,${pkgname}-applauncher}.desktop
# excutables
${pkgname}-{beauti,densitree,logcombiner,treeannotator,beast2,loganalyser,applauncher,packagemanager,environment}
)
sha256sums=('04e62e7d3dc108d15d1c01dc4693c7ba362ae7c2efd969c6ae706e69a2cf28b3'
            '1b4cca8ee299459469bfdf8a98b701ed5e47f0b015ef0e04964a195fd9fb74d5'
            'f35255c946a105a60e81fcf44ed3f5c28e6903f0e9cedc015b1ae9d08ab6eb42'
            '39d8fe84e7262a11fb49700254fd54a9823ad25069f6cb9539d830c708d8864e'
            '7dc09611d85955ced66dec3f9eb63a3396e59f0bd4f93e6338478a102b01f302'
            '46c3437979fa9a836c5832f1d92c286b90950f7795903cc34051f48e7f0be403'
            'df7bbf1363eec2af224251e77cd0a025003cd0ac751163a3e43cbe2bf52870d1'
            'e4b5398d4e5fe81b0e57b2e5d3a7b1d9621c97d1b8ce40a2d5b169bd94e89397'
            '8e999cabf53742fa818504a10f326e1275e23349f73267baba9058eda6add1ec'
            '102d9c9db73968dab199f88480af13746ce61974db2d22761308f6f38d7f7ee4'
            '7c32c0c3c5ea9a429d9a9b52f4c9333a6134fe0e218d16eaf14fb4aa0eba8f3e'
            '913b2ec3fcb7a0bbd6d6632abb00c016fd1ec53b9fc840da2afcf19cf3607c6c'
            '66da5c58a820a6bf1da7508b3084e9cb245e4311882cec80ac7f0ba41c4ce575'
            '35842165da98c57f40c490d7eb8a31f189d8f9099268892355d261d712910747'
            'ca7447eba08526cd607bd566a7f826d068cb35fc18c1be7429a10c03a50b0e4f'
            '337159e676c057af33fdafef8d64fb47e5a78d9130b7d4a8d5dd5c8d1bb8d35f'
            '9ca416360e1697768aa5b9cad2cae13b2d9077dd2386d0950466bad6d5cccf60'
            '7b6c125b3dbe7f65cd4903ebca6106893c808f2b444c29aba082f9a66c7ac6af')
depends=('java-runtime' 'java-openjfx')
makedepends=('ant' 'git')
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
    install -d ${pkgdir}/usr/bin/$bin
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
