# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Rich Li <rich at dranek com>
# Contributor: Sam Stuewe <halosghost at archlinux dot org>
# Contributor: David Lo Re <boyska@gmail.com>
# Contributor: nignux <nignux@freaknet.org>

_name=tomb
pkgbase="${_name}-git"
pkgname=("${_name}-git" "${_name}-kdf-git")
pkgver=2.4.r1.gc858def
pkgrel=2
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
            '1e99f8bd972f4325f822bd7bd7c27abcd0bcf08d4f313a43011fb0a4a7ca7c43')


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
