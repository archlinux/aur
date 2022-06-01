# Contributor: Marcell Meszaros
# Contributor: ebiadsu
# Contributor: Det
# Contributor: josephgbr

_bundleid=246462
_hash=2dee051a5d0647d5be72a7c0abff270e
_major=8
_minor=333
_pkgname=jre

pkgname=bin32-jre
pkgver="${_major}.u${_minor}"
pkgrel=1
pkgdesc="Oracle Java $_major Runtime Enviroment (32-bit) with desktop integration (GUI, sound)"
arch=('x86_64')
url="https://www.java.com/en/download/linux_manual.jsp"
license=('custom:Oracle-OTN')
depends=(
    'bash'
    'ca-certificates-java'
    'hicolor-icon-theme'
    'java32-runtime-common'
    'lib32-alsa-lib'
    'lib32-gcc-libs'
    'lib32-glibc'
    'lib32-gtk3'
    'lib32-libgl'
    'lib32-libx11'
    'lib32-libxext'
    'lib32-libxi'
    'lib32-libxrender'
    'lib32-libxtst'
    'lib32-libxxf86vm'
    'xdg-utils'
)
optdepends=('lib32-gtk2: for GTK2 desktop (GUI) support')
provides=("java32-runtime=$_major"
          "java32-runtime-headless=$_major"
          "java32-web-start=$_major"
          "java32-runtime-jre=$_major"
          "java32-runtime-headless-jre=$_major"
          "java32-web-start-jre=$_major"
          "java32-openjfx=$_major")

# Variables
DLAGENTS=("${DLAGENTS[@]//curl -/curl --retry 3 --retry-delay 3 -fL -b 'oraclelicense=a' -}")
_jname=${_pkgname}${_major}
_jvmdir=/usr/lib32/jvm/java32-$_major-$_pkgname/jre

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
install=$pkgname.install
source=(
  "${_pkgname}-oracle-${pkgver/.u/u}-linux-i586.tar.gz::https://javadl.oracle.com/webapps/download/AutoDL?BundleId=${_bundleid}_${_hash}"
  "jce_policy-oracle-$_major.zip::http://download.oracle.com/otn-pub/java/jce/$_major/jce_policy-$_major.zip"
  "policytool32-$_jname.desktop"
)
b2sums=('05f998edbf2f283c869db7794cd7982b53d00cb089e76bdbc3ac736d2a1d3ea05f53266e5afb76093d6add10c8be7503d6a3e6fd922f5b7947309edb5c1fb391'
        'b37dde063e52817af2c492b44807f56a07e6867f6d797320b511e5f288c8b3b18106aac61fae0473be7260a2842f998d28de5f8484d6df24f225a7c2a1965693'
        'a28581f53d2e862da835b4d7e499e8508b9c074c7e4ed442a494260fe99d6e17817a8e58eddc2456f8349f3e8f8c037f9c769a78cdfd5acef65b3dd112f2c841')
options=('!strip')  # Don't modify foreign binaries

package() {
    cd ${_pkgname}1.${_major}.0_${_minor}

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib32/jvm/java32-$_major-$_pkgname/jre/bin
    install -d "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32

    msg2 "Removing redundancies..."
    rm -r lib/desktop/icons/HighContrast/
    rm -r lib/desktop/icons/HighContrastInverse/
    rm -r lib/desktop/icons/LowContrast/
    rm    lib/fontconfig.*.bfc
    rm    lib/fontconfig.*.properties.src
    rm    man/ja
    rm -r plugin/

    msg2 "Moving contents..."
    mv * "$pkgdir"/$_jvmdir

    # Cd to the new playground
    cd "$pkgdir"/$_jvmdir

    msg2 "Fixing directory structure..."
    # Suffix .desktops + icons (sun-java.png -> sun-java32-$_jname.png)
    for i in $(find lib/desktop/ -type f); do
        rename -- "." "32-$_jname." $i
    done

    # Fix .desktop paths
    sed -e "s|Exec=|Exec=$_jvmdir/bin/|" \
        -e "s|.png|32-$_jname.png|" \
        -i lib/desktop/applications/*

    # Make JavaWS version visible to end user
    sed -e "s|Name=JavaWS|Name=JavaWS 8 (32-bit)|" \
        -e "s|Comment=JavaWS|Comment=Java Web Start 8 (32-bit)|" \
        -i lib/desktop/applications/sun-javaws32-jre8.desktop

    # Move .desktops + icons to /usr/share
    mv lib/desktop/* "$pkgdir"/usr/share/
    install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

    # Move confs to /etc and link back to /usr: /usr/lib32/jvm/java32-$_jname/lib -> /etc
    for new_etc_path in ${backup[@]}; do
        # Old location
        old_usr_path="lib/${new_etc_path#*$_jname/}"

        # Move
        install -Dm644 "$old_usr_path" "$pkgdir/$new_etc_path"
        ln -sf "/$new_etc_path" "$old_usr_path"
    done

    # Replace JKS keystore with 'ca-certificates-java'
    ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

    # Suffix man pages
    for i in $(find man/ -type f); do
        mv "$i" "${i/.1}32-$_jname.1"
    done

    # Move man pages
    mv man/ja_JP.UTF-8/ man/ja
    mv man/ "$pkgdir"/usr/share

    # Move/link licenses
    mv COPYRIGHT LICENSE README *.txt "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32/
    ln -sf /usr/share/licenses/java${_major}-${_pkgname}32/ "$pkgdir"/usr/share/licenses/$pkgname

    msg2 "Installing Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files..."
    # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
    # things like 256-bit AES. Enabled by default in OpenJDK:
    # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
    # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
    install -m644 "$srcdir"/UnlimitedJCEPolicyJDK$_major/*.jar lib/security/
    install -Dm644 "$srcdir"/UnlimitedJCEPolicyJDK$_major/README.txt \
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
