# Maintainer: henry0w <hwelles@protonmail.com>
pkgname=clspv-git
pkgver=r396.88ed5fe
_pkgname=clspv
pkgrel=2
epoch=
pkgdesc="A prototype compiler for a subset of OpenCL C to Vulkan compute shaders"
arch=('any')
url="https://github.com/google/clspv.git"
license=('APACHE')
groups=()
depends=()
makedepends=('cmake'  'python' 'git' 'spirv-tools' 'spirv-headers')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/google/clspv.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

#TODO: Split deps
build() {
	cd $_pkgname
	python utils/fetch_sources.py
	cd $srcdir
	CPPFLAGS+=" ${CXXFLAGS}"
	cmake -B "${_pkgname}/build" \
	    -S "${_pkgname}" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
    make -C "${_pkgname}/build" all
}


check() {
    make -C "${_pkgname}/build" test
}

package() {
	make -C "${_pkgname}/build" DESTDIR="$pkgdir" install
    install -D -m644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
