# Maintainer: zebdo < zebdo [4T] posteo [D0T] ee >

pkgname='hydrus-video-deduplicator-git'
_pkgname='hydrus-video-deduplicator'
pkgver=0.6.0.r0.g2f3753c
pkgrel=1
pkgdesc='Hydrus Video Deduplicator finds potential duplicate videos through the Hydrus API'
arch=('any')
url="https://github.com/hydrusvideodeduplicator/hydrus-video-deduplicator"
license=('MIT')
provides=("hydrus-video-deduplicator=$pkgver")
conflicts=(hydrus-video-deduplicator)
depends=(
  'python'
  'python-platformdirs'
  'python-rich'
  'python-numpy'
  'python-tqdm'
  'python-dotenv'
  'python-typer'
  'python-sqlitedict'
  'python-requests'
  'python-psutil'
  'python-joblib'
  'python-pillow'
  'python-av'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-hatchling'
	'git'
	)
source=("${_pkgname}::git+https://github.com/hydrusvideodeduplicator/${_pkgname}.git"
	hydrusvideodeduplicator)
sha256sums=('SKIP'
            '504aa64d8bcbc5f37d22f798ce40cf0daf127c6835897887e0634fe8b0f2db7f')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	msg 'Running python build...'
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	# install license
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
	
	# install executables
	install -d -m755 "${pkgdir}/usr/bin"
	install -m755 ../hydrusvideodeduplicator "${pkgdir}/usr/bin/"
}
