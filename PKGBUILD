# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Det
# Contributor: Damian Nowak

_pkgname=jdk
pkgname=bin32-jdk6
_major=6
_minor=45
_build=b06
pkgver=${_major}u${_minor}
pkgrel=6
pkgdesc="Oracle Java $_major Development Kit (32-bit) (public release - end of support)"
arch=('x86_64')
url="https://www.java.com/en/download/faq/java_$_major.xml"
license=('custom')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java32-environment-common' 'java32-runtime-common'
         'lib32-gcc-libs' 'lib32-libxrender' 'lib32-libxtst' 'lib32-nss' 'xdg-utils')
optdepends=('eclipse: "Oracle Java Mission Control" plugins for Eclipse'
            'lib32-alsa-lib: for basic sound support'
            'lib32-gtk2: for Gtk+ look and feel (desktop)')
provides=("java32-runtime=$_major" "java32-runtime-headless=$_major" "java32-web-start=$_major" "java32-environment=$_major"
          "java32-runtime-jre=$_major" "java32-runtime-headless-jre=$_major" "java32-web-start-jre=$_major" "java32-environment-jdk=$_major")

# Variables
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')
_jname=${_pkgname}${_major}
_jvmdir=/usr/lib32/jvm/java32-$_major-$_pkgname

backup=("etc/java32-$_jname/i386/jvm.cfg"
        "etc/java32-$_jname/images/cursors/cursors.properties"
        "etc/java32-$_jname/management/jmxremote.access"
        "etc/java32-$_jname/management/management.properties"
        "etc/java32-$_jname/security/java.policy"
        "etc/java32-$_jname/security/java.security"
        "etc/java32-$_jname/security/javaws.policy"
        "etc/java32-$_jname/content-types.properties"
        "etc/java32-$_jname/flavormap.properties"
        "etc/java32-$_jname/fontconfig.properties.src"
        "etc/java32-$_jname/logging.properties"
        "etc/java32-$_jname/net.properties"
        "etc/java32-$_jname/psfont.properties.ja"
        "etc/java32-$_jname/psfontj2d.properties"
        "etc/java32-$_jname/sound.properties")
options=('!strip') # JDK debug-symbols
install=$pkgname.install
source=("https://download.oracle.com/otn/java/jdk/${pkgver}-${_build}/jdk-${pkgver}-linux-i586.bin"
        "https://download.oracle.com/otn-pub/java/jce_policy/$_major/jce_policy-$_major.zip"
        "jconsole32-$_jname.desktop"
        "jmc32-$_jname.desktop"
        "jvisualvm32-$_jname.desktop"
        "policytool32-$_jname.desktop"
        'javaws-launcher')
sha256sums=('ca7debeb8924bfe07ee808b4264d4cb052ca318caa2f913ebc8d97894c5edf69'
            '80212f7748c2671b89b6085000717c747851db004409dce3bb97f3a2aeb91cdd'
            '6195ce056e55247365b5cc2363e5e28f8bdb6842f65a41d37732279aee17ce57'
            'a10ec033765a0ecf1fdd8ef8dee3614391f8b3605bb8b4f0d957ff7c7c958563'
            'c7377ddaaee8579a230356e9878030a9f2a8cbcc5c2f89114d6244db051a0a01'
            'ce1ac5bf1fd639fe0e0fe08880e8eae5b2fbf6903a7c51ed8168aee8fd1ee66a'
            '5a43bf54553ea39c147a67935d68646806a5053fefd527bd69c546f4c884402e')

