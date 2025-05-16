
pkgname=dds10-thumbnailer-kde-git
_pkgname="${pkgname%-git}"
pkgver=r10.23b2801
pkgrel=2
pkgdesc='dds10-thumbnailer-kde is a plugin for KDE 6 that creates thumbnail for Direct Draw Surface (DDS) images'
arch=('x86_64')
license=('GPLv2')
url=https://github.com/meyraud705/dds10-thumbnailer-kde
makedepends=('cmake' 'extra-cmake-modules')
depends=('qt6-base' 'kio')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('ABGR8888.patch'
		"${pkgname%-git}::git+https://github.com/meyraud705/dds10-thumbnailer-kde.git")
sha256sums=('c7f83df9fea4d10e54709b226780eb7965f27e8849e6f7a09b141bad0e6b861d'
			'SKIP')

prepare() {
	patch -Np1 -d "$_pkgname" -i ../ABGR8888.patch
}

build() {
	cmake -B build -S "$_pkgname" -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DBUILD_WITH_QT6=ON -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package(){
	install -D -m644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}" "${pkgname%-git}/LICENSE"
	DESTDIR="$pkgdir" cmake --install build
}
