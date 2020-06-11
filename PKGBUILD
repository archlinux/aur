# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
pkgname=kanshi-git
pkgver=r85.846b725
pkgrel=1
pkgdesc="Dynamic output configuration for Wayland WMs"
arch=(x86_64)
url="https://github.com/emersion/kanshi"
license=('MIT')
groups=()
depends=('wayland')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wlroots>=0.7')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('kanshi::git+https://github.com/emersion/kanshi.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    mkdir build

    # meson does not use the variables in /etc/makepkg.conf automatically
    CPPFLAGS=${CPPFLAGS} CFLAGS=${CFLAGS} CXXFLAGS=${CXXFLAGS} LDFLAGS=${LDFLAGS} \
        meson build \
        --buildtype=release \
        --prefix=/usr
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    ninja -C build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir/" ninja -C build install

    # to shut up namcap's warning, even though it's a MIT license
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    # Arch's official Kanshi package installs README, so we do the same
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
