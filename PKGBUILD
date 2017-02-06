# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Rich Li <rich at dranek com>
# Contributor: Sam Stuewe <halosghost at archlinux dot org>
# Contributor: David Lo Re <boyska@gmail.com>
# Contributor: nignux <nignux@freaknet.org>

_name=tomb
pkgbase="${_name}-git"
pkgname=("${_name}-git" "${_name}-kdf-git")
pkgver=2.3.r12.g5b7f875
pkgrel=1
pkgdesc="simple tool to manage encrypted storage"
arch=('any')
url="http://tomb.dyne.org/"
license=('GPL3')
makedepends=('git' 'libgcrypt')
conflicts=("${_name}")
provides=("${_name}")
source=("${_name}::git://github.com/dyne/${_name//t/T}.git"
        "_${_name}")
sha256sums=('SKIP'
            '3952cda7762fded6e9fd03be4b4b2634f50ea20fba72c6a2803978f228630749')


pkgver() {
    cd "${_name}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
    cd "${_name}/extras/kdf-keys"
    make
}

package_tomb-git() {
    depends=('cryptsetup' 'gnupg' 'sudo' 'zsh' 'e2fsprogs')
    optdepends=('lsof: allows the operation slam'
        'steghide: steganography'
        'dcfldd: show nice progress during massive I/O'
        'wipe: secure file deletion'
        'qrencode: for paper backups of keys'
        'swish-e: file content indexer')

    cd "${_name}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    cd "extras/translations"
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
