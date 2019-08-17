# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-ijulia
_pkgname=IJulia
pkgver=1.19.0
pkgrel=3
pkgdesc='Julia-language backend combined with the Jupyter interactive environment'
arch=(any)
url=https://github.com/JuliaLang/IJulia.jl
license=(MIT)
depends=(julia
  julia-compat
  julia-conda
  julia-json
  julia-loadpath
  julia-mbedtls
  julia-softglobalscope
  julia-zmq
  jupyter
)
makedepends=(
  julia-distrohelper
  julia-versionparsing
)

_commit=b030e7985a02e5e6af2af60d66f5e53b66029498
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('a124d84bb661500f3789a00c954204e0e070f7e8d04cc3c7861021b47ce6c933'
            'c43cd2d213a9a1bd27f7a30af4b1ff1a83bd17bc70a41d08a8da3d601c1c03f4'
            '8f528e7a9177c8b3a30fb17b50b9fbc3bbc4f8a677a3d4cc940446182885e6b0'
            '74d2175cf2dec5a601b974242a878cc56d26dbc12b3481d33da8f7e72b26b361')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

_project() {
	dh_julia distro_project_ "$srcdir"/"$pkgname"-$pkgver-{Package,Versions,Deps}.toml $pkgver
}

prepare() {
	# Generate a Project.toml from Registry metadata
	rm -f Project.toml && _project

	# Hard-code check for conda to fail. We want it to fail so we use the system jupyter.
	sed -i '/isconda =/c\isconda = false' $_pkgname.jl-$pkgver/deps/build.jl
}

build() {
	cd $_pkgname.jl-$pkgver/deps
	HOME="$srcdir" julia build.jl

	# Fix reference to $srcdir
	sed -i "s|$srcdir/$_pkgname.jl-$pkgver|/usr/share/julia/vendor/$_pkgname|" \
	        "$srcdir"/.local/share/jupyter/kernels/julia-1.1/kernel.json

	msg2 "NOTE: If the Julia kernel fails to run, clear your $HOME/.julia/cache"
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r     $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 "$srcdir"/.local/share/jupyter/kernels/julia-1.1/kernel.json \
	               "$pkgdir"/usr/share/jupyter/kernels/julia-1.1/kernel.json
}
