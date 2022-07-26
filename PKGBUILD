# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=17
pkgname_=graal-llvm
pkgname="${pkgname_}-jdk${java_}-bin"
pkgver=22.2.0
pkgrel=1
pkgdesc="GraalVM LLVM runtime (aka Sulong), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('BSD')
depends=("jdk${java_}-graalvm-bin")
source=("https://raw.githubusercontent.com/oracle/graal/vm-${pkgver}/sulong/LICENSE")
sha256sums=('6fb47d3d4e641fe19602e68ade11fa4103095cd5ddba376e4f135284ae1a1c5e')
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/llvm-installable-svm-java${java_}-linux-amd64-${pkgver}.jar")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/llvm-installable-svm-java${java_}-linux-aarch64-${pkgver}.jar")
sha256sums_x86_64=('df7eefc018f2bb0a9cd20a87221fb16d4bd460d9e9b601811dc96b22e72d7b89')
sha256sums_aarch64=('c174d21bd5c14a75e2446bebaae296f1b6a8bab07fec5be60701a22b5a79cec0')

package() {
    local file eq permissions mode name target

    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" languages/ lib/ # TODO some LICENSE* once upstream includes it (oracle/graal#4761)

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

    # for now, copy the separately downloaded LICENSE into /usr/share/licenses/
    install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
