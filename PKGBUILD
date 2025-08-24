# Maintainer: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Martin Wimpress <code AT flexion DOT org>
# Contributor: György Balló <ballogyor+arch AT gmail DOT com>

pkgname=mate-applet-lockkeys
pkgver=0.3.2
pkgrel=2
pkgdesc="A MATE panel applet that shows which of the CapsLock, NumLock and ScrollLock keys are on and which are off."
url="http://www.zavedil.com/mate-lock-keys-applet/"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('gtk3' 'mate-panel')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
source=("https://github.com/assen-totin/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	'gcc14.patch'
	'fix-icons.patch')
sha256sums=('8a24eb5e13aa3fd93019c2a6206d2c269b2619ffbed3a80cd718f684e668ccea'
	'00926cdbad477533bef8a1595e063f61fd12f059d60c56f8c45739184e6ad5a1'
	'1aec725126d1a595249a6fb38f1a461f2cf8a9276c83793895680b5cc8710999')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Fix compile with recent GCC
    patch -Np1 -i ../gcc14.patch
    # GTK3: fix remove icons disabled in configuration
    patch -Np1 -i ../fix-icons.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
