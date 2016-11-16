# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=zesty
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.22

pkgname=gsettings-desktop-schemas-ubuntu
_ubuntu_ver=3.22.0
_ubuntu_rel=1ubuntu1
pkgver=3.22.0
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://www.gnome.org/"
license=(GPL)
depends=(glib2)
makedepends=(gobject-introspection intltool)
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.xz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-desktop-schemas_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz"
        0001-Revert-schemas-Scroll-method-key-changes.patch)
sha512sums=('653198f78f8108222e84c0e94b6b914e03597234a627f1c205fc58a7bf54fdde073ff98cfdce1dccec7da1d8a7cbf648004cd392382d4ff617245cc3e581dfd1'
            'e71dc5c3b01ecb8156aebe260d450c0f35aa6816a6b3acc43298a5e2e0f9134f8bdef6b19992d31f80d7d5333eec43d125b5c95ca1781dfd13d099ab0745bee4'
            '942ea2fa67aa5d5a08bcf7e1fafce4cd4dc49eb536746a948546b46a08578d8422056b32d57d8e552cc2daa42b3493a0cc9a007fb0a36f6d32e85b1443bc94b5')

prepare() {
    cd "${pkgname%-*}-${pkgver}"

    patch -p1 -i ../0001-Revert-schemas-Scroll-method-key-changes.patch

    # Apply Ubuntu's patches

    sed -i '/legacy-scroll-method.patch/d' ../debian/patches/series

    for i in $(grep -v '#' ../debian/patches/series); do
        msg "Applying ${i} ..."
        patch -p1 -i "../debian/patches/${i}"
    done
}

build() {
    cd "${pkgname%-*}-${pkgver}"

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --disable-schemas-compile
    make
}

package() {
    cd "${pkgname%-*}-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
