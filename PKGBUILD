# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=17
pkgname_=graalpython
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=22.2.0
pkgrel=1
pkgdesc="GraalVM-based, high-performance implementation of the Python language (early development), Java ${java_} version"
arch=('x86_64')
url='https://github.com/graalvm/graalpython'
license=('custom')
depends=(
    "jdk${java_}-graalvm-bin"
    'gcc-libs'
    'libxcrypt-compat'
    'zlib'
)
source=("https://github.com/graalvm/$pkgname_/releases/download/vm-${pkgver}/python-installable-svm-java${java_}-linux-amd64-${pkgver}.jar")
sha256sums=('35dc712e6f569152c8e206e016d382a28bbed359185f93f808782162c34ceed2')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ LICENSE_GRAALPYTHON.txt THIRD_PARTY_LICENSE_GRAALPYTHON.txt

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

    install -DTm644 LICENSE_GRAALPYTHON.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
