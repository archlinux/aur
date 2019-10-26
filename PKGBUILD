# Maintainer: Zpalmtree <https://github.com/zpalmtree>
pkgname=violetminer-git
pkgver=v0.1.1.r8.g09157ed
pkgrel=1
pkgdesc='Argon2 CPU and Nvidia miner for TurtleCoin and WrkzCoin'
arch=('x86_64' 'aarch64')
url='https://github.com/turtlecoin/violetminer'
license=('GPL3')
makedepends=('git' 'cmake')
optdepends=('cuda: Nvidia GPU mining support')
conflicts=('violetminer-bin')
source=('git+https://github.com/turtlecoin/violetminer.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/violetminer"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/violetminer"

    git checkout development

    git submodule update --init --recursive

    mkdir -p build

    cd build

    if pacman -Qq cuda >/dev/null 2>&1;
    then
        cmake ..
    else
        printf "\e[1;31mWARNING: Nvidia mining support is DISABLED. Please install cuda and reinstall this package if you wish to mine with a Nvidia GPU.\n\e[0m"
        cmake -DENABLE_NVIDIA=OFF ..
    fi

    cmake ..

    make
}

package() {
    # Install in /usr/bin/
    install -D -m755 "$srcdir/violetminer/build/violetminer" -t "$pkgdir/usr/bin/"
}
