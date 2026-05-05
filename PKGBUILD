# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=1.0.2
pkgrel=1
pkgdesc='A program to calculate the ephemerides'
depends=(
	'python'
	'python-kosmorrolib>=1.0.0'
	'python-termcolor'
	'python-tabulate'
	'python-dateutil'
	'python-babel'
	'python-pytz'
	'python-argcomplete'
)

optdepends=(
	'texlive-bin: PDF creation support'
)

makedepends=(
	'python-poetry-core'
	'python-build'
	'python-installer'
	'python-wheel'

	'ruby-ronn'
)

arch=('any')
url='https://kosmorro.space'
license=('AGPL')

source=("$pkgname-v$pkgver.tar.gz::https://codeload.github.com/Kosmorro/kosmorro/tar.gz/v$pkgver")
sha256sums=("e1f97f20a9f804a4d78a20a51820de307d2b8761b6fbe110a7c5e137e12df27f")

build() {
	cd "${srcdir}/kosmorro-${pkgver}"
	pybabel compile --directory=kosmorro/locales
	make manpage
	python -m build --wheel --no-isolation
}

package() {
	SOURCE_DIR="${srcdir}/kosmorro-${pkgver}"
	cd "$SOURCE_DIR"

	# Install application
	python -m installer --destdir="$pkgdir" dist/kosmorro-${pkgver}-py3-none-any.whl

	# Install man pages
	mkdir -p "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/man/man7"
	install "$SOURCE_DIR/manpage/kosmorro.1" "${pkgdir}/usr/share/man/man1/kosmorro.1"
	install "$SOURCE_DIR/manpage/kosmorro.7" "${pkgdir}/usr/share/man/man7/kosmorro.7"
}

