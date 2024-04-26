# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>

pkgbase=jdk
pkgname=('jre' 'jdk' 'jdk-doc')
pkgver=22.0.1
_build=8
_hash=c7ec1332f7bb44aeba2eb341ae18aca4
_majver="${pkgver%%.*}"
pkgrel=2
pkgdesc='Oracle Java'
arch=('x86_64')
url='https://www.oracle.com/java/'
license=('LicenseRef-custom')
makedepends=('python-html2text')
source=("https://download.oracle.com/java/${_majver}/archive/jdk-${pkgver}_linux-x64_bin.tar.gz"
        "https://download.oracle.com/otn_software/java/jdk/${pkgver}+${_build}/${_hash}/jdk-${pkgver}_doc-all.zip"
        "jdk-${_majver}_doc-license.html"::"https://download.oracle.com/otndocs/jcp/java_se-${_majver}-final-spec/license.html"
        'java.desktop'
        'jconsole.desktop'
        'jshell.desktop'
        'java_16.png'
        'java_48.png'
        'LICENSE')
noextract=("jdk-${pkgver}_doc-all.zip")
sha256sums=('bb1a6995ae63a04456b1f08fae70a71be59fc1e350c2748a252e87b07bc1c36e'
            '1213aa2fde7a0282d7613b24d72acee5d7a31253bd04770a7f89b16b7644ca2a'
            '80c207fe067921acca0624a72c29590dff6c916886f870e83a0c19b036061960'
            '5249be0129a1c3c1a0f8e5c905e4202f259c82ba1b88e70578125141d74f2515'
            '0ebbdbdf84f9f59e9296a3257a54424d9da956a5f8e5024f2d7a36b69db465a7'
            '4914e9d0e7e0da19934cf5151802376d41574d2804a849e4e92f062d57d00672'
            'd27fec1d74f7a3081c3d175ed184d15383666dc7f02cc0f7126f11549879c6ed'
            '7cf8ca096e6d6e425b3434446b0835537d0fc7fe64b3ccba7a55f7bd86c7e176'
            '20becfcac0bdeaa29a76e6966d727f8cc79381354cbd5d530cdec823954df19f')

DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

_jre_deps=('java-runtime-common' 'ca-certificates-utils' 'freetype2' 'libx11' 'libxext'
           'libxi' 'libxtst' 'libxrender')
_jre_optdeps=('alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ 2 look and feel - desktop usage'
              'gtk3: for the Gtk+ 3 look and feel - desktop usage')
_jre_provides=("java-runtime=${_majver}" "java-runtime-jdk${_majver}"
               "jre${_majver}-jdk=${pkgver}-${pkgrel}"
               "java-runtime-headless=${_majver}" "java-runtime-headless-jdk=${_majver}"
               "jre${_majver}-jdk-headless=${pkgver}-${pkgrel}")
_jre_backup=("etc/java-${pkgbase}/management/jmxremote.access"
             "etc/java-${pkgbase}/management/jmxremote.password.template"
             "etc/java-${pkgbase}/management/management.properties"
             "etc/java-${pkgbase}/security/policy/limited/default_US_export.policy"
             "etc/java-${pkgbase}/security/policy/limited/default_local.policy"
             "etc/java-${pkgbase}/security/policy/limited/exempt_local.policy"
             "etc/java-${pkgbase}/security/policy/unlimited/default_US_export.policy"
             "etc/java-${pkgbase}/security/policy/unlimited/default_local.policy"
             "etc/java-${pkgbase}/security/policy/README.txt"
             "etc/java-${pkgbase}/security/java.policy"
             "etc/java-${pkgbase}/security/java.security"
             "etc/java-${pkgbase}/logging.properties"
             "etc/java-${pkgbase}/net.properties"
             "etc/java-${pkgbase}/sound.properties")

prepare() {
    mkdir -p "jdk-doc-${pkgver}"
    bsdtar -x -f "jdk-${pkgver}_doc-all.zip" -C "jdk-doc-${pkgver}" --strip-components='1'
    html2text "jdk-${_majver}_doc-license.html" > LICENSE-doc
}

