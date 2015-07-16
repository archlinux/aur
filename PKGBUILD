# Maintainer: Det <nimetonmaili g-mail>
# Based on jre-devel: https://aur.archlinux.org/packages/jre-devel/
# Contributors: Damian Nowak

_pkgname=jre
pkgname=bin32-jre-devel
_major=9
#_minor=1
_build=b72
_date=08_jul_2015
_pkgver=$_major
pkgver=${_major}${_build}
#_pkgver=${_major}u${_minor}
#pkgver=${_major}u${_minor}.${_build}
pkgrel=1
pkgdesc="Oracle Java $_major Runtime Environment Snapshot (32-bit)"
arch=('x86_64')
url=https://jdk$_major.java.net/
license=('custom')
depends=('ca-certificates-java' 'desktop-file-utils' 'hicolor-icon-theme' 'java32-runtime-common' 'lib32-glibc'
         'lib32-libjpeg-turbo' 'lib32-lcms2' 'lib32-libxrender' 'lib32-libxtst' 'shared-mime-info' 'xdg-utils')
optdepends=('lib32-alsa-lib: for basic sound support'
            'lib32-gtk2: for Gtk+ look and feel (desktop)'
            'ttf-font: fonts')
makedepends=('pacman>=4.2.0')
provides=("java32-runtime=$_major" "java32-runtime-headless=$_major" "java32-web-start=$_major"
          "java32-runtime-jre=$_major" "java32-runtime-headless-jre=$_major" "java32-web-start-jre=$_major")

# Variables
_jname=${_pkgname}${_major}
_jvmdir=/usr/lib32/jvm/java32-$_major-$_pkgname/jre

backup=("etc/java32-$_jname/i386/jvm.cfg"
        "etc/java32-$_jname/images/cursors/cursors.properties"
        "etc/java32-$_jname/management/jmxremote.access"
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
install=$pkgname.install
source=("policytool32-$_jname.desktop"
        'OTN-Early-Adopter-License-Terms.txt')
source_x86_64=("http://download.java.net/jdk$_major/archive/$_build/binaries/$_pkgname-$_pkgver-ea-bin-$_build-linux-i586-$_date.tar.gz")
md5sums=('643277e142823bf695b0a6327d3ef963'
         'f09947a67691a2d78d20a3885889981c')
md5sums_x86_64=('81d37ae7a968396838dd2df90fc159e6')

package() {
    cd ${_pkgname}1.${_major}.0

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib32/jvm/java32-$_major-$_pkgname/jre/bin
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

    msg2 "Fixing directory structure..."
    # Suffix .desktops + icons (sun-java.png -> sun-java32-$_jname.png)
    for i in $(find lib/desktop/ -type f); do
        rename -- "." "32-$_jname." $i
    done

    # Fix .desktop paths
    sed -e "s|Exec=|&$_jvmdir/bin/|" \
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
    mv COPYRIGHT LICENSE README *.txt "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32/
    install -m644 "$srcdir"/OTN-Early-Adopter-License-Terms.txt "$pkgdir"/usr/share/licenses/java${_major}-${_pkgname}32/
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
