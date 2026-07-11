# Maintainer: invokekitty (sery)

pkgname=serycade-git
pkgdesc='Some tui games i made because i was bored. Currently pong and a maze'
pkgver=r42.1ab2c09
pkgrel=2
license=('CDDL-1.0')
url='https://serenit.ie/projects#serycade'
arch=('x86_64' 'aarch64')

depends=('libcrypt.so')
makedepends=(git)
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
    cd "$srcName"
    chmod +x ./kotlin
    ./kotlin build -v release -p "$(_target)"
}

package() {
    local target=$(_target)

    cd "$srcName"

    install -v -Dm755 build/tasks/*_link*Release/*.kexe "$pkgdir/usr/bin/$binaryName"
    strip -v "$pkgdir/usr/bin/$binaryName"
    install -v -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_target() {
    local target
    case "$CARCH" in
        "x86_64") target='linuxX64'; ;;
        "aarch64") target='linuxArm64'; ;;
    esac
    echo "$target"
}
