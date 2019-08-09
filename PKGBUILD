# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-parsers
_pkgname=Parsers
pkgver=0.3.1
pkgrel=1
pkgdesc='fast parsing machinery for basic types in Julia'
arch=(any)
url=https://github.com/JuliaData/Parsers.jl
license=(MIT)
depends=(julia
  julia-loadpath
)
makedepends=(julia-distrohelper)

_commit=ad64a7aee16cfd155607dc3811d78077b029b74a
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('488ef515a895c9be8df242d916473a5fab15849b2bffcd72a5499ad12b44f9e0'
            'd92a1fcb955e22ed2a2fda52557a7c2c19d3086707c7920d7f1dde470c6601aa'
            'f6e93a0b4e0f8d305088c29e85d41c0d38364f6e3634729a66392c42b4d4574c'
            '86244b49571f6792c678eb12a6ae7f40b695cd8495e7d3f7a1c58e7c5e7ddb4b')

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

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
