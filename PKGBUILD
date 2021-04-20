# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=11
pkgname_=graal-nodejs
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=21.1.0
pkgrel=1
pkgdesc="GraalVM-based, ployglot-enabled implementation of Node.js, Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://github.com/oracle/graaljs'
license=('custom')
depends=("jdk${java_}-graalvm-bin")
source_x86_64=("https://github.com/oracle/graaljs/releases/download/vm-${pkgver}/nodejs-installable-java${java_}-linux-amd64-${pkgver}.jar"
               "https://github.com/oracle/graaljs/raw/vm-${pkgver}/LICENSE")
source_aarch64=("https://github.com/oracle/graaljs/releases/download/vm-${pkgver}/nodejs-installable-java${java_}-linux-aarch64-${pkgver}.jar"
               "https://github.com/oracle/graaljs/raw/vm-${pkgver}/LICENSE")
sha256sums_x86_64=('0488d86152e45d0424c5401f62c6b6f92c46ee171cf2874337c0797ae542b02f'
                   '2c0950e91e3b7cf3671ca3c5d68b21ce72960b81f9ba09659f61cc2ebed67ecd')
sha256sums_aarch64=('6ed0b0ccf6cb13d7d6cbad3834f21311f84c01cca7dac496f64a4e3b3b0348e5'
                    '2c0950e91e3b7cf3671ca3c5d68b21ce72960b81f9ba09659f61cc2ebed67ecd')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ LICENSE

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

    install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
