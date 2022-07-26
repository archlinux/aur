# Maintainer: Luuk van Baal <luukvbaal@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn-nerd
pkgver=4.6
pkgrel=1
pkgdesc="The fastest terminal file manager ever written (with icon support using a patched nerd font)."
arch=('x86_64')
depends=('bash')
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
sha512sums=('714e31523036ffce0637809234c373d72baf70263c9ef0ce4d38557ffca0689b51ea0c79c62038d00fd68f668cc2985a8c28b2feeaa6da3b07028b4f1de61f89')

prepare() {
    sed -i 's/install: all/install:/' "${provides}-${pkgver}/Makefile"
}

build() {
	cd "${provides}-${pkgver}"
	make O_NERD=1
}

package() {
    cd "${provides}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    make DESTDIR="${pkgdir}" PREFIX=/usr install-desktop

    install -Dm644 misc/auto-completion/fish/nnn.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nnn.fish"
    install -Dm644 misc/auto-completion/bash/nnn-completion.bash "${pkgdir}/usr/share/bash-completion/completions/nnn"
    install -Dm644 misc/auto-completion/zsh/_nnn "${pkgdir}/usr/share/zsh/site-functions/_nnn"

    install -Dm644 -t "${pkgdir}/usr/share/nnn/quitcd/" misc/quitcd/*

    cp -a plugins "${pkgdir}/usr/share/nnn/plugins/"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${provides}/" LICENSE
}
