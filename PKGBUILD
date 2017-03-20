# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: kozec <kozec at kozec.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=polkit

pkgname=polkit-elogind
pkgver=0.113+29+g3272a98
pkgrel=6
pkgdesc="PolyciKit with elogind support for non-systemd systems"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/polkit"
license=('LGPL')
provides=("polkit=$pkgver")
depends=('glib2' 'pam' 'expat' 'js' 'libelogind' libutil-linux-nosystemd)
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'git' 'autoconf-archive')
conflicts=('polkit' 'polkit-consolekit')
# replaces=('polkit-consolekit')
options=('!libtool')
install=polkit.install
_commit=3272a988655c3236b55bad70e9a3af20857f384b
#source=("http://www.freedesktop.org/software/polkit/releases/$_pkgname-$pkgver.tar.gz")
source=("git+https://anongit.freedesktop.org/git/polkit#commit=$_commit"
        'polkit-0.114-elogind.patch')
sha256sums=('SKIP'
            'e5eb83a8922f1540309ce5884c4bd40b2972aa75778da945e2392501961a860b')

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd $_pkgname #-$pkgver
    patch -Np 1 -i ${srcdir}/polkit-0.114-elogind.patch
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd $_pkgname #-$pkgver

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --localstatedir=/var \
        --libexecdir=/usr/lib/polkit-1 \
        --enable-libsystemd-login=no \
        --enable-libelogind=yes \
        --disable-static \
        --enable-gtk-doc \
        --with-authfw=pam \
        --with-os-type=gentoo
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

check() {
    cd $_pkgname #-$pkgver
    make -k check || :
}

package() {
    cd $_pkgname #-$pkgver
    make DESTDIR="$pkgdir" install

    chown root:102 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d
    chmod 750      "$pkgdir"/{etc,usr/share}/polkit-1/rules.d
}
