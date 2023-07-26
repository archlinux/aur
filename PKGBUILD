# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=17
pkgname_=graal-icu4j
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=23.0.1
pkgrel=1
pkgdesc="GraalVM distribution of ICU4J, Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://github.com/oracle/graal'
license=('custom')
depends=("jdk${java_}-graalvm-bin")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/icu4j-installable-ce-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/icu4j-installable-ce-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('3fb44c9051a04997dcf8cd1cc04af0feb09ed0f1b0b325a4f767319aafc01a2c')
sha256sums_aarch64=('175305109fcf0f3212ea878853060099fdf3d3225546dd6b96337ff0d2d4454e')
# there is no proper license file in the distribution (https://github.com/oracle/graal/issues/6800),
# but a nested file in src/languages/icu4j/icu4j.jar/LICENSE is identical to the following:
source=('https://github.com/unicode-org/icu/raw/be6428690dc9b2e0e4a622691eb4c1101647cd2d/icu4j/main/shared/licenses/LICENSE')
sha256sums=('af3e84c401f1a35e8d32d6eb1a33fe587c3981aa5cd206033d9527c1855b57a2')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ # LICENSE_ICU4J.txt

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

    install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
