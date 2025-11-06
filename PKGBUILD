pkgname=hashclash-cuda-git
pkgver=r181.892f02e
pkgrel=1
pkgdesc="Project HashClash - MD5 & SHA-1 cryptanalysis with CUDA support"
arch=(x86_64)
url="https://github.com/cr-marcstevens/hashclash"
license=('MIT')
depends=(boost-libs cuda nvidia-utils)
makedepends=('git' 'boost')
provides=(hashclash)
conflicts=(hashclash)
source=("${pkgname%-cuda-git}::git+https://github.com/cr-marcstevens/hashclash")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-cuda-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# the default env variables were causing problems, let configure detect them
    unset CFLAGS CXXFLAGS LDFLAGS
	cd "$srcdir/${pkgname%-cuda-git}"

    # Fix outdated CUDA test code (type mismatch for CUDA)
    sed -i 's/unsigned pitch/size_t pitch/g' m4/ax_cuda.m4
    # Fix m4 macro parameter expansion - provide default value when $1 is empty
    sed -i 's/int op = \$1, eax, edx;/int op = m4_ifval([\$1],[\$1],[0]), eax, edx;/g' m4/ax_gcc_x86_avx_xgetbv.m4
    sed -i 's/int op = \$1, level = \$2,/int op = m4_ifval([\$1],[\$1],[0]), level = m4_ifval([\$2],[\$2],[0]),/g' m4/ax_gcc_x86_cpuid.m4

    # Auto-detect GPU compute capability and set CUDA_SMS
    if command -v nvidia-smi &> /dev/null; then
        GPU_CC=$(nvidia-smi --query-gpu=compute_cap --format=csv,noheader | head -n1 | tr -d '.')
        sed -i "s/^CUDA_SMS=.*/CUDA_SMS=${GPU_CC}/" Makefile.am
    fi

    # fix cuda remove some informational member
    sed -i 's/deviceProp\.clockRate \* 1e-6f/0.0f/g' src/md5birthdaysearch/cuda_md5.cu
    sed -i 's/deviceProp\.deviceOverlap/0/g' src/md5birthdaysearch/cuda_md5.cu

    autoreconf --install
	./configure --prefix=/usr --with-cuda=/opt/cuda
	make -j
}

package() {
	cd "$srcdir/${pkgname%-cuda-git}"
	make DESTDIR="$pkgdir/" install
	install -D LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir/usr/share/${pkgname%-git}/scripts"
	install -Dt "$pkgdir/usr/share/${pkgname%-git}/scripts" -m755 scripts/*
}
