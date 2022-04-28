# Maintainer: Alad Wenter <https://github.com/AladW>
# Co-Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
pkgname=aurutils
pkgver=9.6
pkgrel=2
pkgdesc='helper tools for the arch user repository'
url='https://github.com/AladW/aurutils'
arch=('any')
license=('custom:ISC')
_backports=("0001-sync-tsort-exit.patch::$url/commit/6f56ae7e4df06a0142d8970275986754041955c4.patch"
            "0002-sync-filter-deps.patch::$url/commit/3c818fccc3b431d7aea4198e82cd1ccda1e43e5c.patch"
            "0003-fetch-git-checkout.patch::$url/commit/c9e57188b5bb356b2373bc087474e2e68872505d.patch")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "${_backports[@]}")
changelog=aurutils.changelog
install=aurutils.install
sha256sums=('825d6ab3d66faf84ee3856e677de138dcdb3af2a5c38164f69601ee0a4e96954'
            '2f0e039c6544dc2204dbb25f15f2c3fcefbc742a196fedb60925b7dc3311665e'
            '695d1b77c67ac87304445b593a2d6b0600adf076d81ed007af3f1c26ea9a8539'
            'cca4ea1456d1cd8cde333d7e60c0749c9bc2c78b4f4b3eda751432cc3555aa65')
depends=('git' 'jq' 'pacutils' 'curl' 'expect')
optdepends=('bash-completion: bash completion'
            'zsh: zsh completion'
            'devtools: aur-chroot'
            'vifm: default pager'
            'ninja: aur-sync ninja support')

prepare() {
    cd "$pkgname-$pkgver"
    for _b in "${_backports[@]}"; do
        git apply "$srcdir/${_b%%::*}"
    done
}

build() {
    cd "$pkgname-$pkgver"
    make AURUTILS_VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
