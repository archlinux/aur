# Maintainer: getzze <getzze at_gmail dot_com>
# From julia-compat package from Jonathon Fernyhough

pkgname=julia-arpack
_pkgname=Arpack
_arpack_ver=3.5.0
pkgver=0.3.1
pkgrel=2
pkgdesc='Arpack Package for Julia (compiled from source)'
arch=(any)
url=https://github.com/JuliaLinearAlgebra/Arpack.jl
license=(MIT)
depends=(julia arpack)

_commit=master
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLinearAlgebra/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml
        https://github.com/opencollab/arpack-ng/archive/${_arpack_ver}.tar.gz
        deps.jl
        script_slug.jl
)
sha256sums=('d6cd6641c29ed7ff60d79125823cb4565e7d1ec594046aa0737e2a0832d39330'
            '3a8e07881d715381578fa133b00f4fa9d3770bc239b37b55516bb4fed6732326'
            'd8fc2a720833fb2930bcdc2bc87624cd13852ab8ffb6e27e76b264829d725636'
            'ce1e72f10df1857103c24ab4106ee3711a9127e1985b37886652954d39bed2a8'
            '50f7a3e3aec2e08e732a487919262238f8504c3ef927246ec3495617dde81239'
            'ecdf3931626f06b33fda54d851580189585fef9ec740325a8c8beca7c44b799a'
            '288cc1b71f95b2164f955745d2232cbb350070816134211b26cc7313b0016745')

install=${pkgname}.install

_slug() {
	#dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
    julia script_slug.jl "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

prepare() {
    cp "$srcdir"/deps.jl $_pkgname.jl-$pkgver/deps/
}

build() {
    cd "$srcdir"/arpack-ng-$_arpack_ver
    
    # Compile Arpack 
    sh bootstrap
    ./configure
    make
#    make check

    # Copy in srcdir for check
    mkdir -p "$srcdir"/$_pkgname.jl-$pkgver/deps/usr/lib/
    cp SRC/.libs/libarpack.so.2.0.0 "$srcdir"/$_pkgname.jl-$pkgver/deps/usr/lib/

    ln -sf libarpack.so.2.0.0 "$srcdir"/$_pkgname.jl-$pkgver/deps/usr/lib/libarpack.so.2
    ln -sf libarpack.so.2.0.0 "$srcdir"/$_pkgname.jl-$pkgver/deps/usr/lib//libarpack.so
}

package() {
	cd "$srcdir"

    install -d "$pkgdir"/usr/share/julia/packages/$_pkgname
	cp -r $_pkgname.jl-$pkgver "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

    #install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd "$srcdir"/$_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
