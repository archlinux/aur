# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgbase=jdk-lts
pkgname=('jre-lts' 'jdk-lts' 'jdk-lts-doc')
pkgver=17.0.10
_build=11
_hash=a473b47039a34b169d45b00685dea3dd
_majver="${pkgver%%.*}"
pkgrel=1
pkgdesc='Oracle Java'
arch=('x86_64')
url='https://www.oracle.com/java/'
license=('custom')
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
sha256sums=('e4fb2df9a32a876afb0a6e17f54c594c2780e18badfa2e8fc99bc2656b0a57b1'
            '7ad21425de9fc703340cf7503d7ef6c44b97fafde5163ea2e859aa0284716956'
            'ab50940bda40a9e8935d1a8f002debda0fdd0b3e2bcc0319827ec19acd8b34f3'
            'ee891aca4c92f6485218b17273cf00ec0ac4df4915daa461271006081450aeae'
            '0f321c01558c0deddd20d82a694a1e2f38b3c78dc257d4122a174b16582fc7b4'
            '3b7a0f46e2fd7d715e2af270b7702c511f96937b3e9c0bf46c4d575b704d40e6'
            'd27fec1d74f7a3081c3d175ed184d15383666dc7f02cc0f7126f11549879c6ed'
            '7cf8ca096e6d6e425b3434446b0835537d0fc7fe64b3ccba7a55f7bd86c7e176'
            '20becfcac0bdeaa29a76e6966d727f8cc79381354cbd5d530cdec823954df19f')

DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

prepare() {
    mkdir -p "jdk-doc-${pkgver}"
    bsdtar -x -f "jdk-${pkgver}_doc-all.zip" -C "jdk-doc-${pkgver}" --strip-components='1'
    html2text "jdk-${_majver}_doc-license.html" > LICENSE-doc
}

package_jre-lts() {
    pkgdesc+=' Runtime Environment (LTS release)'
    depends=('java-runtime-common' 'ca-certificates-utils' 'freetype2' 'libx11' 'libxext'
             'libxi' 'libxtst' 'libxrender')
    optdepends=('alsa-lib: for basic sound support'
                'gtk2: for the Gtk+ 2 look and feel - desktop usage'
                'gtk3: for the Gtk+ 3 look and feel - desktop usage')
    provides=("java-runtime=${_majver}" "java-runtime-jdk${_majver}"
              "jre${_majver}-jdk=${pkgver}-${pkgrel}"
              "java-runtime-headless=${_majver}" "java-runtime-headless-jdk=${_majver}"
              "jre${_majver}-jdk-headless="${pkgver}-${pkgrel})
    backup=("etc/java-${pkgbase}/management/jmxremote.access"
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
    install=jre.install
    
    cd "jdk-${pkgver}"
    local _jvmdir="/usr/lib/jvm/java-${_majver}-jdk"
    
    install -d -m755 "${pkgdir}/etc"
    install -d -m755 "${pkgdir}/${_jvmdir}"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # conf
    cp -a conf "${pkgdir}/etc/java-${pkgbase}"
    ln -s "../../../../etc/java-${pkgbase}" "${pkgdir}/${_jvmdir}/conf"
    
    # bin
    install -D -m755 bin/{java,jfr,jrunscript} -t "${pkgdir}/${_jvmdir}/bin"
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
    rm "${pkgdir}${_jvmdir}/lib/security/cacerts"
    ln -s /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
    
    # legal/licenses
    cp -a legal/* "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$pkgname" "${pkgdir}/usr/share/licenses/java-${pkgname}"
    ln -s "../../../share/licenses/${pkgname}" "${pkgdir}/${_jvmdir}/legal"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_jdk-lts() {
    pkgdesc+=' Development Kit (LTS release)'
    depends=('java-environment-common' "jre-lts=${pkgver}-${pkgrel}" 'zlib'
             'hicolor-icon-theme')
    provides=("java-environment=${_majver}" "java-environment-jdk=${_majver}"
              "jdk${_majver}-jdk=${pkgver}-${pkgrel}")
    install=jdk.install
    
    cd "jdk-${pkgver}"
    local _jvmdir="/usr/lib/jvm/java-${_majver}-jdk"
    
    install -d -m755 "${pkgdir}/${_jvmdir}"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # bin
    cp -a bin "${pkgdir}/${_jvmdir}"
    rm "${pkgdir}/${_jvmdir}/bin/"{java,jfr,jrunscript,keytool,rmiregistry}
    
    # libs
    install -D -m644 lib/ct.sym       -t "${pkgdir}/${_jvmdir}/lib"
    install -D -m644 lib/libattach.so -t "${pkgdir}/${_jvmdir}/lib"
    install -D -m644 lib/libsaproc.so -t "${pkgdir}/${_jvmdir}/lib"
    
    cp -a include "${pkgdir}/${_jvmdir}"
    cp -a jmods   "${pkgdir}/${_jvmdir}"
    
    install -D -m644 lib/src.zip -t "${pkgdir}/${_jvmdir}/lib"
    
    # desktop and icons
    install -D -m644 "${srcdir}/java.desktop"     "${pkgdir}/usr/share/applications/java-java${_majver}-jdk.desktop"
    install -D -m644 "${srcdir}/jconsole.desktop" "${pkgdir}/usr/share/applications/jconsole-java${_majver}-jdk.desktop"
    install -D -m644 "${srcdir}/jshell.desktop"   "${pkgdir}/usr/share/applications/jshell-java${_majver}-jdk.desktop"
    install -D -m644 "${srcdir}/java_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/java${_majver}-jdk.png"
    install -D -m644 "${srcdir}/java_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/java${_majver}-jdk.png"
    
    # man pages
    local _file
    while read -r -d '' _file
    do
        install -D -m644 "$_file" "${pkgdir}/usr/share/${_file%.1}-jdk${_majver}.1"
    done < <(find man/man1 -type f -print0)
    rm "${pkgdir}/usr/share/man/man1/"{java,jfr,jrunscript,keytool,rmiregistry}-jdk"${_majver}".1
    
    # legal/licenses
    cp -a legal/* "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$pkgname" "${pkgdir}/usr/share/licenses/java${_majver}-${pkgname}"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_jdk-lts-doc() {
    pkgdesc+=' documentation (LTS release)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share"/{doc,licenses}
    cp -dr --no-preserve='ownership' "jdk-doc-${pkgver}" "${pkgdir}/usr/share/doc/java${_majver}-jdk"
    mv "${pkgdir}/usr/share/doc/java${_majver}-jdk/legal" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 LICENSE-doc "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "../../licenses/${pkgname}" "${pkgdir}/usr/share/doc/java${_majver}-jdk/legal"
}
