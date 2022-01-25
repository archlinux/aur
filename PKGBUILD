# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=11
pkgname_=truffleruby
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=22.0.0.2
pkgrel=1
pkgdesc="GraalVM-based, high-performance implementation of the Ruby language (Java ${java_} version)"
arch=('x86_64'
      'aarch64')
url='https://github.com/oracle/truffleruby'
license=('EPL' 'GPL2' 'LGPL2.1')
depends=("jdk${java_}-graalvm-bin")
source_x86_64=("https://github.com/oracle/$pkgname_/releases/download/vm-${pkgver}/ruby-installable-svm-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/oracle/$pkgname_/releases/download/vm-${pkgver}/ruby-installable-svm-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('e90f7ebc13b6c1f8e3f98881bb4fe2336870744174b2b6d41dc672d15f0b9a40')
sha256sums_aarch64=('e0fb582a9c6b4167e7dc267c58ca1968bd1c471b3bc5c56061b436f175486d80')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ LICENSE_TRUFFLERUBY.txt 3rd_party_licenses_truffleruby.txt

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

    install -DTm644 LICENSE_TRUFFLERUBY.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
