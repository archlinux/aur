# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-catindices
_pkgname=CatIndices
pkgver=0.2.1
pkgrel=1
pkgdesc='Julia package for indices-aware array concatenation and growth'
arch=(any)
url=https://github.com/JuliaArrays/CatIndices.jl
license=(MIT)
depends=(julia julia-compat julia-customunitranges julia-loadpath julia-offsetarrays)
makedepends=(julia-distrohelper)

_commit=c9188911bcaa80bafb5baa8e9f7f82336f227d44
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('5821f49198c173280e7f79bdd8ba061f5f58457a47ab2b37cade70ed472bfd3a'
            '6dc637a44b1f69572a318f4832bc0c63ec08820d8d92b41c97591581b3968b00'
            'a0a6dbcf01b3727654e2ad7fa33b6dc22cd745e4363e86fb078e1a0d0a566ee7'
            '9a72ffbb8aabb37447011705706ddc3fd406db2f50c25cf6fd6132369eb5b4e9')

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
