# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-json
_pkgname=JSON
pkgver=0.21.0
pkgrel=2
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
  julia-parsers
)
makedepends=(julia-distrohelper)

_commit=364ab0ee90ba4e4567abbccddb8f6c26116b8527
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('74712822a34b0c49e3e538b489ca35e42378f03c1cae3d47dd6e21eeea0c66e9'
            '7bcb48e9e69d3e077977cd81a27fc7462a8d18cce4d508d3c689e27aca6ad0a7'
            '60ccc8cd6ece9c85ce4a34b5bc9b56b88149a910d6d7cb7f40695a04a2437d06'
            '3597218a5f46d6b3f7dff0ef0f9fb523caa47d5373bc23d46e6c0637a71b6bf0')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

_project() {
	dh_julia distro_project_ "$srcdir"/"$pkgname"-$pkgver-{Package,Versions,Deps}.toml $pkgver
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
