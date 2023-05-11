# Maintainer: Luuk van Baal <luukvbaal@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn-nerd
pkgver=4.8
pkgrel=2
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
source=("nnn-efd5bc9db100d0489cfb3d982a69b04dacaff852.tar.gz::${url}/archive/efd5bc9db100d0489cfb3d982a69b04dacaff852.tar.gz")
sha512sums=('bbc3ce50da793050b0f15aa892cbbfef8d150ef8d1425e40f2bebb1802ff6704bb7dfc4ffd8019209c7e549202258d00e476a16bba873acfac8239a50a2a8e46')

prepare() {
    sed -i 's/install: all/install:/' "${provides}-efd5bc9db100d0489cfb3d982a69b04dacaff852/Makefile"
}

build() {
	cd "${provides}-efd5bc9db100d0489cfb3d982a69b04dacaff852"
	make O_NERD=1
}

package() {
    cd "${provides}-efd5bc9db100d0489cfb3d982a69b04dacaff852"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    make DESTDIR="${pkgdir}" PREFIX=/usr install-desktop

    install -Dm644 misc/auto-completion/fish/nnn.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nnn.fish"
    install -Dm644 misc/auto-completion/bash/nnn-completion.bash "${pkgdir}/usr/share/bash-completion/completions/nnn"
    install -Dm644 misc/auto-completion/zsh/_nnn "${pkgdir}/usr/share/zsh/site-functions/_nnn"

    install -Dm644 -t "${pkgdir}/usr/share/nnn/quitcd/" misc/quitcd/*

    cp -a plugins "${pkgdir}/usr/share/nnn/plugins/"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${provides}/" LICENSE
}
