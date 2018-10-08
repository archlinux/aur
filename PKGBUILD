# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname_=graalpython
pkgname=${pkgname_}-bin
pkgver_=1.0.0-rc7
pkgver=${pkgver_/-/_}
pkgrel=2
pkgdesc='Graal based, high-performance implementation of the Python language (early development)'
arch=('x86_64')
url='https://github.com/graalvm/graalpython'
license=('custom')
depends=('graal')
makedepends=()
optdepends=()
provides=("$pkgname_")
conflicts=("$pkgname_")
source=("https://github.com/graalvm/$pkgname_/releases/download/vm-${pkgver_}/python-installable-ce-${pkgver_}-linux-amd64.jar")
sha256sums=('a2c53657d66eaef7afb58747541edabbc632390049f3b59b87b895612f5bfc82')

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

    install -DTm644 jre/languages/python/LICENSE_GRAALPYTHON "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    ln -s ../lib/jvm/java-8-graal/bin/${pkgname_} "$pkgdir/usr/bin/"
}
