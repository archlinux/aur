# Maniteiner: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Chuan Ji <jichuan89@gmail.com>

pkgname=w3m-mouse
_w3m_pkgname=w3m
pkgver=0.5.3
pkgrel=5
pkgdesc='Text-based Web browser, as well as pager (mouse enabled)'
url='http://w3m.sourceforge.net/'
license=('custom')
arch=('i686' 'x86_64')
makedepends=('imlib2')
optdepends=('imlib2: for graphics support')
depends=('openssl' 'gc' 'ncurses')
provides=('w3m')
conflicts=('w3m')
source=("http://downloads.sourceforge.net/project/${_w3m_pkgname}/${_w3m_pkgname}/${_w3m_pkgname}-${pkgver}/${_w3m_pkgname}-${pkgver}.tar.gz"
        'form_unknown.patch'
        'file_handle.patch'
        'https.patch'
        'perl.patch'
        'gc72.patch')
sha256sums=('e994d263f2fd2c22febfbe45103526e00145a7674a0fda79c822b97c2770a9e3'
            '7d2f4ff43eeb1b81fb6126063cf091902205c375fdcdffe0998ff51e73ff9d27'
            'dbf746808b64cd163dbcc6d299d80abdbbb7b5eff633d39c3f73dd42370633bc'
            'ab8f2b6c7e1cf2d8485fa9928784c8dbd2f0d8cd26a5c32384543eea173de986'
            '5ea04eab7b4f573ceca5092addd58b3feaa80fe5e3fd925ebfc6231dd3e9f27f'
            '1e0e573e5fc6c0938b1941a81cffdd604a0167f7cf46e1a8479e2e10969e1d04')

prepare() {
	cd "${srcdir}/${_w3m_pkgname}-${pkgver}"
	ls ../*.patch | xargs -i patch -p1 -i {}
}

build() {
	cd "${srcdir}/${_w3m_pkgname}-${pkgver}"
  export LIBS="-lX11"
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib \
		--enable-image=x11,fb \
		--with-imagelib=imlib2 \
		--with-termlib=ncurses \
		--disable-w3mmailer \

	make
}

package() {
	cd "${srcdir}/${_w3m_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}"/usr/share/{doc,licenses}/"${_w3m_pkgname}"
	find doc/* | grep -v CVS | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${_w3m_pkgname}"
	ln -s ../../doc/"${_w3m_pkgname}"/README "${pkgdir}/usr/share/licenses/${_w3m_pkgname}"
}
