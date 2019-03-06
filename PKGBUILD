# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-catindices
_pkgname=CatIndices
pkgver=0.2.0
pkgrel=1
pkgdesc='Julia package for indices-aware array concatenation and growth'
arch=(any)
url=https://github.com/JuliaArrays/CatIndices.jl
license=(MIT)
depends=(julia julia-compat julia-customunitranges julia-loadpath)
makedepends=(julia-distrohelper)

_commit=05378dceec7bb8b2138a96b5b787ea7430c7ad3d
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaArrays/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('e64af9d9d98d4de85814bf09ac3e00bf121770f2889e65b2f3b493de3934c1f8'
            '2710fc229fd01cde0123978f9e1b04f6fb57b91848910fb2077163cee0388cd4'
            'a0a6dbcf01b3727654e2ad7fa33b6dc22cd745e4363e86fb078e1a0d0a566ee7'
            '43f62e78ca46c6c62ba27fc18c2bc7b228b4bad7eb00cdb726c84e24321816ce')

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
