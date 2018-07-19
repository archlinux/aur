# Contributor: Elias Kosunen <elias dot kosunen at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=varuna-git
pkgver=0.1.1r393.b0d2ad8
pkgrel=3
pkgdesc="Compiler for the varuna language"
arch=('i686' 'x86_64')
url="https://varuna-lang.github.io"
license=('custom:BSD')
depends=('llvm40-libs' 'libutil-linux')
makedepends=('cmake>=3.2.3' 'git')
source=("git+https://github.com/varuna-lang/${pkgname%-git}.git"
    "git+https://github.com/gabime/spdlog.git"
    "git+https://github.com/USCiLab/cereal.git"
    "git+https://github.com/onqtam/doctest.git"
    "git+https://github.com/datenwolf/binreloc.git"
    "git+https://github.com/graeme-hill/crossguid.git"
    "git+https://github.com/vit-vit/CTPL.git"
    "git+https://github.com/varuna-lang/vastd.git"
    "git+https://github.com/varuna-lang/vart.git"
    "git+https://github.com/varuna-lang/llvm-binutils.git")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd ${pkgname%-git}
    printf "%sr%s.%s" $(git describe 2>&1|head -1|cut -d " " -f6-6|tr -d \'|tr -d v) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
    cd ${pkgname%-git}
    git submodule init
    git config submodule.third-party/spdlog.url "$srcdir/spdlog"
    git config submodule.third-party/cereal.url "$srcdir/cereal"
    git config submodule.third-party/doctest.url "$srcdir/doctest"
    git config submodule.third-party/binreloc/src.url "$srcdir/binreloc"
    git config submodule.third-party/crossguid/guid.url "$srcdir/crossguid"
    git config submodule.third-party/ctpl.url "$srcdir/CTPL"
    git config submodule.projects/vastd.url "$srcdir/vastd"
    git config submodule.projects/vart.url "$srcdir/vart"
    git config submodule.projects/llvm-binutils.url "$srcdir/llvm-binutils"
    git submodule update
}

build() {
    [[ -d ${pkgname%-git}/build ]] || mkdir -p ${pkgname%-git}/build
    cd ${pkgname%-git}/build
    CMAKE_PREFIX_PATH=/usr/lib/llvm-4.0/lib/cmake/llvm cmake -G "Unix Makefiles" \
		     -DLLVM_DIR=/usr/lib/llvm-4.0 \
		     -DCMAKE_INSTALL_PREFIX=/usr \
		     -DCMAKE_BUILD_TYPE=Release ..
    LLVM_DIR=/usr/lib/llvm-4.0 make
}

package() {
    cd ${pkgname%-git}/build
    make DESTDIR="$pkgdir/" install
    install -D -m644 "../LICENSE" "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
