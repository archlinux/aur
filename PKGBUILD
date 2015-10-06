# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=jhbuild
pkgver=3.12.0
pkgrel=2
pkgdesc='Tool to build the whole GNOME desktop from sources'
arch=('i686' 'x86_64')
license=('GPL')
depends=(python2)
makedepends=(rsync
             subversion
             gnome-common
             git
             intltool
             gnome-doc-utils
             yelp-tools)
install=jhbuild.install
source=('https://git.gnome.org/browse/jhbuild/snapshot/jhbuild-3.12.0.tar.xz'
        'module_autogenargs.patch')
sha256sums=('e84676f6a6b327abddc7d606abe103517c25bd4bc017973913bd37c3b5f9d7e1'
            'f92dd2735e47d0032f4069fbf1c4d1207c83eabd0a6317ea78f39d6157e854b2')
url='https://live.gnome.org/Jhbuild/'

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 < ../module_autogenargs.patch

    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="$pkgdir" install
    install -d "$pkgdir/usr/share/jhbuild"
    cp -dr modulesets "$pkgdir/usr/share/jhbuild"
    
    sed -i "s|${srcdir}|${HOME}/jhbuild|g" "${pkgdir}"/usr/bin/jhbuild
}
