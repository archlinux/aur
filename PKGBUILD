java_=11
pkgname_=native-image
pkgname="${pkgname_}-jdk${java_}-ee-bin"
pkgver=20.0.0
pkgrel=1
pkgdesc="(Enterprise Edition) Plugin to turn GraalVM-based applications into native binary images (Java ${java_} version)"
arch=('x86_64')
url='https://github.com/oracle/graal'
license=('custom')
depends=("jdk${java_}-graalvm-ee-bin")
# Oracle requires login to download. Downloaded from https://www.oracle.com/tools/graalvm-enterprise-edition.html
source_x86_64=("${pkgname_}-installable-svmee-java${java_}-linux-amd64-${pkgver}.jar::https://web.archive.org/web/20200228083230/https%3A%2F%2Fdownload.oracle.com%2Fotn%2Futilities_drivers%2Foracle-labs%2Fnative-image-installable-svm-svmee-java11-linux-amd64-20.0.0.jar%3FAuthParam%3D1582878853_656f39126124eddc70c07568cddaf024")
sha256sums_x86_64=('57086123a95f1e9d4e67b92f830bad9325431908c69a40ef10f28ed586d8bd35')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/" lib/ LICENSE_NATIVEIMAGE.txt

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
        chmod "$mode" -- "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/$file"
    done < META-INF/permissions

    printf '\n' >> META-INF/symlinks
    while read -r name eq target; do
        if [[ $eq != '=' ]]; then
            printf >&2 'second word should be "=": %s %s %s\n' "$name" "$eq" "$target"
            return 1
        fi
        mkdir -p -- "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/$(dirname -- "$name")"
        ln -s -- "$target" "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/$name"
    done < META-INF/symlinks

    install -DTm644 LICENSE_NATIVEIMAGE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
