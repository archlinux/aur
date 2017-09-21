# Maintainer: Det <nimetonmaili g-mail>

pkgname=jre
_major=9
_minor=0
_build=181
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Oracle Java Runtime Environment Snapshot"
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-runtime-common' 'nss' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'gtk2: for Gtk+ look and feel (desktop)')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-web-start=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-web-start-jre=$_major"
          "java-openjfx=$_major")

# Variables
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')
_jname=${pkgname}${_major}
_jvmdir=/usr/lib/jvm/java-$_major-$pkgname/jre

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
install=$pkgname.install
source=("http://download.oracle.com/otn-pub/java/jdk/${_major}+${_build}/${pkgname}-${_major}_linux-x64_bin.tar.gz"
        "policytool-$_jname.desktop")
#source_i686=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_hash/$pkgname-$pkgver-linux-i586.tar.gz")
#source_x86_64=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_hash/$pkgname-$pkgver-linux-x64.tar.gz")
sha256sums=('abf54b9905850851ae5de10db1d664ca0625c79ccd505c5e3fc62f6d969424a2'
            'de76dfab62f38b061fe3c99053451ed0d1b9971e892c44e7b893c604607e5694')
#sha256sums_i686=('5eab48ae34b1b2bb6ae3050fd12fdc31f9f5ed736aa406a03ac932ae6e24025c')
#sha256sums_x86_64=('69a4e792953127c0827255e64a925cf1fb2e75e7ad1fe0dc07004fd46ed3d890')
## Alternative mirror, if your local one is throttled:
#source_x86_64=("http://ftp.wsisiz.edu.pl/pub/pc/pozyteczne%20oprogramowanie/java/$pkgname-$pkgver-linux-x64.gz")

package() {
    cd $pkgname-$_major

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib/jvm/java-$_major-$pkgname/jre/bin
    install -d "$pkgdir"/usr/lib/mozilla/plugins
    install -d "$pkgdir"/usr/share/licenses/java$_major-$pkgname

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

    msg2 "Fixing directory structure..."
    # Suffix .desktops + icons (sun-java.png -> sun-java-$_jname.png)
    for i in $(find lib/desktop/ -type f); do
        rename -- "." "-$_jname." $i
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
    case "$CARCH" in
        i686)   ln -sf $_jvmdir/lib/i386/libnpjp2.so  "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so ;;
        x86_64) ln -sf $_jvmdir/lib/amd64/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so ;;
    esac

    # Replace JKS keystore with 'ca-certificates-java'
    ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

    # Move/link licenses
    mv legal/ "$pkgdir"/usr/share/licenses/java$_major-$pkgname/
    ln -sf /usr/share/licenses/java$_major-$pkgname/ "$pkgdir"/usr/share/licenses/$pkgname

    msg2 "Enabling Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy..."
    # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
    # things like 256-bit AES. Enabled by default in OpenJDK:
    # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
    # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
    sed -i "s/crypto.policy=limited/crypto.policy=unlimited/" "$pkgdir"/etc/java-$_jname/security/java.security

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
