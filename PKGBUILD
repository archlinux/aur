# Maintainer: Alad Wenter <alad@archlinux.org>
pkgname=overlayfs-tools-git
_pkgname=overlayfs-tools
pkgver=r31.291c7f4
pkgrel=2
pkgdesc="maintenance tools for overlay filesystem"
arch=('x86_64')
url="https://github.com/kmxz/overlayfs-tools"
license=('custom')
depends=('glibc')
makedepends=('attr' 'git')
source=("git+https://github.com/kmxz/overlayfs-tools.git"
        "xattr_include_paths.patch"
        "ldflags.patch")
md5sums=('SKIP'
         'e277d33cf8506ff96563f3aee2639564'
         'de8fd91f1c4e12e6a27e1b53413a039c')

prepare() {
    cd "$_pkgname"
    patch -p1 < "$srcdir"/xattr_include_paths.patch
    patch -p1 < "$srcdir"/ldflags.patch
}

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make
}

check() {
    cd "$_pkgname"
    # XXX: tests require sudo, so they can't be run in the PKGBUILD
    #make tests
}

package() {
    cd "$_pkgname"
    install -Dm755 overlay "$pkgdir"/usr/bin/overlay
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
