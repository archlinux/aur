# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-ijulia
_pkgname=IJulia
pkgver=1.20.2
pkgrel=1
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

_commit=3d5f64bcb304c00931addd7c3bd68b6e38590b59
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('c58ad61c1e2dc3fa7e79d88d2965b0a5a6a940fbd316a3073ab0ed12ddfd18ec'
            '6a6d750fba39049f4b0a5903b7a7812f2ff89f5ed5132b44f5404451ee7176d6'
            '8f528e7a9177c8b3a30fb17b50b9fbc3bbc4f8a677a3d4cc940446182885e6b0'
            '2ffb78fbd365fbb9db4a16e24a851bcda52cf39553513fb62300dcc8cf356254')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

_project() {
	dh_julia distro_project_ "$srcdir"/"$pkgname"-$pkgver-{Package,Versions,Deps}.toml $pkgver
}

_juliaver="$(/usr/bin/julia -v | cut -f3 -d' ')"
_juliaver="${_juliaver%.*}"

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
	        "$srcdir"/.local/share/jupyter/kernels/julia-$_juliaver/kernel.json

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

	install -Dm644 "$srcdir"/.local/share/jupyter/kernels/julia-$_juliaver/kernel.json \
	               "$pkgdir"/usr/share/jupyter/kernels/julia-$_juliaver/kernel.json
}
