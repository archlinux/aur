# Maintainer: Michael Thies <mail@mhthies.de>

pkgname=justbuild
pkgver='1.0.0'
pkgrel=1
pkgdesc="A generic build system supporting multi-repository builds"
arch=('x86_64')
url="https://github.com/just-buildsystem/justbuild"
license=('Apache')
depends=('python')
makedepends=('clang' 'binutils' 'wget')
conflicts=('just' 'just-git' 'just-js')
source=("justbuild-${pkgver}.tar.gz::https://github.com/just-buildsystem/justbuild/archive/v${pkgver}.tar.gz"
		"boringssl-no-Werror.patch")
sha256sums=('d36ad7f2710c4e21368eb274c830ce8a71b6819ce80685d707a355fe3916e7a5'
			'SKIP')

prepare() {
    cd "${srcdir}/justbuild-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/boringssl-no-Werror.patch"
}

build() {
	cd "${srcdir}/justbuild-${pkgver}"
	# Clean build directory from potential previous run
	# The bootstrap script expects the build directory to be clean; esp. src, dep_includes and deps must not be present
	[[ -d "${srcdir}/build/dep_includes" ]] && rm -rf "${srcdir}/build"
	mkdir -p "${srcdir}/build"
    
    env JUST_BUILD_CONF='{"COMPILER_FAMILY": "clang", "CC": "/usr/bin/clang", "CXX": "/usr/bin/clang++", "AR": "/usr/bin/ar"}' python3 ./bin/bootstrap.py . "${srcdir}/build"
}

package() {
	install -m 755 -Dt "${pkgdir}/usr/bin" "${srcdir}/build/out/bin/just" 
	install -m 755 -DT "${srcdir}/justbuild-${pkgver}/bin/just-mr.py" "${pkgdir}/usr/bin/just-mr"
}