_package_jre() {
    cd "jdk-${pkgver}"
    local _jvmdir="/usr/lib/jvm/java-${_majver}-jdk"
    
    install -d -m755 "${pkgdir}/etc"
    install -d -m755 "${pkgdir}/${_jvmdir}"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # conf
    cp -a conf "${pkgdir}/etc/java-${pkgbase}"
    ln -s "../../../../etc/java-${pkgbase}" "${pkgdir}/${_jvmdir}/conf"
    
    # bin
    install -D -m755 bin/{java,jfr,jrunscript,jwebserver} -t "${pkgdir}/${_jvmdir}/bin"
    install -D -m755 bin/{keytool,rmiregistry} -t "${pkgdir}/${_jvmdir}/bin"
    
    # libs
    cp -a lib "${pkgdir}/${_jvmdir}"
    rm "${pkgdir}/${_jvmdir}/lib/"{ct.sym,libattach.so,libsaproc.so,src.zip}
    
    # man pages
    local _file
    for _file in man/man1/{java,jfr,jrunscript,keytool,rmiregistry}.1
    do
        install -D -m644 "$_file" "${pkgdir}/usr/share/${_file%.1}-jdk${_majver}.1"
    done
    
    install -D -m644 release -t "${pkgdir}/${_jvmdir}"
    
    # link JKS keystore from ca-certificates-utils
    rm "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    ln -s /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
    
    # legal/licenses
    cp -a legal/* "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$pkgname" "${pkgdir}/usr/share/licenses/java-${pkgname}"
    ln -s "../../../share/licenses/${pkgname}" "${pkgdir}/${_jvmdir}/legal"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_jre() {
    pkgdesc+=' Runtime Environment'
    depends=("${_jre_deps[@]}")
    optdepends=("${_jre_optdeps[@]}")
    provides=("${_jre_provides[@]}")
    conflicts=('jdk')
    backup=("${_jre_backup[@]}")
    install=jre.install
    
    _package_jre
}

package_jdk() {
    pkgdesc+=' Development Kit'
    depends=('java-environment-common' "${_jre_deps[@]}" 'zlib' 'hicolor-icon-theme')
    optdepends=("${_jre_optdeps[@]}")
    provides=("java-environment=${_majver}" "java-environment-jdk=${_majver}"
              "jdk${_majver}-jdk=${pkgver}-${pkgrel}" 'jre' "${_jre_provides[@]}")
    conflicts=('jre')
    backup=("${_jre_backup[@]}")
    install=jdk.install
    
    _package_jre
    
    cd "${srcdir}/jdk-${pkgver}"
    local _jvmdir="/usr/lib/jvm/java-${_majver}-${pkgname}"
    
    # bin
    install -D -m755 bin/* -t "${pkgdir}/${_jvmdir}/bin"
    
    # libs
    install -D -m644 lib/ct.sym       -t "${pkgdir}/${_jvmdir}/lib"
    install -D -m644 lib/libattach.so -t "${pkgdir}/${_jvmdir}/lib"
    install -D -m644 lib/libsaproc.so -t "${pkgdir}/${_jvmdir}/lib"
    
    cp -a include "${pkgdir}/${_jvmdir}"
    cp -a jmods   "${pkgdir}/${_jvmdir}"
    
    install -D -m644 lib/src.zip -t "${pkgdir}/${_jvmdir}/lib"
    
    # desktop and icons
    install -D -m644 "${srcdir}/java.desktop"     "${pkgdir}/usr/share/applications/java-java-jdk.desktop"
    install -D -m644 "${srcdir}/jconsole.desktop" "${pkgdir}/usr/share/applications/jconsole-java-jdk.desktop"
    install -D -m644 "${srcdir}/jshell.desktop"   "${pkgdir}/usr/share/applications/jshell-java-jdk.desktop"
    install -D -m644 "${srcdir}/java_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/java-jdk.png"
    install -D -m644 "${srcdir}/java_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/java-jdk.png"
    
    # man pages
    local _file
    while read -r -d '' _file
    do
        install -D -m644 "$_file" "${pkgdir}/usr/share/${_file%.1}-jdk${_majver}.1"
    done < <(find man/man1 -type f -print0)
}

package_jdk-doc() {
    pkgdesc+=' documentation'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share"/{doc,licenses}
    cp -dr --no-preserve='ownership' "jdk-doc-${pkgver}" "${pkgdir}/usr/share/doc/java-jdk"
    mv "${pkgdir}/usr/share/doc/java-jdk/legal" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 LICENSE-doc "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "../../licenses/${pkgname}" "${pkgdir}/usr/share/doc/java-jdk/legal"
}
