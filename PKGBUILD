# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=16
pkgname_=native-image
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=21.2.0
pkgrel=1
pkgdesc="Plugin to turn GraalVM-based applications into native binary images (Java ${java_} version)"
arch=('x86_64'
      'aarch64')
url='https://github.com/oracle/graal'
license=('custom')
depends=("jdk${java_}-graalvm-bin")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/${pkgname_}-installable-svm-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/${pkgname_}-installable-svm-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('aa8bb0be49d74a1655c42244150d0c2b0286d26bb8fca1c1b43c0b3e081a42e3')
sha256sums_aarch64=('6e160dcf90ddf1fd63d2c42a29cac4d627607086b925f902c291b5195ee0fc3d')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" lib/ LICENSE_NATIVEIMAGE.txt

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
        chmod "$mode" -- "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$file"
    done < META-INF/permissions

    printf '\n' >> META-INF/symlinks
    while read -r name eq target; do
        if [[ $eq != '=' ]]; then
            printf >&2 'second word should be "=": %s %s %s\n' "$name" "$eq" "$target"
            return 1
        fi
        mkdir -p -- "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$(dirname -- "$name")"
        ln -s -- "$target" "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$name"
    done < META-INF/symlinks

    # work around https://github.com/oracle/graal/issues/2491
    unlink "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/lib/graal_isolate.h"
    unlink "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/lib/graal_isolate_dynamic.h"

    install -DTm644 LICENSE_NATIVEIMAGE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
