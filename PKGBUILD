# Maintainer: Elias Kosunen <elias dot kosunen at gmail dot com>
pkgname=varuna
pkgver=0.1.1
pkgrel=4
pkgdesc="Compiler for the WIP programming language"
arch=('i686' 'x86_64')
url="https://github.com/varuna-lang/varuna"
license=('BSD')
depends=('llvm-libs>=4.0.0' 'libutil-linux')
makedepends=('cmake>=3.2.3' 'git')
source=("git+https://github.com/varuna-lang/${pkgname}.git#tag=v${pkgver}"
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

prepare() {
    cd "$srcdir/${pkgname}"
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
    mkdir -p "$srcdir/${pkgname}/build"
    cd "$srcdir/${pkgname}/build"

    cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}

check() {
    cd "$srcdir/${pkgname}/bin"
    ./tests
}

package() {
    cd "$srcdir/${pkgname}/build"
	make DESTDIR="$pkgdir/" install
    install -D -m644 "../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
