# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Giorgio Gilestro <giorgio at gilest dot ro>
# Contributor: Richard Mathot <rim at odoo dot com>
_pkgbase=r8152
pkgname=${_pkgbase}-dkms
pkgver=2.11
pkgrel=2
pkgdesc="A kernel module for Realtek RTL8152/RTL8153 Based USB Ethernet Adapters"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
			'linux-lts-headers: Build the module for LTS Arch kernel')
source=(
    "https://github.com/wget/realtek-r8152-linux/archive/v${pkgver}.tar.gz"
    'dkms.conf'
    'linux-4.20.0-add-guard-fix.patch'
)
sha512sums=('26af771df2d6ffddd4101d71ac50dd834a71359fa5553e492e7572cc16c2762c848777a38b4df466d2ce3bab040b147a4f6b92eacdcd6f3783ba65a74ef5867a'
            '2272d18f24a940fb878245849a0950d560b97ece8d492ebfe7ccf53f8ac6093b6b9da2b45c5ea3f99c77b36ffbd75337aa560cfd84428052f5436a9cda7c1605'
            '6f123002a3b92f40ab1013e7b983dbc7f459aaa55b9253810ce658740105ee3c19496a40be2fef65afdda416db0a28705c5132aeb9ebc30665e728ca4aca7272')

prepare() {
  cd realtek-r8152-linux-${pkgver}
  patch -N -i "${srcdir}/linux-4.20.0-add-guard-fix.patch"
}

package() {
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
		-e "s/@PKGVER@/${_pkgbase}/g" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cp -dr --no-preserve='ownership' "realtek-${_pkgbase}-linux-${pkgver}" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
