# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=17
pkgname="graalwasm-jdk${java_}-bin"
pkgver=22.3.1
pkgrel=1
pkgdesc="GraalVM-based, high-performance WebAssembly platform, Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://github.com/oracle/graal'
license=('custom')
depends=("jdk${java_}-graalvm-bin")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/wasm-installable-svm-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/wasm-installable-svm-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('45c21f1280b5e1e2abfe4aa8cca46a51a3169a6a67105853b4c7619281d7d669')
sha256sums_aarch64=('0b1dfcd31637f0f204558b52125b6c18c913a078f7b2949d02d4e5287dffe9b1')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ LICENSE_WASM.txt

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

    install -DTm644 LICENSE_WASM.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
