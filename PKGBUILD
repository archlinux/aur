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
_ver=1.19
_patchver=1.18.0
pkgver=${_ver}.0
pkgrel=1
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
source=("https://pub.mate-desktop.org/releases/${_ver}/${_pkgname}-${pkgver}.tar.xz"
        'fr-rpm-bsdtar.patch'
        'engrampa.tap'
        # "001-engrampa-${_patchver}-changes.patch"
        '002-add-firefox-addon-mimetype.patch')
sha256sums=('8a521462fa218827146cf840a4ed47e252132e65d7d589a907eccd66effdf99a'
            'dc05c3b3fbc8242d1c85b58f756f998d644d920c8444d0872e9ffef1ce297f77'
            '703eca26eb0da2229b5e5ee9445c30f5ad458bc1ba69fb23a426f971d4afce62'
            # '1cfb5fabe437d7be74e898b666623d1c3d088f3b29063a49175b35a3cecc1961'
            '24c7a9a57a1f9e933a560e9cdac94475b283e5abe35ef18aee1e75597886dafb')

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
    install -Dm755 ${srcdir}/engrampa.tap ${pkgdir}/usr/lib/xfce4/thunar-archive-plugin/engrampa.tap
}
