# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon "m2x +dotdev>
# Contributor: Angel Velasquez <angvp@archlinux.org>

_py="python2"
_pkg="notify"
pkgname="${_py}-${_pkg}"
pkgver=0.1.1
pkgrel=14
pkgdesc="Python bindings for lib${pkg}"
arch=('i686' 'x86_64')
_url="http://www.galago-project.org/"
url="https://web.archive.org/web/20210304223822/${url}/news/index.php"
license=('GPL')
depends=(
  'pygtk>=2.22.0'
  "lib${_pkg}>=0.7.1"
)
makedepends=(
  "ipfs-dlagent"
  "${_py}"
)
conflicts=("python-${_pkg}<=0.1.1-11")
replaces=("python-${_pkg}<=0.1.1-11")
_ipfs_msg=("Could not find %u. Manually download it to \"$(pwd)\", "
           "or set up an ipfs:// DLAGENT in /etc/makepkg.conf.\"; exit 1")
DLAGENTS+=(
  "ipfs:///usr/bin/echo '${_ipfs_msg[*]}'"
)
source=(
  "${_pkg}-python-${pkgver}::ipfs://QmUrkNKgBrRJ1ha4Yv7Mh7RCvTq1kRQWEWDLZmuLmcVLvU"
  # "${url}/files/releases/source/${_pkg}-python/${_pkg}-python-${pkgver}.tar.gz"
  "lib${_pkg}07.patch"
  "${_pkg}-python-0.1.1-fix-GTK-symbols.patch")
sha512sums=(
  'f900d58e4004d199f718e458ebaa9b654c0040b848312f6fe5a885afbdf67c771fd3360b4cbf121b66404d750a7cce24f776c360568eadcefc9733e7f501cccf'
  'd8c9a829d9255c0e971f00f7ef0f337207f94cd89f67bc657f0bcc2dc18a50b138924e2f9ef878daad2372256f7656064071f7a7324292700044c93e990f17fc'
  'a5f9f04b080425114950aaa7fc2e68ff3e32d092cd0f7a9ef212a37d8056e4a2d438d075921e66be541bbdcadb4602c14e5bb7443e7455dc7ebc923c4dbd0961')

prepare() {
    cd "${_pkg}-python-${pkgver}"

    patch -Np1 -i "../lib${_pkg}07.patch"
    patch -Np1 -i "../${_pkg}-python-0.1.1-fix-GTK-symbols.patch"

    ./configure --prefix=/usr

    # WARNING - we touch src/pynotify.override in build because 
    # upstream did not rebuild pynotify.c from the input definitions,
    # this forces pynotify.c to be regenerated, at some point this can be removed
    touch "src/py${_pkg}.override"
}

build() {
    cd "${_pkg}-python-${pkgver}"
    make clean
    make CFLAGS+=" -fcommon"
}

package() {
    cd "${_pkg}-python-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
