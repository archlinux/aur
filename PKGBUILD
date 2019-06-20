# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-json
_pkgname=JSON
pkgver=0.20.0
pkgrel=6
pkgdesc='JSON parsing and printing for Julia'
arch=(any)
url=https://github.com/JuliaIO/JSON.jl
license=(MIT)
depends=(julia
  julia-compat
  julia-datastructures
  julia-fixedpointnumbers
  julia-loadpath
  julia-offsetarrays
  julia-orderedcollections
)
makedepends=(julia-distrohelper)

_commit=f2c833d0b5c23a66f28811f02ff6edbdfd23c6dc
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaIO/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('1185a2d71ebbc0cce52ea5defb4722036f340b96c9e5719e495ca5c9b89c1f96'
            '45df09f58c92f61efa553b66d6c01028add7819865658934abd57fb98a394693'
            '60ccc8cd6ece9c85ce4a34b5bc9b56b88149a910d6d7cb7f40695a04a2437d06'
            '98eab77e3d637164697aedbe438eded75fbc00c5b1b881b11876aba44ad23441')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

_project() {
	dh_julia distro_project_ "$srcdir"/"$pkgname"-$pkgver-{Package,Versions,Deps}.toml
}

prepare() {
	# Generate a Project.toml from Registry metadata
	rm -f Project.toml && _project
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r     $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
