# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=19
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
sha256sums_x86_64=('353e4ca37d5eb31a8d1237113f17389d63202c7cfd61588d3aec3c5ea0c6f2cc')
sha256sums_aarch64=('3a7d380bb17de522da9dca201861696ce90328e1dcfaa600126f8e4be37058ed')

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
