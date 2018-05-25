# Maintainer: skydrome <skydrome at@at proton mail dot com>

pkgname=apache-ant-10
pkgver=1.10.3
pkgrel=2
arch=('any')
url='https://ant.apache.org/'
pkgdesc='A java-based build tool'
license=('APACHE')
provides=('apache-ant' 'apache-ant-doc')
conflicts=('apache-ant' 'apache-ant-doc')
depends=('java-runtime>=8')
makedepends=('java-environment>=8')
optdepends=('junit: to use the junit tasks')
validpgpkeys=('CE8075A251547BEE249BC151A2115AE15F6B8B72') # Stefan Bodewig
source=("https://www.apache.org/dist/ant/source/apache-ant-${pkgver}-src.tar.bz2"{,.asc}
        'apache-ant.sh'
        'bin_ant'
        'ant.conf')
sha256sums=('2a01ad07755cf33dd87d0dd3a09bc40a59cd1c0fdb7298a7c398a81d0e3d53f8'
            'SKIP'
            '182b9212610790966d3a018d3cbab2e5327dd9fd11dc15dd1f377853216f5718'
            '29b443ae3af7e246b4ff0b5ec9f023ae95992db1a010a362e70ca7a65a6df461'
            'b86ce60f61cbd85a9faa61d698b0fc4607f1ff375cd15673aee57f053012eacb')

prepare() {
    cd "${srcdir}/apache-ant-${pkgver}"
    unset  ANT_HOME
    export ANT_OPTS="-Duser.home=${srcdir}"

    ./bootstrap.sh
    bootstrap/bin/ant -Ddest=optional -f fetch.xml
}

build() {
    cd "${srcdir}/apache-ant-${pkgver}"
    export ANT_HOME="${srcdir}/apache-ant-1.10.3/bootstrap"

    bootstrap/bin/ant -lib lib/optional dist
}

package() {
    cd "${srcdir}/apache-ant-${pkgver}/apache-ant-${pkgver}"

    install -dm755 "${pkgdir}/etc"
    install -dm755 "${pkgdir}/usr/share/doc"
    install -dm755 "${pkgdir}/usr/share/apache-ant/bin"
    install -dm755 "${pkgdir}/usr/share/java/apache-ant"
    install -dm755 "${pkgdir}/usr/share/licenses/apache-ant"
      
    ln -s /etc/apache-ant            "${pkgdir}/usr/share/apache-ant/etc"
    ln -s /usr/share/java/apache-ant "${pkgdir}/usr/share/apache-ant/lib"

    find bin -type f -a ! -name \*.bat -a ! -name \*.cmd \
        -exec install -m755 {} "${pkgdir}/usr/share/apache-ant/bin" \;
    install -m644 lib/*.jar  "${pkgdir}/usr/share/java/apache-ant"

    cp -Rp etc "${pkgdir}/etc/apache-ant"
    rm -f      "${pkgdir}/etc/apache-ant/ant-bootstrap.jar"

    install -Dm755 "${srcdir}/bin_ant"       "${pkgdir}/usr/bin/ant"
    install -Dm644 "${srcdir}/ant.conf"      "${pkgdir}/etc/apache-ant/ant.conf"
    install -Dm755 "${srcdir}/apache-ant.sh" "${pkgdir}/etc/profile.d/apache-ant.sh"
    install -m644  LICENSE NOTICE            "${pkgdir}/usr/share/licenses/apache-ant"

    # fix python2 path
    sed -i "${pkgdir}/usr/share/apache-ant/bin/runant.py" \
        -e 's|/usr/bin/python|/usr/bin/python2|'

    # Documentation
    cp -r "${srcdir}/apache-ant-${pkgver}/manual" \
          "${pkgdir}/usr/share/doc/apache-ant"
}
