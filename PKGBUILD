# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.1.3
_commit=5b3e83120d2c0baeed4e14d5581c3cba29f8c605
pkgrel=2
pkgdesc='Official MusicBrainz tagger'
url='https://picard.musicbrainz.org/'
license=('GPL')
arch=('x86_64')
depends=('python-pyqt5' 'python-mutagen')
optdepends=('chromaprint: fingerprinting'
            'python-discid: cd lookup')
makedepends=('python-discid' 'git' 'python-setuptools')
source=("git+https://github.com/metabrainz/picard.git#commit=$_commit"
        'https://github.com/metabrainz/picard/pull/1183/commits/6f3e32f7119938042fec4fc82514eea65eaaccb2.patch')
sha256sums=('SKIP'
            '16e760a195f071614e8b5fc49cce5cba9230850a5f941d2330112a82659568ff')

build() {
	cd "${srcdir}/${pkgname}"
	sed "s/‘/'/g" -i setup.cfg
	python setup.py config
	patch -p1 -i ../6f3e32f7119938042fec4fc82514eea65eaaccb2.patch # FS#60400
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install \
		--root="${pkgdir}" \
		--disable-autoupdate \

	rm -fr "${pkgdir}"/usr/lib/python*/site-packages/picard-*.egg-info
}
