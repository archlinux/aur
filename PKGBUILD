# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname=accountsservice
_commit=dac425433270c6dc38feba4d2513e4da7bd265fd  # tags/0.6.43^0

pkgname=accountsservice-elogind
pkgver=0.6.42+12+gdac4254
pkgrel=5.aur1
pkgdesc="D-Bus interface for user account query and manipulation"
url="https://www.freedesktop.org/software/accountsservice/"
arch=('i686' 'x86_64')
license=('GPL3')
groups=('elogind-nosystemd')
provides=('accountsservice')
conflicts=('accountsservice')
depends=('glib2' 'elogind' 'polkit-elogind')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'git')
source=("git://anongit.freedesktop.org/accountsservice#commit=$_commit"
        'accountsservice-enable-elogind.patch')
sha256sums=('SKIP'
            'dc233c540cf3e129479aa0c5e408a706a8c8cd52fdb94ad50aba32f8e9f765e1')

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/-/+/g'
}


prepare() {
    cd $_pkgname
    patch -Np 1 -i ${srcdir}/accountsservice-enable-elogind.patch
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd $_pkgname
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/$_pkgname \
        --disable-static \
        --enable-elogind \
        --enable-admin-group="wheel" \
        --disable-systemd \
        --enable-gtk-doc
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
}
