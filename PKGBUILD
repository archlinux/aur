# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=17
pkgname_=graal-visualvm
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=23.0.1
pkgrel=1
pkgdesc="GraalVM VisualVM distribution, Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('GPL2')
depends=("jdk${java_}-graalvm-bin")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/visualvm-installable-ce-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/visualvm-installable-ce-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('f98b8fcadcae1416fed3777879c9724e75d7798ee0792c8f99d01f770163eda3')
sha256sums_aarch64=('3e358e8b9815a1523df1fd385571aee43ccea20c54462809ad60a3fe7a71c76d')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" bin/ lib/ LICENSE_VISUALVM.txt

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

    install -DTm644 LICENSE_VISUALVM.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
