# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-ijulia
_pkgname=IJulia
pkgver=1.10.0
pkgrel=2
pkgdesc='Julia-language backend combined with the Jupyter interactive environment'
arch=(any)
url=https://github.com/JuliaLang/IJulia.jl
license=(MIT)
depends=(julia
  julia-compat
  julia-json
  julia-mbedtls
  julia-softglobalscope
  julia-zmq
  jupyter
)
makedepends=(
  julia-conda
)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('2768d2a98c8522b252dac9651863cb06eae48c1509fc9c75d490a1c2c9452f81')

prepare() {
	cd $_pkgname.jl-$pkgver/deps

	# Hard-code check for conda to fail. We want it to fail so we use the system jupyter.
	sed -i '/isconda =/c\isconda = false' build.jl

	# Don't install kernel spec to building user's home
	sed -i "75,79s|--user|--prefix=.|" kspec.jl
}

build() {
	cd $_pkgname.jl-$pkgver/deps
	julia build.jl

	# Fix reference to $srcdir
	sed -i "s|$srcdir/$_pkgname.jl-$pkgver|/usr/share/julia/environments/v1.0/$_pkgname|" \
	        share/jupyter/kernels/julia-1.0/kernel.json
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}

package() {
	cd $_pkgname.jl-$pkgver

	install -dm755 "$pkgdir"/usr/
	mv deps/share "$pkgdir"/usr/

	install -dm755 "$pkgdir"/usr/share/julia/environments/v1.0/$_pkgname/
	cp -r {src,test,deps} "$pkgdir"/usr/share/julia/environments/v1.0/$_pkgname/
}
