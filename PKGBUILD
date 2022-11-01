# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>
# Contributor: sukanka <su975853527 at gmail dot com>

pkgname=beast2
pkgver=2.7.2
pkgrel=2
pkgdesc="Bayesian Evolutionary Analysis by Sampling Trees. https://doi.org/10.1371/journal.pcbi.1003537"
arch=('x86_64')
url="http://www.beast2.org/"
license=('LGPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CompEvol/beast2/archive/refs/tags/${pkgver}.tar.gz"
"git+https://github.com/CompEvol/BeastFX.git#commit=e6c9fdb2"
 "beauti.desktop" "densitree.desktop" "logcombiner.desktop" "treeannotator.desktop" "beast2.desktop"
 "loganalyser.desktop" "${pkgname}-applauncher.desktop"
 # executable
 "${pkgname}-beauti" "${pkgname}-densitree" "${pkgname}-logcombiner" "${pkgname}-treeannotator" "${pkgname}-beast2"
 "${pkgname}-loganalyser" "${pkgname}-applauncher" "${pkgname}-packagemanager" "${pkgname}-environment"
)
sha256sums=('02f561f593adf54e512d34a9366dd9e4ed0b940cb4540d97a2b4e9b705f327a3'
            'SKIP'
            'f35255c946a105a60e81fcf44ed3f5c28e6903f0e9cedc015b1ae9d08ab6eb42'
            '39d8fe84e7262a11fb49700254fd54a9823ad25069f6cb9539d830c708d8864e'
            '7dc09611d85955ced66dec3f9eb63a3396e59f0bd4f93e6338478a102b01f302'
            '46c3437979fa9a836c5832f1d92c286b90950f7795903cc34051f48e7f0be403'
            'df7bbf1363eec2af224251e77cd0a025003cd0ac751163a3e43cbe2bf52870d1'
            'e4b5398d4e5fe81b0e57b2e5d3a7b1d9621c97d1b8ce40a2d5b169bd94e89397'
            '8e999cabf53742fa818504a10f326e1275e23349f73267baba9058eda6add1ec'
            '6b935c9cd9eb7c901c2225083b92b410144eb67637443f54ba4bc99f1cd6bed1'
            'ddcbeb065e1c9a1b0f745bb9df3dd2286bf5a3770f12b545962c5da33ccc3653'
            'e9c61fd9798188e2153bfda533f7fbd4ae830cc6defe17847cbddf422873d054'
            'e0b1931c484773b707b924b6014ee6e13b94abc47d37ccbf7b8d8af3befe4399'
            'a6931ebff2b3f0cd8b8f99446ee0f93506cfe81fe8d254bd3f22a4e074a79588'
            '34a6d929e0fc4d3e8d6bc68e6932a740c5193e37c321c231396168d7f4fc3a0e'
            '3f2e227d433cdfdebe348eb3233b2b65497d8056a302fc95ecb1f2dbed7e1e77'
            'a11c0a012cf96807a6d385e4503d480bca11855eecaab3f205c40e85efa721e7'
            '0aef5826ec5523354216bdc9fe1342ee0dc39bf6d9e65e2ea8c9caad9fb5d843')
depends=('java-runtime' 'java-openjfx')
makedepends=('ant' 'git')
optdepends=('beagle-lib')
prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i "s|2.7.1|2.7.2|" version.xml
    cd lib
    jar xvf beagle.jar
}
build(){
    cd "$srcdir/BeastFX"
    install -Dm755 $srcdir/${pkgname}-${pkgver}/release/Linux/jrebin/* \
        -t release2/Linux/jrebin
    ant linux -nouserlib -noinput \
        -Drelease_dir=release2 \
        -Dbeast2="../${pkgname}-${pkgver}" \
        -Dbeast2path="../${pkgname}-${pkgver}" \
        -lib "/usr/lib/jvm/default-runtime/lib" \
        -Dcommon_dir="../${pkgname}-${pkgver}/release/common/" \
        -DopenjreLnx="/usr/lib/jvm/default/"
}
package() {
    install -d "$pkgdir"/usr/share/beast2
    install -d ${pkgdir}/usr/bin/$bin
    cd "$srcdir/BeastFX/release2/Linux/"
    cp -rf beast/* "${pkgdir}/usr/share/${pkgname}"

    # shipped modules
    for module in {beastfx,beast,beagle}
    do
        install -d "${pkgdir}/usr/share/${pkgname}/lib/${module}"
    done
    cp -rf ${srcdir}/BeastFX/build/beastfx/* "${pkgdir}/usr/share/${pkgname}/lib/beastfx"
    cp -rf ${srcdir}/${pkgname}-${pkgver}/build/beast/* "${pkgdir}/usr/share/${pkgname}/lib/beast"
    cp -rf ${srcdir}/${pkgname}-${pkgver}/lib/beagle/*  "${pkgdir}/usr/share/${pkgname}/lib/beagle"

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
    # Do NOT put link this file to /usr/bin
    install -Dm755 $srcdir/${pkgname}-environment -t $pkgdir/usr/share/beast2/bin/

    # clear files
    rm -rf $pkgdir/usr/share/beast2/jre
    ln -sf /usr/lib/jvm/default/  $pkgdir/usr/share/beast2/jre
}
