# Maintainer: Det <nimetonmaili g-mail>

_pkgname=jdk
pkgname=jdk-devel
_major=10
_build=37
pkgver=${_major}b${_build}
pkgrel=1
pkgdesc="Oracle Java $_major Development Kit Snapshot"
arch=('x86_64')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-environment-common' 'java-runtime-common' 'nss' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'eclipse-java: to use "Oracle Java Mission Control" plugins in Eclipse'
            'gtk2: for Gtk+ look and feel (desktop)')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-web-start=$_major" "java-environment=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-web-start-jre=$_major" "java-environment-jdk=$_major"
          "java-openjfx=$_major")
conflicts=("java-runtime-jre=$_major" "java-environment-jdk=$_major")

# Variables
_jname=${_pkgname}${_major}
_jvmdir=/usr/lib/jvm/java-$_major-$_pkgname

backup=("etc/java-$_jname/management/jmxremote.access"
        "etc/java-$_jname/management/management.properties"
        "etc/java-$_jname/security/java.policy"
        "etc/java-$_jname/security/java.security"
        "etc/java-$_jname/security/javaws.policy"
        "etc/java-$_jname/fontconfig.properties.src"
        "etc/java-$_jname/logging.properties"
        "etc/java-$_jname/net.properties"
        "etc/java-$_jname/psfont.properties.ja"
        "etc/java-$_jname/psfontj2d.properties"
        "etc/java-$_jname/sound.properties")
options=('!strip') # JDK debug-symbols
install=$pkgname.install
source=("http://download.java.net/java/jdk${_major}/archive/${_build}/binaries/${_pkgname}-${_major}-ea+${_build}_linux-x64_bin.tar.gz"
        "jconsole-$_jname.desktop"
        "jmc-$_jname.desktop"
        "jvisualvm-$_jname.desktop"
        "policytool-$_jname.desktop"
        'LICENSE-Early-Adopter-Development-Agreement.txt')
sha256sums=('b38148955b0c698bd2906f093c91d90fab4b25e653eedadf73b4b0c4c383e9bb'
            '2e429abf6f14f506f8caa643eeed10921ef3c9b6820850778822f6e95a5fc956'
            'c163f149154d8a3f76ba916d49215673f3056595d857b2f2b7074e88496bbd32'
            'fd519f3ffb9ff649ae1c39674d247d9d26af2befb4ac557e885e84c3c4669950'
            '2dfc037e6ffc5a2bba31afe44a6a0e1e6e4eb7bb105256793372a21083b1e3be'
            '36d48f14c16f0dcc98a8ce2301fd2a111701e6f59a7da08b0e51fdb3e2f9ca89')

package() {
    cd $_pkgname-$_major

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib/jvm/java-$_major-$_pkgname/bin
    install -d "$pkgdir"/usr/lib/mozilla/plugins
    install -d "$pkgdir"/usr/share/licenses/java$_major-$_pkgname

    msg2 "Removing redundancies..."
    rm -r lib/desktop/icons/HighContrast
    rm -r lib/desktop/icons/HighContrastInverse
    rm -r lib/desktop/icons/LowContrast
    rm    lib/fontconfig.*.bfc
    rm    lib/fontconfig.*.properties.src

    msg2 "Moving contents..."
    mv * "$pkgdir"/$_jvmdir

    # Cd to the new playground
    cd "$pkgdir"/$_jvmdir

    # Create a placeholder 'jre' link
    ln -s . jre

    msg2 "Fixing directory structure..."
    # Suffix .desktops + icon (sun-jcontrol.png -> sun-jcontrol-$_jname.png)
    for i in $(find lib/desktop/ -type f); do
        rename -- "." "-$_jname." $i
    done

    # Link missing icons
    for i in $(find lib/desktop/icons/ -name "sun-jcontrol-$_jname.png" -type f); do
        ln -s "sun-jcontrol-$_jname.png" "${i/jcontrol/java}"
        ln -s "sun-jcontrol-$_jname.png" "${i/jcontrol/javaws}"
    done

    # Fix .desktop's
    sed -e '/JavaWS/!s|Name=Java|Name=Java '"$_major"'|' \
        -e "s|Name=JavaWS|Name=JavaWS $_major|" \
        -e "s|Comment=Java|Comment=Java $_major|" \
        -e "s|Exec=|Exec=$_jvmdir/bin/|" \
        -e "s|.png|-$_jname.png|" \
    -i lib/desktop/applications/*

    # Move .desktops + icons to /usr/share
    mv lib/desktop/* "$pkgdir"/usr/share/
    install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

    # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-$_jname/conf -> /etc
    for old_usr_path in $(find conf/ -type f); do
        # New location
        new_etc_path="/etc/java-$_jname/${old_usr_path/conf\/}"

        # Move /link
        install -Dm644 "$old_usr_path" "$pkgdir/$new_etc_path"
        ln -sf "$new_etc_path" "$old_usr_path"
    done

    # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-$_jname/lib -> /etc
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
    ln -sf $_jvmdir/lib/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so

    # Replace JKS keystore with 'ca-certificates-java'
    ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

    # Move/link licenses
    mv legal/ "$pkgdir"/usr/share/licenses/java$_major-$_pkgname/
    install -m644 "$srcdir"/LICENSE-Early-Adopter-Development-Agreement.txt "$pkgdir"/usr/share/licenses/java$_major-$_pkgname/
    ln -sf /usr/share/licenses/java$_major-$_pkgname/ "$pkgdir"/usr/share/licenses/$pkgname

    msg2 "Enabling copy+paste in unsigned applets..."
    # Copy/paste from system clipboard to unsigned Java applets has been disabled since 6u24:
    # - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java
    # - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html
    _line=$(awk '/permission/{a=NR}; END{print a}' "$pkgdir"/etc/java-$_jname/security/java.policy)
    sed "$_line a\\\\n \
        // (AUR) Allow unsigned applets to read system clipboard, see:\n \
        // - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java\n \
        // - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html\n \
        permission java.awt.AWTPermission \"accessClipboard\";" \
    -i "$pkgdir"/etc/java-$_jname/security/java.policy
}