package() {
    msg2 "Extracting the .bin"
    rm -rf ${_pkgname}1.${_major}.0_${_minor}
    sh $_pkgname-$pkgver-linux-i586.bin &>/dev/null

    cd ${_pkgname}1.${_major}.0_${_minor}

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib32/jvm/java32-$_major-$_pkgname/bin
    install -d "$pkgdir"/usr/lib32/mozilla/plugins
    install -d "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32

    msg2 "Removing redundancies..."
    rm    db/bin/*.bat
    rm    db/3RDPARTY
    rm    db/LICENSE
    rm -r jre/lib/desktop/icons/HighContrast
    rm -r jre/lib/desktop/icons/HighContrastInverse
    rm -r jre/lib/desktop/icons/LowContrast
    rm    jre/lib/fontconfig.*.bfc
    rm    jre/lib/fontconfig.*.properties.src
    rm -r jre/plugin/
    rm    jre/*.txt
    rm    jre/COPYRIGHT
    rm    jre/LICENSE
    rm    jre/README
    rm    man/ja

    msg2 "Moving contents..."
    mv * "$pkgdir"/$_jvmdir

    # Cd to the new playground
    cd "$pkgdir"/$_jvmdir

    # javaws-launcher
    install -m644 "$srcdir"/javaws-launcher bin/

    msg2 "Fixing directory structure..."
    # Replace duplicate binaries in bin/ with links to jre/bin/
    for i in $(ls jre/bin/); do
        ln -sf "$_jvmdir/jre/bin/$i" "bin/$i"
    done

    # Suffix .desktops + icons (sun-java.png -> sun-java32-$_jname.png)
    for i in $(find jre/lib/desktop/ -type f); do
        rename -- "." "32-$_jname." $i
    done

    # Fix .desktop's
    sed -e '/JavaWS/!s|Name=Java|Name=Java '"$_major"'|' \
        -e "s|Name=JavaWS|Name=JavaWS $_major|" \
        -e "s|Name=.*|& (32-bit)|" \
        -e "s|Comment=Java|Comment=Java $_major|" \
        -e "s|Comment=.*|& (32-bit)|" \
        -e "s|Exec=|Exec=$_jvmdir/jre/bin/|" \
        -e "s|.png|32-$_jname.png|" \
    -i jre/lib/desktop/applications/*

    # Move .desktops + icons to /usr/share
    mv jre/lib/desktop/* "$pkgdir"/usr/share/
    install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

    # Move confs to /etc and link back to /usr: /usr/lib32/jvm/java32-$_jname/jre/lib -> /etc
    for new_etc_path in ${backup[@]}; do
        # Old location
        old_usr_path="jre/lib/${new_etc_path#*$_jname/}"

        # Move
        install -Dm644 "$old_usr_path" "$pkgdir/$new_etc_path"
        ln -sf "/$new_etc_path" "$old_usr_path"
    done

    # Link NPAPI plugin
    ln -sf $_jvmdir/jre/lib/i386/libnpjp2.so "$pkgdir"/usr/lib32/mozilla/plugins/libnpjp2-$_jname.so

    # Replace JKS keystore with 'ca-certificates-java'
    ln -sf /etc/ssl/certs/java/cacerts jre/lib/security/cacerts

    # Suffix man pages
    for i in $(find man/ -type f); do
        mv "$i" "${i/.1}32-$_jname.1"
    done

    # Move man pages
    mv man/ja_JP.eucJP/ man/ja
    mv man/ "$pkgdir"/usr/share

    # Move/link licenses
    mv db/NOTICE COPYRIGHT LICENSE *.txt "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32/
    ln -sf /usr/share/licenses/java${_major}-${_pkgname}32/ "$pkgdir"/usr/share/licenses/$pkgname

    msg2 "Installing Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files..."
    # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
    # things like 256-bit AES. Enabled by default in OpenJDK:
    # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
    # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
    install -m644 "$srcdir"/jce/*.jar jre/lib/security/
    install -Dm644 "$srcdir"/jce/README.txt \
                   "$pkgdir"/usr/share/doc/$pkgname/README_-_Java_JCE_Unlimited_Strength.txt

    msg2 "Enabling copy+paste in unsigned applets..."
    # Copy/paste from system clipboard to unsigned Java applets has been disabled since 6u24:
    # - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java
    # - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html
    _line=$(awk '/permission/{a=NR}; END{print a}' "$pkgdir"/etc/java32-$_jname/security/java.policy)
    sed "$_line a\\\\n \
        // (AUR) Allow unsigned applets to read system clipboard, see:\n \
        // - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java\n \
        // - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html\n \
        permission java.awt.AWTPermission \"accessClipboard\";" \
    -i "$pkgdir"/etc/java32-$_jname/security/java.policy
}
