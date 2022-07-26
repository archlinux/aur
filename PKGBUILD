# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=11
pkgname_=graal-visualvm
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=22.2.0
pkgrel=1
pkgdesc="GraalVM VisualVM distribution, Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('GPL2')
depends=("jdk${java_}-graalvm-bin")
source=('LICENSE::https://raw.githubusercontent.com/oracle/graal/09883274a37a97f69a143604249db904901b6a72/tools/VISUALVM_LICENSE') # TODO use vm-${pkgver} instead of hard-coded commit next time (vm-22.2.0 tag does not include tools/VISUALVM_LICENSE)
sha256sums=('29c5bc82ed188162958c6a681bc63b5d7444630e5c907a9285141368bae650f2')
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/visualvm-installable-ce-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/visualvm-installable-ce-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('5087caf533c94ca2012f1c1ff2b502652fb8a3e56fb77263101bc523b72adf0d')
sha256sums_aarch64=('2bad5b1ac70d4d62bbbb3cbc130702c74dba2e9f49b597f527b5f789aed7cdc0')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" bin/ lib/ # TODO some LICENSE* once upstream includes it (oracle/graal#4762)

    printf '\n' >> META-INF/permissions
    while read -r file eq permissions; do
        if [[ $eq != '=' ]]; then
            printf >&2 'second word should be "=": %s %s %s\n' "$file" "$eq" "$permissions"
            return 1
        fi
        case $permissions in
            'rw-------') mode=600;;
            'rw-r--r--') mode=644;;
            'rw-rw-r--') mode=664;;
            'rwxr-xr-x') mode=755;;
            'rwxrwxr-x') mode=775;;
            'rwxrwxrwx') continue;; # symbolic link
            *)
                printf >&2 'unknown permissions: %s\n' "$permissions"
                return 1
                ;;
        esac
        case "$file" in
            'lib/visualvm/platform/modules/lib/i386'|'lib/visualvm/platform/modules/lib/amd64'|'lib/visualvm/platform/modules/lib/x86')
                if ! [[ -e "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$file" ]]; then
                    # missing directories, reported as oracle/graal#4763
                    continue;
                fi
                ;;
        esac
        chmod "$mode" -- "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$file"
    done < META-INF/permissions

    printf '\n' >> META-INF/symlinks
    while read -r name eq target; do
        if [[ "$name$eq$target" == '' ]]; then
            # skip empty line (probably empty file and we added a single blank line above)
            continue
        fi
        if [[ $eq != '=' ]]; then
            printf >&2 'second word should be "=": %s %s %s\n' "$name" "$eq" "$target"
            return 1
        fi
        mkdir -p -- "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$(dirname -- "$name")"
        ln -s -- "$target" "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$name"
    done < META-INF/symlinks

    # already in jdk${java_}-graalvm-bin package
    unlink "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/lib/installer/components/org.graalvm.component"

    # for now, copy the separately downloaded LICENSE into /usr/share/licenses/
    install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
