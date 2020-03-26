# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-offsetarrays
_pkgname=OffsetArrays
pkgver=1.0.3
pkgrel=1
pkgdesc='Provides Julia users with arrays that have arbitrary indices'
arch=(any)
url=https://github.com/JuliaArrays/OffsetArrays.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
makedepends=(julia-distrohelper)

_commit=d49874cd7cc292e48c980a1254ece16ce7dfc7be
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('85fc544e4f89f3ee50d358a8e12de5ac25b0e35e140eb196336b0135703c5739'
            'bd53eceea5bf604916eb4adaa7f89157e6e918276997c769d64e4f81aff11eec'
            '1b21bc2bfd68eacbdeaf49ffd8f4f8da091ea82f767a070ff921cdc3d446601f'
            'c91e56454bad2d5dedf5d8a700a00708caa834a1434cd41ad6a7bde2fb39e054')

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
