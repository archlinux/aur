# Maintainer: therealfarfetchd <aur@marco-rebhan.de>
# Contributor: Det <nimetonmaili g-mail>
# Based on jdk: https://aur.archlinux.org/packages/jdk/

pkgname=jdk-dcevm
_major=8
_minor=181
_build=b13
_dcevmbuild=
_hash=96a7b8442fe848ef90c96a2fad6ed6d1
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Oracle Java Development Kit with DCEVM patches"
arch=('x86_64')
url=https://dcevm.github.io/
license=('custom')
depends=('ca-certificates-java' 'desktop-file-utils' 'hicolor-icon-theme' 'java-environment-common'
         'java-runtime-common' 'libx11' 'libxrender' 'libxslt' 'libxtst' 'shared-mime-info' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'eclipse: to use "Oracle Java Mission Control" plugins in Eclipse'
            'gtk2: for Gtk+ look and feel (desktop)'
            'ttf-font: fonts')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-environment=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-environment-jdk=$_major"
          "java-openjfx=$_major")

# Variables
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')
_jname=${pkgname}${_major}
_jvmdir=/usr/lib/jvm/java-$_major-$pkgname
_dcevmbuild_a="$(test "x$_dcevmbuild" = "x" || echo "%2B$_dcevmbuild")"

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
options=('!strip') # JDK debug-symbols
install=$pkgname.install
source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_hash/jdk-$pkgver-linux-x64.tar.gz"
        "http://download.oracle.com/otn-pub/java/jce/$_major/jce_policy-$_major.zip"
        "http://github.com/dcevm/dcevm/releases/download/light-jdk$pkgver$_dcevmbuild_a/DCEVM-$pkgver-installer.jar"
        "jconsole-$_jname.desktop"
        "jmc-$_jname.desktop"
        "jvisualvm-$_jname.desktop"
        "policytool-$_jname.desktop")
md5sums=('ef599e322eee42f6769991dd3e3b1a31'
         'b3c7031bc65c28c2340302065e7d00d3'
         'fe5d0074ba0478897b04a95056a7f624'
         '307b5ce85882e6c6649486df51dab00c'
         '4c428dc81d51e9d294ec9c26827f1adc'
         '973181e4a4cfdc79c43b297a6b821354'
         '3519db1ad1455746126f092ad6d850e4')
## Alternative mirror, if your local one is throttled:
#source[0]=("http://ftp.wsisiz.edu.pl/pub/pc/pozyteczne%20oprogramowanie/java/$pkgname-$pkgver-linux-x64.gz")

package() {
    cd jdk1.${_major}.0_${_minor}

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib/jvm/java-$_major-$pkgname/bin
    install -d "$pkgdir"/usr/lib/mozilla/plugins
    install -d "$pkgdir"/usr/share/licenses/java$_major-$pkgname

    msg2 "Removing redundancies..."
    rm -r jre/lib/desktop/icons/HighContrast/
    rm -r jre/lib/desktop/icons/HighContrastInverse/
    rm -r jre/lib/desktop/icons/LowContrast/
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

    msg2 "Fixing directory structure..."
    # Replace duplicate binaries in bin/ with links to jre/bin/
    for i in $(ls jre/bin/); do
        ln -sf "$_jvmdir/jre/bin/$i" "bin/$i"
    done

    # Suffix .desktops + icons (sun-java.png -> sun-java-$_jname.png)
    for i in $(find jre/lib/desktop/ -type f); do
        rename -- "." "-$_jname." $i
    done

    # Fix .desktop paths
    sed -e "s|Exec=|Exec=$_jvmdir/jre/bin/|" \
        -e "s|.png|-$_jname.png|" \
    -i jre/lib/desktop/applications/*

    # Move .desktops + icons to /usr/share
    mv jre/lib/desktop/* "$pkgdir"/usr/share/
    install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

    # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-$_jname/jre/lib -> /etc
    for new_etc_path in ${backup[@]}; do
        # Old location
        old_usr_path="jre/lib/${new_etc_path#*$_jname/}"

        # Move
        install -Dm644 "$old_usr_path" "$pkgdir/$new_etc_path"
        ln -sf "/$new_etc_path" "$old_usr_path"
    done

    # Link NPAPI plugin
    # We most likely do not need this as the user probably has another jvm installed
    #case "$CARCH" in
    #    i686)   ln -sf $_jvmdir/jre/lib/i386/libnpjp2.so  "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so ;;
    #    x86_64) ln -sf $_jvmdir/jre/lib/amd64/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so ;;
    #esac

    # Override JVM library with dcevm
    msg2 "Replacing libjvm with dcevm..."
    case "$CARCH" in
        i686)   _jarch=i486  ;;
        x86_64) _jarch=amd64 ;;
    esac
    cp "$srcdir/linux_${_jarch}_compiler2/product/libjvm.so" "$pkgdir"/"$_jvmdir"/jre/lib/"$_jarch"/server/libjvm.so

    # Replace JKS keystore with 'ca-certificates-java'
    ln -sf /etc/ssl/certs/java/cacerts jre/lib/security/cacerts

    # Suffix man pages
    for i in $(find man/ -type f); do
        mv "$i" "${i/.1}-$_jname.1"
    done

    # Move man pages
    mv man/ja_JP.UTF-8/ man/ja
    mv man/ "$pkgdir"/usr/share

    # Move/link licenses
    mv COPYRIGHT LICENSE *.txt "$pkgdir"/usr/share/licenses/java$_major-$pkgname/
    ln -sf /usr/share/licenses/java$_major-$pkgname/ "$pkgdir"/usr/share/licenses/$pkgname

    msg2 "Installing Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files..."
    # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
    # things like 256-bit AES. Enabled by default in OpenJDK:
    # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
    # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
    install -m644 "$srcdir"/UnlimitedJCEPolicyJDK$_major/*.jar jre/lib/security/
    install -Dm644 "$srcdir"/UnlimitedJCEPolicyJDK$_major/README.txt \
                   "$pkgdir"/usr/share/doc/$pkgname/README_-_Java_JCE_Unlimited_Strength.txt

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
