# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname__=native-image
pkgname_=graal-${pkgname__}
pkgname=${pkgname_}-bin
pkgver_=19.1.0
pkgver=${pkgver_/-/_}
pkgrel=1
pkgdesc='Plugin to turn Graal-based applications into native binary images'
arch=('x86_64')
url='https://github.com/oracle/graal'
license=('custom')
depends=('graal')
makedepends=()
optdepends=()
provides=("$pkgname_")
conflicts=("$pkgname_")
source=("https://github.com/oracle/graal/releases/download/vm-${pkgver_}/${pkgname__}-installable-svm-linux-amd64-${pkgver_}.jar")
sha256sums=('db2c51fc131d7e6142c18e85cc0a03b939898ab58382c1bb349a5cd7c1c2424a')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-8-graal/" "$pkgdir/usr/bin/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-8-graal/" jre/

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
        chmod "$mode" -- "$pkgdir/usr/lib/jvm/java-8-graal/$file"
    done < META-INF/permissions

    printf '\n' >> META-INF/symlinks
    while read -r name eq target; do
        if [[ $eq != '=' ]]; then
            printf >&2 'second word should be "=": %s %s %s\n' "$name" "$eq" "$target"
            return 1
        fi
        mkdir -p -- "$pkgdir/usr/lib/jvm/java-8-graal/$(dirname -- "$name")"
        ln -s -- "$target" "$pkgdir/usr/lib/jvm/java-8-graal/$name"
    done < META-INF/symlinks

    install -DTm644 jre/lib/svm/LICENSE_NATIVEIMAGE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    ln -s ../lib/jvm/java-8-graal/bin/${pkgname__} "$pkgdir/usr/bin/"
}
