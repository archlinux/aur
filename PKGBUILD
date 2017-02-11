# Maintainer: Sander Zuidema <archlinux at grunny dot demon dot nl>
# Based on jre: https://aur.archlinux.org/packages/jre/

pkgname=server-jre
_major=8
_minor=121
_build=b13
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Oracle Server Java Runtime Environment"
arch=('x86_64')
url=http://www.oracle.com/technetwork/java/javase/downloads/index.html
license=('custom')
depends=('ca-certificates-java' 'java-runtime-common')
makedepends=('pacman>=4.2.0')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" 
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major")

# Variables
DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')
_jname=${pkgname}${_major}
_jvmdir=/usr/lib/jvm/java-$_major-$pkgname/jre

backup=("etc/java-$_jname/amd64/jvm.cfg"
        "etc/java-$_jname/images/cursors/cursors.properties"
        "etc/java-$_jname/management/jmxremote.access"
        "etc/java-$_jname/management/management.properties"
        "etc/java-$_jname/security/java.policy"
        "etc/java-$_jname/security/java.security"
        "etc/java-$_jname/content-types.properties"
        "etc/java-$_jname/flavormap.properties"
        "etc/java-$_jname/fontconfig.properties.src"
        "etc/java-$_jname/logging.properties"
        "etc/java-$_jname/net.properties"
        "etc/java-$_jname/psfont.properties.ja"
        "etc/java-$_jname/psfontj2d.properties"
        "etc/java-$_jname/sound.properties")
options=()
install=$pkgname.install
changelog=
source=("http://download.oracle.com/otn-pub/java/jce/$_major/jce_policy-$_major.zip"
        "http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$pkgname-$pkgver-linux-x64.tar.gz")
sha256sums=('f3020a3922efd6626c2fff45695d527f34a8020e938a49292561f18ad1320b59'
            'd97f0f402bd65a9c26aa266246b0894c8d6762e82373377641ca779c46406299')

package() {
    cd jdk1.${_major}.0_${_minor}

    msg2 "Creating directory structure..."
    install -d "$pkgdir"/etc/.java/.systemPrefs
    install -d "$pkgdir"/usr/lib/jvm/java-$_major-$pkgname/jre/bin
    install -d "$pkgdir"/usr/share/licenses/java$_major-$pkgname

    msg2 "Removing redundancies..."
    rm    man/ja

    msg2 "Moving contents..."
    mv * "$pkgdir"/$_jvmdir

    # Cd to the new playground
    cd "$pkgdir"/$_jvmdir

    msg2 "Fixing directory structure..."

    # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-$_jname/lib -> /etc
    for new_etc_path in ${backup[@]}; do
        # Old location
        old_usr_path="jre/lib/${new_etc_path#*$_jname/}"

        # Move
        install -Dm644 "$old_usr_path" "$pkgdir/$new_etc_path"
        ln -sf "/$new_etc_path" "$old_usr_path"
    done

    # Replace JKS keystore with 'ca-certificates-java'
    ln -sf /etc/ssl/certs/java/cacerts jre/lib/security/cacerts

    # Suffix man pages
    for i in $(find man/ -type f); do
        mv "${i}" "${i/.1}-${_jname}.1"
    done

    # Move man pages
    mv man/ja_JP.UTF-8/ man/ja
    mv man/ "$pkgdir"/usr/share
 
   # Move/link licenses
    mv COPYRIGHT LICENSE jre/README *.txt "$pkgdir"/usr/share/licenses/java$_major-$pkgname/
    ln -sf /usr/share/licenses/java$_major-$pkgname/ "$pkgdir"/usr/share/licenses/$pkgname

    msg2 "Installing Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files..."
    # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
    # things like 256-bit AES. Enabled by default in OpenJDK:
    # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
    # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
    install -m644 "$srcdir"/UnlimitedJCEPolicyJDK$_major/*.jar jre/lib/security/
    install -Dm644 "$srcdir"/UnlimitedJCEPolicyJDK$_major/README.txt \
                   "$pkgdir"/usr/share/doc/$pkgname/README_-_Java_JCE_Unlimited_Strength.txt

}
