# Manteiner: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Chuan Ji <jichuan89@gmail.com>

pkgname=w3m-mouse
w3m_pkgname=w3m
pkgver=0.5.3
pkgrel=4
pkgdesc='Text-based Web browser, as well as pager (mouse enabled)'
url='http://w3m.sourceforge.net/'
license=('custom')
arch=('i686' 'x86_64')
makedepends=('imlib2')
optdepends=('imlib2: for graphics support') 
depends=('openssl' 'gc' 'ncurses')
provides=('w3m')
conflicts=('w3m')
source=("http://downloads.sourceforge.net/project/${w3m_pkgname}/${w3m_pkgname}/${w3m_pkgname}-${pkgver}/${w3m_pkgname}-${pkgver}.tar.gz"
        'form_unknown.patch'
        'file_handle.patch'
        'https.patch'
        'gc72.patch')
sha1sums=('444b6c8cf7094ee95f8e9de96b37f814b9d83237'
          '23d648033ad77f3c67d370c62cf7b7ed86b5c6f2'
          '457de43be7eabc652614461a7ab25e3ba76b2aff'
          '66affb2f695fe0bdde25cf774642bfd6a9404e88'
          '7baa06ca684fd140503a2adc65e2d606970c4662')

prepare() {
	cd "${srcdir}/${w3m_pkgname}-${pkgver}"
	ls ../*.patch | xargs -i patch -p1 -i {}
}

build() {
	cd "${srcdir}/${w3m_pkgname}-${pkgver}"
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
	cd "${srcdir}/${w3m_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}"/usr/share/{doc,licenses}/"${w3m_pkgname}"
	find doc/* | grep -v CVS | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${w3m_pkgname}"
	ln -s ../../doc/"${w3m_pkgname}"/README "${pkgdir}/usr/share/licenses/${w3m_pkgname}"
}
