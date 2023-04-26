# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=17
pkgname_=graal-nodejs
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=22.3.2
pkgrel=1
pkgdesc="GraalVM-based, ployglot-enabled implementation of Node.js, Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://github.com/oracle/graaljs'
license=('custom')
depends=("jdk${java_}-graalvm-bin")
optdepends=("graaljs-jdk${java_}-bin: JavaScript support for non-native mode (with --jvm)")
source_x86_64=("https://github.com/oracle/graaljs/releases/download/vm-${pkgver}/nodejs-installable-svm-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/oracle/graaljs/releases/download/vm-${pkgver}/nodejs-installable-svm-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('0422f391d41175b4886f529b4e75e8003ec0e9970112aa31d9d3554767f3ee8e')
sha256sums_aarch64=('346c3e17490324465124ddfcbc82f2dc29516b1069dd2291882e6cc5e61686a4')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ LICENSE_GRAALNODEJS.txt THIRD_PARTY_LICENSE_GRAALNODEJS.txt

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

    # already in jdk${java_}-graalvm-bin package
    unlink "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/lib/installer/components/org.graalvm.component"

    install -DTm644 LICENSE_GRAALNODEJS.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
