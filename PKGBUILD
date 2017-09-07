# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributors: Damian Nowak, Det, Firas Zaidan

_pkgname=jdk
pkgname=bin32-jdk5
_major=5
_minor=22
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Oracle Java $_major Development Kit (32-bit) (public release - end of support)"
arch=('x86_64')
url="https://www.java.com/en/download/faq/java_$_major.xml"
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
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')
_jname=${_pkgname}${_major}
_jvmdir=/usr/lib32/jvm/java32-$_major-$_pkgname

backup=("etc/java32-$_jname/i386/jvm.cfg"
        "etc/java32-$_jname/images/cursors/cursors.properties"
        "etc/java32-$_jname/management/jmxremote.access"
        "etc/java32-$_jname/management/management.properties"
        "etc/java32-$_jname/security/java.policy"
        "etc/java32-$_jname/security/java.security"
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
source=("http://archive.org/download/jdk-1_5_0_$_minor-linux-i586/jce_policy-1_5_0.zip"
        'javaws-launcher'
        "jconsole32-$_jname.desktop"
        "jmc32-$_jname.desktop"
        "jvisualvm32-$_jname.desktop"
        "policytool32-$_jname.desktop")
source_x86_64=("http://archive.org/download/jdk-1_5_0_$_minor-linux-i586/jdk-1_5_0_$_minor-linux-i586.bin")

md5sums=('169441bba1ca95e84e030e116f258d79'
         '45c15a6b4767288f2f745598455ea2bf'
         '89cfc60c0ea68c551af36675d8ad201f'
         '84f87b8dff0fa494688aa27d6cb6727f'
         'fb7f76141f5c9b899b442d4e7500e8a4'
         '20f51df1e0ebca62ebd7f14215100746')
md5sums_x86_64=('df5dae6d50d2abeafb472dde6d9a17f3')

package() {
    msg2 "Extracting the .bin"
    rm -rf ${_pkgname}1.${_major}.0_${_minor}
    sh $_pkgname-1_5_0_$_minor-linux-i586.bin &>/dev/null <<< "yes"

    cd ${_pkgname}1.${_major}.0_${_minor}

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib32/jvm/java32-$_major-$_pkgname/bin
    install -d "$pkgdir"/usr/lib32/mozilla/plugins
    install -d "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32

    msg2 "Removing redundancies..."
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

    # Move .desktops + icons to /usr/share
    mkdir -p "$pkgdir"/usr/share/applications/
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
    mv COPYRIGHT LICENSE *.txt "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32/
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
