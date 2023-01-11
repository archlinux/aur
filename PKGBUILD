# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=libquotient-git
pkgver=0.7.1.r1158.f38f5e7
pkgrel=1
pkgdesc="A Qt5 library to write cross-platform clients for Matrix"
arch=(x86_64 aarch64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia" "qtkeychain-qt5" "libolm")
makedepends=("git" "cmake" "make" "gcc")
provides=("libquotient")
conflicts=("libquotient")
source=("${pkgname}::git+https://github.com/quotient-im/libQuotient.git")
sha512sums=("SKIP")


# Thanks to Morguldir <morguldir@protonmail.com> for this!
pkgver() {
	cd "$pkgname"

	_info="$(git blame -s CMakeLists.txt | grep set\(API)"
	_commit="$(echo $_info | awk '{print $1}')"
	_ver="$(echo $_info | awk '{print $4}' | sed s/[^0-9.]//g)"
	_patch_ver="$(git blame -p CMakeLists.txt | grep project\(Quotient | sed s/[^0-9]//g)"
	_revisions="$(git rev-list --count $_commit..HEAD)"
	_current_commit="$(git log --pretty=format:'%h' -n 1)"
	printf "%s.%d.r%d.g%s" $_ver $_patch_ver $_revisions $_current_commit
}

prepare() {
	mkdir -p "build"
}

build() {
	cd "build"
	cmake ../${pkgname} \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_SHARED_LIBS=1 \
	-DQuotient_ENABLE_E2EE=ON

	make -j $(nproc)
}

package() {
	cd "build"
	make -j $(nproc) DESTDIR="${pkgdir}" install

	cd "../$pkgname"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
