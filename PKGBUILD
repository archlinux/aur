# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-json
_pkgname=JSON
pkgver=0.21.0+0.20.1
_fakever=0.20.1
pkgrel=1
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

_commit=ccacffb64df7b232dfdfd008cda320e01ed767a3
source=($pkgname-$pkgver.tar.gz::$url/archive/v$_fakever.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('ada66fe959bbd6f9cde5c8b4f4dbd274247c2b589209a37d7cdfa625bba848de'
            'f2081075310a863d0a2b79d1ebb3f855e5606ac8da780827358b09403b613594'
            '60ccc8cd6ece9c85ce4a34b5bc9b56b88149a910d6d7cb7f40695a04a2437d06'
            '69660d72731466def056d3972078a4926429a681d47f83fed7d2e4d6b85f487d')

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

	cp      -r     $_pkgname.jl-$_fakever "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$_fakever/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$_fakever
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
