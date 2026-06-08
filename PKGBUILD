# Maintainer: invokekitty (sery)

pkgname=serycade-git
pkgdesc='Some tui games i made because i was bored. Currently pong and a maze'
pkgver=r41.284908c
pkgrel=1
license=('CDDL-1.0')
url='https://serenit.ie/projects#serycade'
arch=('x86_64' 'aarch64')

depends=('libcrypt.so')
makedepends=(gradle git)
source=('git+https://codeberg.org/sery/serycade.git')
sha256sums=('SKIP')

srcName='serycade'
binaryName='serycade'

prepare() {
    cd "$srcName"
    if [[ -z "$(git config --get user.name)" ]]; then
      git config user.name local && git config user.email '<>' && git config commit.gpgsign false
    fi
}

pkgver() {
    cd "$srcName"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    local target=$(_target caps)

    # Figure out jvm >= 17 installation
    for jvm in /usr/lib/jvm/*; do
        if [ ! -f "$jvm/release" ]; then continue; fi
        local java_major=$(sed -n -r 's/^JAVA_VERSION="(.*)"$/\1/p' < "$jvm/release" | cut -d. -f1)
        if [ "$java_major" -ge 17 ]; then
            export JAVA_HOME=$jvm
            break
        fi
    done

    # Also using local gradle directory to avoid weird conflicts
    cd "$srcName"
    gradle --no-daemon -g "$srcdir/gradle" "linkReleaseExecutable$target"
}

package() {
    local target=$(_target)

    cd "$srcName"

    install -v -Dm755 "build/bin/$target/releaseExecutable/$binaryName.kexe" "$pkgdir/usr/bin/$binaryName"
    install -v -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_target() {
    local target
    case "$CARCH" in
        "x86_64") target='linuxX64'; ;;
        "aarch64") target='linuxArm64'; ;;
    esac
    if [ "$1" == caps ]; then echo "${target^}"; else echo "$target"; fi
}
