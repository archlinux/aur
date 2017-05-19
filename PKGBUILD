# Maintainer: DATSD <dastudiodirector at gmail dot com>
_basename=avhttp
pkgname=${_basename}-git
pkgver=r887.f9d6e36
pkgrel=1
pkgdesc='Concurrent http downloader'
arch=('any')
url='http://avplayer.org/avhttp.html'
license=('custom')
depends=('boost-libs')
optdepends=(
  'zlib: gzip support'
  'openssl: https support'
)
makedepends=('cmake' 'git' 'boost')
provides=('avhttp')
conflicts=('avhttp')
source=("git+https://github.com/avplayer/avhttp.git")
sha256sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${srcdir}/${_basename}"
	
	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir -p build && cd build

	cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
	make
}

package()
{
	cd "${_basename}/build"
	make install DESTDIR="${pkgdir}/"

	# Install the documentation
	install -D -m644 "${srcdir}/${_basename}/README.md" \
					 "${pkgdir}/usr/share/doc/${_basename}/README"

	# Install the license
	install -D -m644 "${srcdir}/${_basename}/LICENSE" \
					 "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
