# Maintainer: Det <nimetonmaili g-mail>
# Based on jdk-devel: https://aur.archlinux.org/packages/jdk-devel/
# Contributors: Damian Nowak

_pkgname=jdk
pkgname=bin32-jdk-devel
_major=9
#_minor=1
_build=157
_pkgver=$_major
pkgver=${_major}b${_build}
#_pkgver=${_major}u${_minor}
#pkgver=${_major}u${_minor}.b${_build}
pkgrel=1
pkgdesc="Oracle Java $_major Development Kit Snapshot (32-bit)"
arch=('x86_64')
url=https://jdk$_major.java.net/
license=('custom')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java32-environment-common' 'java32-runtime-common'
         'lib32-gcc-libs' 'lib32-libxrender' 'lib32-libxtst' 'lib32-nss' 'xdg-utils')
optdepends=('eclipse: "Oracle Java Mission Control" plugins for Eclipse'
            'lib32-alsa-lib: for basic sound support'
            'lib32-gtk2: for Gtk+ look and feel (desktop)')
provides=("java32-runtime=$_major" "java32-runtime-headless=$_major" "java32-web-start=$_major" "java32-environment=$_major"
          "java32-runtime-jre=$_major" "java32-runtime-headless-jre=$_major" "java32-web-start-jre=$_major" "java32-environment-jdk=$_major"
          "java32-openjfx=$_major")

# Variables
_jname=${_pkgname}${_major}
_jvmdir=/usr/lib32/jvm/java32-$_major-$_pkgname

backup=("etc/java32-$_jname/management/jmxremote.access"
        "etc/java32-$_jname/management/management.properties"
        "etc/java32-$_jname/security/java.policy"
        "etc/java32-$_jname/security/java.security"
        "etc/java32-$_jname/security/javaws.policy"
        "etc/java32-$_jname/fontconfig.properties.src"
        "etc/java32-$_jname/logging.properties"
        "etc/java32-$_jname/net.properties"
        "etc/java32-$_jname/psfont.properties.ja"
        "etc/java32-$_jname/psfontj2d.properties"
        "etc/java32-$_jname/sound.properties")
options=('!strip') # JDK debug-symbols
install=$pkgname.install
source=("http://www.java.net/download/java/jdk${_major}/archive/${_build}/binaries/${_pkgname}-${_pkgver}-ea+${_build}_linux-x86_bin.tar.gz"
        "jconsole32-$_jname.desktop"
        "jmc32-$_jname.desktop"
        "jvisualvm32-$_jname.desktop"
        "policytool32-$_jname.desktop"
        'OTN-Early-Adopter-License-Terms.txt')
sha256sums=('18eb8c572b8ae77e6e5d60a82118c424de2ea9bda0ae34c41a9439d4fa28f94a'
            '4699009a941791cc82e6bcc85e80365b4c5b10f217e5f023a84f917abbe98ae1'
            '082c7594570133117e06f2b3a74c9e40ecea89384ab874fa1ef111e1c998302e'
            '653729575c23d7faaef6bb106fdc4889e9a2240723540ad92a74bf1972367faf'
            'ff17209204c70e8b637b8386327486c98e0b70b9b715970fa7a73093d1ef3f91'
            '5f00ffce28036cf79da41c7fe0e29801e3148597a164ecc69f49e718ae370370')

package() {
    cd ${_pkgname}1.${_major}.0

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib32/jvm/java32-$_major-$_pkgname/bin
    install -d "$pkgdir"/usr/lib32/mozilla/plugins
    install -d "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32

    msg2 "Removing redundancies..."
    rm -r lib/desktop/icons/HighContrast
    rm -r lib/desktop/icons/HighContrastInverse
    rm -r lib/desktop/icons/LowContrast
    rm    lib/fontconfig.*.bfc
    rm    lib/fontconfig.*.properties.src
    rm -r plugin/

    msg2 "Moving contents..."
    mv * "$pkgdir"/$_jvmdir

    # Cd to the new playground
    cd "$pkgdir"/$_jvmdir

    # Create a placeholder 'jre' link
    ln -s . jre

    msg2 "Fixing directory structure..."
    # Suffix .desktops + icons (sun-java.png -> sun-java32-$_jname.png)
    for i in $(find lib/desktop/ -type f); do
        rename -- "." "32-$_jname." $i
    done

    # Fix .desktop's
    sed -e '/JavaWS/!s|Name=Java|Name=Java '"$_major"'|' \
        -e "s|Name=JavaWS|Name=JavaWS $_major|" \
        -e "s|Name=.*|& (32-bit)|" \
        -e "s|Comment=Java|Comment=Java $_major|" \
        -e "s|Comment=.*|& (32-bit)|" \
        -e "s|Exec=|Exec=$_jvmdir/bin/|" \
        -e "s|.png|32-$_jname.png|" \
    -i lib/desktop/applications/*

    # Move .desktops + icons to /usr/share
    mv lib/desktop/* "$pkgdir"/usr/share/
    install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

    # Move confs to /etc and link back to /usr: /usr/lib32/jvm/java32-$_jname/conf -> /etc
    for old_usr_path in $(find conf/ -type f); do
        # New location
        new_etc_path="/etc/java32-$_jname/${old_usr_path/conf\/}"

        # Move /link
        install -Dm644 "$old_usr_path" "$pkgdir/$new_etc_path"
        ln -sf "$new_etc_path" "$old_usr_path"
    done

    # Move confs to /etc and link back to /usr: /usr/lib32/jvm/java32-$_jname/lib -> /etc
    for new_etc_path in ${backup[@]}; do
        # Old location
        old_usr_path="lib/${new_etc_path#*$_jname/}"

        # Move/link
        if [[ -f $old_usr_path ]]; then
            install -Dm644 "$old_usr_path" "$pkgdir/$new_etc_path"
            ln -sf "/$new_etc_path" "$old_usr_path"
        fi
    done

    # Link NPAPI plugin
    ln -sf $_jvmdir/lib/i386/libnpjp2.so "$pkgdir"/usr/lib32/mozilla/plugins/libnpjp2-$_jname.so

    # Replace JKS keystore with 'ca-certificates-java'
    ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

    # Move/link licenses
    mv legal/ "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32/
    install -m644 "$srcdir"/OTN-Early-Adopter-License-Terms.txt "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32/
    ln -sf /usr/share/licenses/java${_major}-${_pkgname}32/ "$pkgdir"/usr/share/licenses/$pkgname

    msg2 "Enabling Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy..."
    # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
    # things like 256-bit AES. Enabled by default in OpenJDK:
    # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
    # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
    sed -i "s/crypto.policy=limited/crypto.policy=unlimited/" "$pkgdir"/etc/java32-$_jname/security/java.security

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
