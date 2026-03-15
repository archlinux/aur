# Maintainer: Jakub Szczerbiński <jszczerbinsky@gmail.com>

pkgname=zeppelin-git
pkgver=1.4.1.3
pkgrel=1
pkgdesc="A free UCI chess engine with integrated NNUE, optimized for x86_64 and aarch64 CPUs"
arch=('x86_64' 'aarch64')
url="https://github.org/jszczerbinsky/zeppelin"
license=('GPL3')
depends=()
makedepends=('git' 'cmake')
source=("git+https://github.com/jszczerbinsky/zeppelin.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/zeppelin"
    git describe --tags --dirty --match "v[0-9]*" | \
    sed -E 's/^v([0-9]+\.[0-9]+\.[0-9]+)(-[0-9]+)?(-g[0-9a-f]+)?/\1\2/' | \
    tr '-' '.'
}

build() {
    cd "$srcdir/zeppelin"
	vect="VECT_NONE"
    if [[ "$CARCH" == "x86_64" ]]; then
        echo "Building for x86_64"
        if grep -q avx2 /proc/cpuinfo; then
            echo "AVX2 is available"
            vect="VECT_AVX2"
        else
            echo "AVX2 is not available"
        fi
    elif [[ "$CARCH" == "aarch64" ]]; then
        echo "Building for aarch64"
        if grep -Eq "neon|asimd" /proc/cpuinfo; then
            echo "NEON is available"
            vect="VECT_NEON"
        else
            echo "NEON is not available"
        fi
	fi

	cmake \
		-DCMAKE_BUILD_TYPE="Release" \
		-DEXE_NAME="zeppelin" \
		-DTARGET_ARCH="$arch" \
		-DTARGET_PLATFORM="Linux" \
		-DEVAL_TYPE="EVAL_NNUE" \
		-DVECTORIZATION_METHOD="$vect" \
		.
	cmake --build .
}

package() {
    cd "$srcdir/zeppelin"
    install -Dm755 build/zeppelin "$pkgdir/usr/bin/zeppelin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
