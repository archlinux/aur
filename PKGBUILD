# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=8
pkgname="espresso-jdk${java_}-bin"
pkgver=21.1.0
pkgrel=1
pkgdesc="GraalVM-based Java implementation as a Truffle language, Java ${java_} version"
arch=('x86_64')
url='https://github.com/oracle/graal'
license=('GPL2')
depends=("jdk${java_}-graalvm-bin")
source=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/espresso-installable-java${java_}-linux-amd64-${pkgver}.jar")
sha256sums=('952e14d5c12f3bf9d494d6fa55ea41a20ad24b0b105d8672483a421f9192c0c1')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" jre/ lib/ LICENSE_JAVAONTRUFFLE

    [[ -s META-INF/permissions ]] && printf '\n' >> META-INF/permissions
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

    [[ -s META-INF/symlinks ]] && printf '\n' >> META-INF/symlinks
    while read -r name eq target; do
        if [[ $eq != '=' ]]; then
            printf >&2 'second word should be "=": %s %s %s\n' "$name" "$eq" "$target"
            return 1
        fi
        mkdir -p -- "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$(dirname -- "$name")"
        ln -s -- "$target" "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/$name"
    done < META-INF/symlinks

    install -DTm644 LICENSE_JAVAONTRUFFLE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
