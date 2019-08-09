# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-offsetarrays
_pkgname=OffsetArrays
pkgver=0.11.1
pkgrel=2
pkgdesc='Provides Julia users with arrays that have arbitrary indices'
arch=(any)
url=https://github.com/JuliaArrays/OffsetArrays.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
makedepends=(julia-distrohelper)

_commit=220dbbe2fc32cfc02552f7d8e41293203fd37fba
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('91cf9aaffc7b63833517ec5c5384dcba31250fa365e777ded64ae311886bd128'
            '2326399926cec5016e4ae3e457d13abd32c557045602d756d50e2f8fe75777e6'
            '1b21bc2bfd68eacbdeaf49ffd8f4f8da091ea82f767a070ff921cdc3d446601f'
            '958abcca279df67920bf0eb503845e9af9d74f1a920690ffdc7b34d4452b8a84')

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

# TODO Test failure reported as #73
#check() {
#	cd $_pkgname.jl-$pkgver
#	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
