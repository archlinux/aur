# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-offsetarrays
_pkgname=OffsetArrays
pkgver=0.11.4
pkgrel=1
pkgdesc='Provides Julia users with arrays that have arbitrary indices'
arch=(any)
url=https://github.com/JuliaArrays/OffsetArrays.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
makedepends=(julia-distrohelper)

_commit=8f95b8c4f5d05b6651bd4d17b7a00258b7f83c6c
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('62481bc8a612c0fd106601925b844c0d4aced34c4963d9d0b81fdeee638d42e4'
            'bd53eceea5bf604916eb4adaa7f89157e6e918276997c769d64e4f81aff11eec'
            '1b21bc2bfd68eacbdeaf49ffd8f4f8da091ea82f767a070ff921cdc3d446601f'
            '6331255b4d8e7a653b922ece16b0d167615dbf8e72ad823c2b58168b47ae9913')

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
