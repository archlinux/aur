# Maintainer: -
# Contributors: Det, Ethan Hall, Guillaume ALAUX, Daniel J Griffiths, Jason Chu, Geoffroy Carrier, Thomas Dziedzic, Dan Serban

_pkgname=jre
pkgname=jre6
_major=6
_minor=45
_build=b06
pkgver=${_major}u${_minor}
pkgrel=2
pkgdesc="Oracle Java $_major Runtime Environment (public release - end of support)"
arch=('i686' 'x86_64')
url=https://www.java.com/en/download/faq/java_6.xml
license=('custom')
depends=('ca-certificates-java' 'desktop-file-utils' 'hicolor-icon-theme' 'java-runtime-common'
         'libxrender' 'libxtst' 'shared-mime-info' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'gtk2: for Gtk+ look and feel (desktop)'
            'ttf-font: fonts')
makedepends=('pacman>=4.2.0')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-web-start=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-web-start-jre=$_major")

# Variables
DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')
_jname=${_pkgname}${_major}
_jvmdir=/usr/lib/jvm/java-$_major-$_pkgname/jre

backup=("etc/java-$_jname/amd64/jvm.cfg"
        "etc/java-$_jname/images/cursors/cursors.properties"
        "etc/java-$_jname/management/jmxremote.access"
        "etc/java-$_jname/management/management.properties"
        "etc/java-$_jname/security/java.policy"
        "etc/java-$_jname/security/java.security"
        "etc/java-$_jname/security/javaws.policy"
        "etc/java-$_jname/content-types.properties"
        "etc/java-$_jname/flavormap.properties"
        "etc/java-$_jname/fontconfig.properties.src"
        "etc/java-$_jname/logging.properties"
        "etc/java-$_jname/net.properties"
        "etc/java-$_jname/psfont.properties.ja"
        "etc/java-$_jname/psfontj2d.properties"
        "etc/java-$_jname/sound.properties")
[[ $CARCH = i686 ]] && backup[0]="etc/java-$_jname/i386/jvm.cfg"
install=$pkgname.install
source=('javaws-launcher'
        "policytool-$_jname.desktop")
source_i686=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_pkgname-$pkgver-linux-i586.bin")
source_x86_64=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_pkgname-$pkgver-linux-x64.bin")
md5sums=('45c15a6b4767288f2f745598455ea2bf'
         '1ae1bd8b6f12af6c30a2558a39da0fe4')
md5sums_i686=('1d8001ef61a2e3a11fe7b9eec9f08948')
md5sums_x86_64=('4a4569126f05f525f48bacf761f7185c')

package() {
    msg2 "Extracting the .bin"
    rm -rf ${_pkgname}1.${_major}.0_${_minor}
    case "$CARCH" in
        x86_64) sh $_pkgname-$pkgver-linux-x64.bin &>/dev/null ;;
        i686)   sh $_pkgname-$pkgver-linux-i586.bin &>/dev/null ;;
    esac

    cd ${_pkgname}1.${_major}.0_${_minor}

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib/jvm/java-$_major-$_pkgname/jre/bin
    install -d "$pkgdir"/usr/lib/mozilla/plugins
    install -d "$pkgdir"/usr/share/licenses/java$_major-$_pkgname

    msg2 "Removing redundancies..."
    rm -r lib/desktop/icons/HighContrast
    rm -r lib/desktop/icons/HighContrastInverse
    rm -r lib/desktop/icons/LowContrast
    rm    lib/fontconfig.*.bfc
    rm    lib/fontconfig.*.properties.src
    rm    man/ja
    rm -r plugin/

    msg2 "Moving contents..."
    mv * "$pkgdir"/$_jvmdir

    # Cd to the new playground
    cd "$pkgdir"/$_jvmdir

    # javaws-launcher
    install -m644 "$srcdir"/javaws-launcher bin/

    msg2 "Fixing directory structure..."
    # Suffix .desktops + icons (sun-java.png -> sun-java-$_jname.png)
    for i in $(find lib/desktop/ -type f); do
        rename -- "." "-$_jname." $i
    done

    # Fix .desktop paths
    sed -e "s|Exec=|&$_jvmdir/bin/|" \
        -e "s|.png|-$_jname.png|" \
    -i lib/desktop/applications/*

    # Move .desktops + icons to /usr/share
    mv lib/desktop/* "$pkgdir"/usr/share/
    install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

    # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-$_jname/lib -> /etc
    for new_etc_path in ${backup[@]}; do
        # Old location
        old_usr_path="lib/${new_etc_path#*$_jname/}"

        # Move
        install -Dm644 "$old_usr_path" "$pkgdir/$new_etc_path"
        ln -sf "/$new_etc_path" "$old_usr_path"
    done

    # Link NPAPI plugin
    case "$CARCH" in
        i686)   ln -sf $_jvmdir/lib/i386/libnpjp2.so  "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so ;;
        x86_64) ln -sf $_jvmdir/lib/amd64/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so ;;
    esac

    # Replace JKS keystore with 'ca-certificates-java'
    ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

    # Suffix man pages
    for i in $(find man/ -type f); do
        mv "${i}" "${i/.1}-${_jname}.1"
    done

    # Move man pages
    mv man/ja_JP.eucJP/ man/ja
    mv man/ "$pkgdir"/usr/share

    # Move/link licenses
    mv COPYRIGHT LICENSE README *.txt "$pkgdir"/usr/share/licenses/java$_major-$_pkgname/
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