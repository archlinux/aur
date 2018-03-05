# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>

# The current relase v0.4 is broken and we need the commit following the
# release tag, too. So we currently cannot use "#tag=v${pkgver}" in the
# git url, but we also do not want to use git-HEAD, so we use the commit
# hash.

pkgname=pusher
pkgver=0.4_1
pkgrel=1
pkgdesc="Command line client for PushNotifier"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/HackHerz/pusher"
license=('GPL3')
depends=('curl')
optdepends=()
makedepends=()

source=("$pkgname::git+https://github.com/HackHerz/pusher#commit=20a492cfe94161fda7692801f64176d45b6afa0b"
        'pushnotifier-sdk-cpp::git+https://github.com/HackHerz/pushnotifier-sdk-cpp'
        'simpleini::git+https://github.com/brofield/simpleini'
        'cppcodec::git+https://github.com/tplgy/cppcodec'
        'json::git+https://github.com/nlohmann/json')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.pushnotifier-sdk-cpp.url "$srcdir/pushnotifier-sdk-cpp"
    git config submodule.simpleini.url "$srcdir/simpleini"
    git submodule update

    cd "src/pushnotifier-sdk-cpp"
    git submodule init
    git config submodule.cppcodec.url "$srcdir/cppcodec"
    git config submodule.json.url "$srcdir/json"
    git submodule update
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"

    # "make install" does not honor DESTDIR and does not create missing
    # directories.
    install -Dm755 pusher "$pkgdir/usr/bin/pusher"
}
