# Maintainer: Joel Almeida <aullidolunar at gmai1 dot c0m>
# Contributor: 0strodamus <0strodamus at cox dot net>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Rob McCathie <korrode AT gmail>
# Contributor: n00b <dannyurvt (at) gmail.com>
#
# MATE Engrampa package:
#   without Caja dependency and with Thunar integration
#   with some non-GTK3 changes backported from subsequent upstream versions
#     I'm not a developer, so don't expect too much. :)
#   I also added the Firefox .xpi mimetype to make working with extensions easier.
#     If you don't want that, comment out the patch in the prepare() array below.
#
# note: if you get "No suitable archive manager found" errors, you need
#       to adjust Xfce Settings > MIME Type Editor associations for Engrampa

pkgname=engrampa-thunar-gtk2
_pkgname=engrampa
_ver=1.20
pkgver=${_ver}.0
pkgrel=0
pkgdesc="Archive manipulator from MATE without Caja dependency (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'gzip' 'libarchive' 'tar' 'unzip' 'zip')
makedepends=('intltool' 'itstool')
optdepends=('p7zip: 7Z and ARJ archive support'
            'unace: ACE archive support'
			'unrar: RAR archive support'
            'thunar-archive-plugin: create and extract archives in Thunar')
provides=('engrampa')
conflicts=('engrampa' 'engrampa-dev' 'engrampa-thunar')
replaces=('engrampa')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgname}-${pkgver}.tar.xz"
        'fr-rpm-bsdtar.patch'
        '002-add-firefox-addon-mimetype.patch')
sha256sums=(
	'd5daac72a67a5e5b3d317f0031cc59e63c89c9b5fcc689932e192812e22860de'
	'dc05c3b3fbc8242d1c85b58f756f998d644d920c8444d0872e9ffef1ce297f77'
    '24c7a9a57a1f9e933a560e9cdac94475b283e5abe35ef18aee1e75597886dafb'
)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # this patch 'depends' on libarchive
    patch -Np1 -i "${srcdir}/fr-rpm-bsdtar.patch"
    # patch to apply some non-GTK3 changes from subsequent upstream versions
    # patch -Np1 -i "${srcdir}/001-engrampa-${_patchver}-changes.patch"
    # patch to add Firefox Addon .xpi mimetype
    patch -Np1 -i "${srcdir}/002-add-firefox-addon-mimetype.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --with-gtk=2.0 \
        --disable-packagekit \
        --disable-caja-actions -without-cajadir

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
