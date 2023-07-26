# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=17
pkgname_=graal-llvm
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=23.0.1
pkgrel=1
pkgdesc="GraalVM LLVM runtime (aka Sulong), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('BSD')
depends=("jdk${java_}-graalvm-bin")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/llvm-installable-svm-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/llvm-installable-svm-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('4353554eeda7871895f9b4b6053dc15cf42e7544498230a7cac2707df74eea78')
sha256sums_aarch64=('2b23869f9d599c8f8e89635f7f0a471d3bc55b8f4f5641d628c082f257af9f55')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ LICENSE_SULONG.txt THIRD_PARTY_LICENSE_SULONG.txt

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

    # already in jdk${java_}-graalvm-bin package
    unlink "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/lib/installer/components/org.graalvm.component"

    install -DTm644 LICENSE_SULONG.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
