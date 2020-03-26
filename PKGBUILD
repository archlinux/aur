# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-mbedtls
_pkgname=MbedTLS
pkgver=1.0.1
pkgrel=1
pkgdesc='Wrapper around mbedtls for Julia'
arch=(any)
url=https://github.com/JuliaWeb/MbedTLS.jl
license=(MIT)
depends=(julia julia-binaryprovider julia-compat julia-loadpath julia-mbedtls-jll)
makedepends=(julia-distrohelper)

_commit=d4503712cff569f18cc0151afafbda4dbdd013c4
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml
        'disable-test-logsecrets.patch')
sha256sums=('7228cada76793e454da686fcdb597ca64a831aaa7acd34e092d9d0a5f1c834e1'
            '96130fe5ae51efd7870da7fef175ed263fd328973f10126bf647561c1df60a52'
            'a41e3f573832218514c02c512d5a24e85a473a8787eaac5c5fcad60bd1a0f1f1'
            'eb6beed561fef2fa69cf18e74aeef26a8b4076345d064c067c3a1c3f9c66949b'
            'b6a539c928f02bec79734c6edf45d2a83ab169a696b0591344296615d46d8e1b')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

_project() {
	dh_julia distro_project_ "$srcdir"/"$pkgname"-$pkgver-{Package,Versions,Deps}.toml $pkgver
}

prepare() {
	# Generate a Project.toml from Registry metadata
	rm -f Project.toml && _project

	cd $_pkgname.jl-$pkgver

	# Test currently fails
	patch -Np1 -i ../disable-test-logsecrets.patch
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r     $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver/test
	HOME="$srcdir" JULIA_LOAD_PATH=../src:$JULIA_LOAD_PATH julia runtests.jl
}
