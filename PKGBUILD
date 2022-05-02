# vim: set ts=2 sw=2 et:
# Maintainer: 

pkgname=pacman-hearts
_pkgname=pacman
pkgver=6.0.1
pkgrel=1
pkgdesc="A library-based package manager with dependency support. With hearts in progress bar!"
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
groups=('base-devel')
depends=('bash' 'glibc' 'libarchive' 'curl'
         'gpgme' 'pacman-mirrorlist' 'archlinux-keyring')
makedepends=('meson' 'asciidoc' 'doxygen')
checkdepends=('python' 'fakechroot')
optdepends=('perl-locale-gettext: translation support in makepkg-template')
provides=("pacman=${pkgver%.*.*}")
conflicts=('pacman')
backup=(etc/pacman.conf
        etc/makepkg.conf)
options=('strip' 'debug')
source=(https://sources.archlinux.org/other/pacman/$_pkgname-$pkgver.tar.xz
        add-flto-to-LDFLAGS-for-clang.patch
        makepkg-use-ffile-prefix-map-instead-of-fdebug-prefi.patch
        libmakepkg-add-extra-buildflags-only-when-buildflags.patch
        make-link-time-optimization-flags-configurable.patch
        pacman.conf
        makepkg.conf
        pacman-hearts.patch)
sha256sums=('0db61456e56aa49e260e891c0b025be210319e62b15521f29d3e93b00d3bf731'
            '82ff91b85f4c6ceba19f9330437e2a22aabc966c2b9e2a20a53857f98a42c223'
            'b940e6c0c05a185dce1dbb9da0dcbebf742fca7a63f3e3308d49205afe5a6582'
            '7d0aee976c9c71fcf7c96ef1d99aa76efe47d8c1f4451842d6d159ec7deb4278'
            '5b43e26a76be3ed10a69d4bfb2be48db8cce359baf46583411c7f124737ebe6a'
            '606e55f06c297d2b508bc4438890b229a1abaa68b0374a2d7f94c8e7be6792d7'
            '072020e34f2c55b94a9a486829a7eadab0a830ddb4d8e759b0c4e6cf1bde73a6'
            'd4c929334e5eac1be05673338ecefb493ec3735cd3cd3e4be2eb8dfe585677e1')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np1 -i ../add-flto-to-LDFLAGS-for-clang.patch
  patch -Np1 -i ../makepkg-use-ffile-prefix-map-instead-of-fdebug-prefi.patch
  patch -Np1 -i ../libmakepkg-add-extra-buildflags-only-when-buildflags.patch
  patch -Np1 -i ../make-link-time-optimization-flags-configurable.patch
  patch -Np1 -i "$srcdir"/pacman-hearts.patch
}

build() {
  cd "$_pkgname-$pkgver"

  meson --prefix=/usr \
        --buildtype=plain \
        -Ddoc=enabled \
        -Ddoxygen=enabled \
        -Dscriptlet-shell=/usr/bin/bash \
        -Dldconfig=/usr/bin/ldconfig \
        build

  meson compile -C build
}

check() {
  cd "$_pkgname-$pkgver"

  meson test -C build
}

package() {
  cd "$_pkgname-$pkgver"

  DESTDIR="$pkgdir" meson install -C build

  # install Arch specific stuff
  install -dm755 "$pkgdir/etc"
  install -m644 "$srcdir/pacman.conf" "$pkgdir/etc"
  install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
}
