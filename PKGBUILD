# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=libosi-bin
pkgver=0.1.12
pkgrel=1
pkgdesc='Operating-system introspection library for PANDA'
arch=('x86_64')
url='https://github.com/panda-re/libosi'
license=('BSD-3-Clause')
depends=('glib2' 'gcc-libs' 'glibc')
provides=("libosi=$pkgver")
conflicts=('libosi')
# Keep upstream's shared libraries byte-identical; their profile path is embedded.
options=('!strip' '!debug')
source=("libosi_${pkgver}.deb::https://github.com/panda-re/libosi/releases/download/v${pkgver}/libosi_24.04.deb"
        "libosi-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/panda-re/libosi/v${pkgver}/LICENSE.md")
sha256sums=('1aa44ee58ed8514723ba5cd26f5b0ebea4910873bd7fae99d1571ba1fe68fb7e'
            '102407a4c15e7fb3e7c7c7957dc9e771d82a3c3aa3dcdecce4e5ffdcfea0c5b0')

_latestver() {
    gh api --paginate repos/panda-re/libosi/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+\.[0-9]+\.[0-9]+)$/\1/p' | sort -V | tail -1
}

package() {
    bsdtar -xOf "libosi_${pkgver}.deb" data.tar.gz | tar -xz -C "$pkgdir"

    # Upstream uses Debian's multiarch directory; Arch loads libraries from /usr/lib.
    mv "$pkgdir/usr/lib/x86_64-linux-gnu/"* "$pkgdir/usr/lib/"
    rmdir "$pkgdir/usr/lib/x86_64-linux-gnu"

    install -Dm644 "libosi-${pkgver}-LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
