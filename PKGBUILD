# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-ijulia
_pkgname=IJulia
pkgver=1.12.0
pkgrel=1
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
  julia-versionparsing
)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('03ba7cbd482fc33905968a8aa261e49f235a5031ad165b5aa4e6d8812aed72c8')

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

	msg2 "NOTE: If the Julia kernel fails to run, clear your $HOME/.julia/cache"
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
