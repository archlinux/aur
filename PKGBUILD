# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-mbedtls-jll
_pkgname=MbedTLS_jll
pkgver=2.16.0+1
pkgrel=1
pkgdesc='Binary wrapper around mbedtls for Julia'
arch=(any)
url=https://github.com/JuliaBinaryWrappers/MbedTLS_jll.jl
license=(MIT)
depends=(julia julia-loadpath mbedtls)
makedepends=(julia-distrohelper)

_commit=96be7e98a1cfb0919b1e890d960835ed0866d37c
source=($pkgname-$pkgver.tar.gz::$url/archive/MbedTLS-v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('16ef98905e00887949dfcfe96e8f1f5bf4202d9239feb3fbf9bf7af1bd8c24fb'
            '4463255106e98de25195db72d9a5a5d7322fb23410bb588cb890f2eede9d51d8'
            '188c7178510cfb7b2a6f3534f74e13bb22b2688777676b05a868e1815693a178'
            '36cda731590272b1f7b2710e5172e618eeb6a191a3cc5f63e3f31e7852820fb0')

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

	cp      -r     $_pkgname.jl-MbedTLS-v${pkgver/+/-} "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	#install -Dm644 $_pkgname.jl-MbedTLS-v${pkgver/+/-}/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
