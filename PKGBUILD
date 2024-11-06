# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>
# Contributor: Daringcuteseal <daringcuteseal at gmail dot com>
# Contributor: Sashanoraa <sasha@noraa.gay>
# Contributor: Felix Yan <felixonmars@archlinux.org
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn-emoji
pkgver=5.0
pkgrel=1
pkgdesc="The fastest terminal file manager ever written (with emoji as file icons)."
arch=('x86_64')
optdepends=(
    'atool: for more archive formats'
    'libarchive: for more archive formats'
    'zip: for zip archive format'
    'unzip: for zip archive format'
    'trash-cli: to trash files'
    'sshfs: mount remotes'
    'rclone: mount remotes'
    'fuse2: unmount remotes'
    'xdg-utils: desktop opener'
)
url="https://github.com/jarun/nnn"
license=('BSD')
provides=(nnn)
conflicts=(nnn)
source=("nnn-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('31e8fd85f3dd7ab2bf0525c3c0926269a1e6d35a5343a6714315642370d8605a')

prepare() {
    sed -i 's/install: all/install:/' "nnn-${pkgver}/Makefile"
}

build() {
    cd "nnn-${pkgver}"
    make O_EMOJI=1
}

package() {
    cd "nnn-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    make DESTDIR="${pkgdir}" PREFIX=/usr install-desktop

    install -Dm644 misc/auto-completion/fish/nnn.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nnn.fish"
    install -Dm644 misc/auto-completion/bash/nnn-completion.bash "${pkgdir}/usr/share/bash-completion/completions/nnn"
    install -Dm644 misc/auto-completion/zsh/_nnn "${pkgdir}/usr/share/zsh/site-functions/_nnn"

    install -Dm644 -t "${pkgdir}/usr/share/nnn/quitcd/" misc/quitcd/*

    cp -a plugins "${pkgdir}/usr/share/nnn/plugins/"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/nnn/" LICENSE
}
