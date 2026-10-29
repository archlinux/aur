# Maintainer: Emiel Kollof <emiel@kollof.nl>
pkgname=xepher-git
pkgver=1.1.0.r0.g31d1738
pkgrel=1
pkgdesc="Xepher — WeeChat plugin for XMPP/Jabber protocol (git master)"
arch=('x86_64' 'aarch64')
url="https://github.com/ekollof/xepher"
license=('MPL2')
depends=(
    'weechat>=4.3'
    'libstrophe'
    'libxml2'
    'lmdb'
    'libsignal-protocol-c'
    'libomemo-c'
    'gpgme'
    'fmt'
    'curl'
    'openssl'
)
makedepends=(
    'clang'
    'cmake'
    'ninja'
    'git'
    'bison'
    'flex'
)
provides=("xepher=${pkgver}")
conflicts=('xepher')
source=("git+https://github.com/ekollof/xepher.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/xepher"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/xepher"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/xepher"
    make PACKAGE_BUILD=1 weechat-xmpp
}

package() {
    cd "$srcdir/xepher"
    install -Dm755 xmpp.so "$pkgdir/usr/lib/weechat/plugins/xmpp.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
