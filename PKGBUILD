# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Oliver Schönrock <oliver at schonrocks dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=hibp
pkgver=0.6.2
pkgrel=1
pkgdesc="Have I been pwned: High performance downloader, query tool, server and utilities"
arch=('x86_64' 'aarch64')
url="https://github.com/oschonrock/${pkgname}"
license=('Apache-2.0')
depends=('curl' 'gcc-libs' 'glibc' 'libevent' 'onetbb')
makedepends=('cmake' 'git' 'ninja' 'ruby' 'ruby-rake' 'wget' 'unzip')
source=("git+${url}.git#tag=v${pkgver}")
b2sums=('3472e85d3092e992cdf9cf2ee96ce4165828f9574f80c49abdeb1e2c23796e4c2e50cc4330725dcde3274ae8b060c837954cb8ae5d3e9c1e3dde620d58a59bbb')

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
