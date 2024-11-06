# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn-emoji-git
_pkgname=nnn
pkgver=5.0.r23.gab375de7
pkgrel=1
pkgdesc="The fastest terminal file manager ever written (with emoji as file icons)."
arch=('x86_64')
depends=('bash' 'sed')
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
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    sed -i 's/install: all/install:/' "${srcdir}/${_pkgname}/Makefile"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make O_EMOJI=1
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    make DESTDIR="${pkgdir}" PREFIX=/usr install-desktop

    install -Dm644 misc/auto-completion/fish/nnn.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nnn.fish"
    install -Dm644 misc/auto-completion/bash/nnn-completion.bash "${pkgdir}/usr/share/bash-completion/completions/nnn"
    install -Dm644 misc/auto-completion/zsh/_nnn "${pkgdir}/usr/share/zsh/site-functions/_nnn"

    install -Dm644 -t "${pkgdir}/usr/share/nnn/quitcd/" misc/quitcd/*

    cp -a plugins "${pkgdir}/usr/share/nnn/plugins/"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
}
