# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=miniaudio-git
pkgver=3967.9634bedb
pkgrel=1
pkgdesc='Single file audio playback and capture library'
arch=('x86_64')
url='https://github.com/mackron/miniaudio'
license=('MIT')
depends=('glibc')
makedepends=(
	'cmake'
	'git'
)
conflicts=('mini_al' 'miniaudio')
provides=('mini_al' 'miniaudio')
source=('git+https://github.com/mackron/miniaudio.git')
sha256sums=('SKIP')

pkgver() {
	cd miniaudio
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd miniaudio
	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMINIAUDIO_BUILD_TESTS=OFF \
		-DBUILD_SHARED_LIBS=ON
	make
}

package() {
	cd miniaudio
	install -Dm755 libminiaudio.so "${pkgdir}/usr/lib/libminiaudio.so"
	install -dm755 "${pkgdir}/usr/include/miniaudio/"
	install -m644 miniaudio.h "${pkgdir}/usr/include/miniaudio/miniaudio.h"
	install -dm755 "${pkgdir}/usr/include/miniaudio/extras/"
	install -m644 extras/*.h "${pkgdir}/usr/include/miniaudio/extras/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/miniaudio-git/LICENSE"
	install -Dm644 miniaudio.pc "${pkgdir}/usr/lib/pkgconfig/miniaudio.pc"
}
