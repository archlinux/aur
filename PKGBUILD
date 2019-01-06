# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-ijulia
_pkgname=IJulia
pkgver=1.15.1
pkgrel=2
pkgdesc='Julia-language backend combined with the Jupyter interactive environment'
arch=(any)
url=https://github.com/JuliaLang/IJulia.jl
license=(MIT)
depends=(julia
  julia-compat
  julia-json
  julia-loadpath
  julia-mbedtls
  julia-softglobalscope
  julia-zmq
  jupyter
)
makedepends=(
  julia-conda
  julia-versionparsing
)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$_pkgname.jl/archive/v$pkgver.tar.gz
        Project.toml)
sha256sums=('f6c228d7e2e172161983f9e5abf111726773ab6008ef976382f1507f48f6a88a'
            'b781b82943b5cdd8ed46e273e2e903e117fc9b99a0923a98ea9183a9a5f17da8')

prepare() {
	cd $_pkgname.jl-$pkgver/deps

	# Hard-code check for conda to fail. We want it to fail so we use the system jupyter.
	sed -i '/isconda =/c\isconda = false' build.jl
}

build() {
	cd $_pkgname.jl-$pkgver/deps
	HOME="$srcdir" julia build.jl

	# Fix reference to $srcdir
	sed -i "s|$srcdir/$_pkgname.jl-$pkgver|/usr/share/julia/vendor/$_pkgname|" \
	        "$srcdir"/.local/share/jupyter/kernels/julia-1.0/kernel.json

	msg2 "NOTE: If the Julia kernel fails to run, clear your $HOME/.julia/cache"
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}

package() {
	install -d "$pkgdir"/usr/share/julia/vendor

	cp      -r     $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml          "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 "$srcdir"/.local/share/jupyter/kernels/julia-1.0/kernel.json \
	               "$pkgdir"/usr/share/jupyter/kernels/julia-1.0/kernel.json
}
