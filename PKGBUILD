# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Rich Li <rich at dranek com>
# Contributor: Sam Stuewe <halosghost at archlinux dot org>
# Contributor: David Lo Re <boyska@gmail.com>
# Contributor: nignux <nignux@freaknet.org>

_name=tomb
pkgbase="${_name}-git"
pkgname=("${_name}-git" "${_name}-kdf-git")
pkgver=2.0.1.r5.gd8c5cd2
pkgrel=1
pkgdesc="simple tool to manage encrypted storage"
arch=('any')
url="http://tomb.dyne.org/"
license=('GPL3')
makedepends=('git' 'libgcrypt')
install="${pkgname}.install"
conflicts=("${_name}")
provides=("${_name}")
source=("${_name}::git://github.com/dyne/${_name//t/T}.git"
        "_${_name}")
sha256sums=('SKIP'
            'ff16b05d02a18e512e9ede98542208c0605b693d997a4248bf6c1fe06f7adbd6')


pkgver() {
    cd "${_name}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
    cd "${_name}/extras/kdf-keys"
    make
}

package_tomb-git() {
    depends=('bc' 'cryptsetup' 'gnupg' 'sudo' 'zsh' 'e2fsprogs')
    optdepends=('steghide: steganography'
        'dcfldd: show nice progress during massive I/O'
        'wipe: secure file deletion'
        'qrencode: for paper backups of keys'
        'swish-e: file content indexer')

    cd "${_name}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    cd "extras/po"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    install -Dm644 "${srcdir}/_${_name}" "${pkgdir}/usr/share/zsh/site-functions/_${_name}"
}

package_tomb-kdf-git() {
    pkgdesc="Crypto Undertaker extensions to improve password security"
    arch=('i686' 'x86_64')
    depends=('libgcrypt')
    conflicts=("${_name}-kdf")
    provides=("${_name}-kdf")

    cd "${_name}/extras/kdf-keys"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
