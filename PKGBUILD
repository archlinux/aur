# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname_=graalpython
pkgname=${pkgname_}-bin
pkgver_=1.0.0-rc1
pkgver=${pkgver_/-/_}
pkgrel=1
pkgdesc='Graal based, high-performance implementation of the Python language (early development)'
arch=('x86_64')
url='https://github.com/graalvm/graalpython'
license=('custom')
depends=('graal')
makedepends=()
optdepends=()
provides=("$pkgname_")
conflicts=("$pkgname_")
source=("https://github.com/graalvm/$pkgname_/releases/download/vm-${pkgver_}/python-installable-linux-amd64.jar")
sha256sums=('19bafeda777a5522d430629ff2573aeaf9aa280a3475acc82bad354513c469ee')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-8-graal/"
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

    install -Dm644 jre/languages/python/GraalCE_Python_license_3rd_party_license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
