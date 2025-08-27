# Maintainer: Mus <sonics0977703996@gmail.com>
pkgname=rain-git
_commit=$(git ls-remote https://github.com/musdev13/rain.git HEAD | cut -c1-7)
pkgver=r62.4259a22
pkgrel=1
pkgdesc="Rain - Simple TUI player"
arch=('x86_64')
url="https://github.com/musdev13/rain"
license=('GPL3')
depends=('mpv' 'taglib' 'curl' 'nlohmann-json')
makedepends=('git' 'make' 'gcc')
optdepends=('yt-dlp: for YouTube Music and Spotify')
provides=('rain')
conflicts=('rain')
source=("$pkgname::git+https://github.com/musdev13/rain.git")
md5sums=('SKIP')

# version
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# checking ftxui
prepare() {
    cd "$pkgname"

    if ! pacman -Q ftxui &> /dev/null; then
        echo "Error: You need to install ftxui from AUR first"
        echo "Use: yay -S ftxui or paru -S ftxui"
        exit 1
    fi
}

# building
build() {
    cd "$pkgname"
    make -j$(nproc)
}

# checking build
check() {
    cd "$pkgname"

    if [[ ! -f "build/rain" ]]; then
        echo "Error: can't find a binary in build/"
        return 1
    fi
}

# installing
package() {
    cd "$pkgname"

    install -Dm755 build/rain "$pkgdir/usr/bin/rain"

    if [[ -f "README.md" ]]; then
        install -Dm644 docs/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi

    if [[ -f "LICENSE" ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
