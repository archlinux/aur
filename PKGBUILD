# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Oliver Schönrock <oliver at schonrocks dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=hibp
pkgver=0.6.1
pkgrel=1
pkgdesc="Have I been pwned: High performance downloader, query tool, server and utilities"
arch=('x86_64' 'aarch64')
url="https://github.com/oschonrock/${pkgname}"
license=('Apache-2.0')
depends=('curl' 'gcc-libs' 'glibc' 'libevent' 'onetbb')
makedepends=('cmake' 'git' 'ninja' 'ruby' 'ruby-rake' 'wget' 'unzip')
source=("git+${url}.git#tag=v${pkgver}")
b2sums=('73965c00ebea3e7e4ee0fc32b8281770ada977418bdb680465caabc745b6cd2cb9b897fa401e4f0fc5356fd1b85d739e4511610e5e42c82f285d98697c5cafc1')

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule update --init --recursive

	export GEM_HOME="${srcdir}/${pkgname}/.gem"
	gem install --no-user-install Mxx_ru

	cd "${srcdir}/${pkgname}/ext/restinio"
	"${GEM_HOME}/bin/mxxruexternals"
}

build() {
	cmake \
		-G Ninja \
		-B build \
		-S "${pkgname}" \
		-W no-dev \
		-D CMAKE_BUILD_TYPE=release \
		-D BINFUSE_TEST=OFF \
		-D HIBP_TEST=ON \
		-D HIBP_WITH_PSTL=ON \
		-D NOPCH=ON \
		--install-prefix=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	# Clean-up leftover header and cmake files
	find "${pkgdir}" -type f \( -name '*.cmake' -or -name '*.h' -or -name '*.hpp' -or -name '*.ipp' \) -delete
	find "${pkgdir}" -type d -empty -delete

	cd "${pkgname}"
	install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
