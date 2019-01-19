# Maintainer: Jacob Salzberg <jssalzbe@ncsu.edu>
pkgname=rosie-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Rosie Pattern Language (RPL) and the Rosie Pattern Engine."
arch=('any')
provides=('rosie')
url="https://gitlab.com/rosie-pattern-language/rosie"
license=('MIT')
depends=('readline')
makedepends=('git' 'make' 'gcc')
source=("git+https://gitlab.com/rosie-pattern-language/rosie"
        "git+https://github.com/mpeterv/argparse.git#commit=412e6aca393e365f92c0315dfe50181b193f1ace"
        "git+https://gitlab.com/rosie-pattern-language/lua.git#commit=afa03c0331e8907edc47fa75d26c338b22c136ad"
        "git+https://gitlab.com/rosie-pattern-language/lua-cjson.git#commit=1428c9c1aaad56a6342e6e8b65245a56bc10ef71"
        "git+https://gitlab.com/rosie-pattern-language/lua-modules.git#commit=8ac06333311ea07f9b4ec59f6a1997156fe631a6"
        "git+https://gitlab.com/rosie-pattern-language/lua-readline.git#commit=4aedcbdb991055d00505752dca86f57fff90bd95"
        "git+https://gitlab.com/rosie-pattern-language/rosie-lpeg.git#commit=8f6cf926ffc6c63dcd97240a055acc4340637a46")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    cd rosie
    echo -n "[submodule \"submodules/lua\"]
	path = submodules/lua
	url = $srcdir/lua/
[submodule \"submodules/lua-cjson\"]
	path = submodules/lua-cjson
	url = $srcdir/lua-cjson/
[submodule \"submodules/rosie-lpeg\"]
	path = submodules/rosie-lpeg
	url = $srcdir/rosie-lpeg/
[submodule \"submodules/lua-readline\"]
	path = submodules/lua-readline
	url = $srcdir/lua-readline/
[submodule \"submodules/lua-modules\"]
	path = submodules/lua-modules
	url = $srcdir/lua-modules/
[submodule \"submodules/argparse\"]
	path = submodules/argparse
	url = $srcdir/argparse/
" > .gitmodules
    git submodule sync
    git submodule init
    git submodule update
}

build() {
    cd rosie
    pushd submodules/lua-readline
    # This build gets fussy if ldflags is set to anything, idk why
    export LDFLAGS=""
    make
    popd
    make
}

package() {
    cd rosie
    mkdir "$pkgdir/usr"
    make install DESTDIR="$pkgdir/usr" ROSIE_HOME="/usr/lib/rosie"
}

