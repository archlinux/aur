# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=20
pkgname_=graal-regex
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=23.0.0
pkgrel=1
pkgdesc="GraalVM regular expressions language, Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://github.com/oracle/graal'
license=('custom')
depends=("jdk${java_}-graalvm-bin")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/regex-installable-ce-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/regex-installable-ce-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('197889c8274021b4f096b707fdc17e8a0dddc1e3b2f13aee57827b4d30495333')
sha256sums_aarch64=('5e44bbc71c5c8dc3193810bb3b8396df3519afdb740ee1d54085918c4ad565bc')
# there is no proper license file in the distribution (https://github.com/oracle/graal/issues/6800),
# but presumably the following license applies:
source=('https://github.com/oracle/graal/raw/graal-23.0.0/regex/LICENSE.md')
sha256sums=('7d2369d11c040d7937191c1222d4910071fddf7413b1b4f743eee982e8ab63fd')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ # LICENSE_REGEX.txt

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

    install -DTm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
