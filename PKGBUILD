# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-customunitranges
_pkgname=CustomUnitRanges
pkgver=1.0.0
pkgrel=1
pkgdesc='Package-specific AbstractUnitRange types for julia'
arch=(any)
url=https://github.com/JuliaArrays/CustomUnitRanges.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
makedepends=(julia-distrohelper)

_commit=5aa002981d19e489ac4a7dd6ecbd23aed82f523e
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('63a43a8de19dfa3d2b8a48c4d9a88b83edb7ea70366d5def3e31c5d8acda6df2'
            'f5073470974b5c9fe8c99136d214339ab8bf424cabc3ac32ac3a7d2d31ba053d'
            'e436d208193283b7915203743069133c5969a9cd4fc3485e2c0cd50e82bbf178'
            'cf8537454ee8aa818db030b2c7c7eb6ae7134206a45473fb0cd1f2633ad99252')

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
