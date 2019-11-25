# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=11
pkgname_=native-image
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=19.3.0
pkgrel=1
pkgdesc="Plugin to turn GraalVM-based applications into native binary images (Java ${java_} version)"
arch=('x86_64')
url='https://github.com/oracle/graal'
license=('custom')
depends=("jdk${java_}-graalvm-bin")
source=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/${pkgname_}-installable-svm-java${java_}-linux-amd64-${pkgver}.jar")
sha256sums=('ed8a281df66a438e116fff2dec71c201594fd39c82c7152d67a1dbb4dd58992d')

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

    install -DTm644 LICENSE_NATIVEIMAGE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
