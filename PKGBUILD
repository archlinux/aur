# Maintainer: AndroidHyper <iuseopensusebtw@gmail.com>
pkgname=superinstall-bin
pkgver=1.8
pkgrel=1
pkgdesc="A security-focused package manager alternative to paru and yay (C & Raylib Port - Binary package)"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/AndroidHyperOfficial/superinstall-aur-helper"
license=('GPL-3.0')
depends=('pacman' 'git' 'curl' 'gnupg' 'glibc' 'raylib' 'libx11')
makedepends=('gcc' 'git')
provides=('superinstall')
conflicts=('superinstall')
options=(!debug !strip)

# Pull directly from the Git repository to completely avoid tag 404 errors
source=("git+https://github.com/AndroidHyperOfficial/superinstall-aur-helper.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/superinstall-aur-helper"
    mkdir -p build
}

build() {
    # Step into csuperinstall directly to find your modular C files
    cd "${srcdir}/superinstall-aur-helper/csuperinstall"
    
    gcc main.c \
        backends/backends.c \
        backends/pacman.c \
        providers/providers.c \
        providers/aur.c \
        -o ../build/superinstall \
        -O3 \
        -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
}

package() {
    cd "${srcdir}/superinstall-aur-helper"
    
    # 1. Install the compiled binary to /usr/bin
    install -Dm755 build/superinstall "${pkgdir}/usr/bin/superinstall"
    
    # 2. Install the Nerd Font to system fonts folder so the GUI renders crisply
    install -Dm644 csuperinstall/fonts/UbuntuMonoNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/UbuntuMonoNerdFont-Regular.ttf"
}