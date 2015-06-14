# Maintainer: -
# Contributors: Det, Damian Nowak

_pkgname=jdk
pkgname=bin32-jdk6
_major=6
_minor=45
_build=b06
pkgver=${_major}u${_minor}
pkgrel=3
pkgdesc="Oracle Java $_major Development Kit (32-bit) (public release - end of support)"
arch=('x86_64')
url=https://www.java.com/en/download/faq/java_6.xml
license=('custom')
depends_x86_64=('ca-certificates-java' 'desktop-file-utils' 'hicolor-icon-theme' 'java32-environment-common' 
                'java32-runtime-common' 'lib32-glibc' 'lib32-libjpeg-turbo' 'lib32-lcms2' 'lib32-libxrender'
                'lib32-libxtst' 'lib32-nss' 'shared-mime-info' 'xdg-utils')
optdepends_x86_64=('eclipse: "Oracle Java Mission Control" plugins for Eclipse'
                   'lib32-alsa-lib: for basic sound support'
                   'lib32-gtk2: for Gtk+ look and feel (desktop)'
                   'ttf-font: fonts')
makedepends_x86_64=('pacman>=4.2.0')
provides=("java32-runtime=$_major" "java32-runtime-headless=$_major" "java32-web-start=$_major" "java32-environment=$_major"
          "java32-runtime-jre=$_major" "java32-runtime-headless-jre=$_major" "java32-web-start-jre=$_major" "java32-environment-jdk=$_major")

# Variables
DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')
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
source=('javaws-launcher'
        "jconsole32-$_jname.desktop"
        "jmc32-$_jname.desktop"
        "jvisualvm32-$_jname.desktop"
        "policytool32-$_jname.desktop")
source_x86_64=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_pkgname-$pkgver-linux-i586.bin")
md5sums=('45c15a6b4767288f2f745598455ea2bf'
         '8e3fb5f39a1c24945fdb9315f9743263'
         'be4ebc20e7acd60e195231c36db4a8cf'
         'eaaf5c10579336af3474ccb23dce2911'
         '3adcb5783ffaa18c3480ddfa0569dce2')
md5sums_x86_64=('3269370b7c34e6cbfed8785d3d0c5cbd')

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

    # Fix .desktop paths
    sed -e "s|Exec=|&$_jvmdir/jre/bin/|" \
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
        mv "${i}" "${i/.1}32-${_jname}.1"
    done

    # Move man pages
    mv man/ja_JP.eucJP/ man/ja
    mv man/ "$pkgdir"/usr/share

    # Move/link licenses
    mv COPYRIGHT LICENSE *.txt "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32/
    ln -sf /usr/share/licenses/java${_major}-${_pkgname}32/ "$pkgdir"/usr/share/licenses/$pkgname

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