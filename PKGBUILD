# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-softglobalscope
_pkgname=SoftGlobalScope
pkgver=1.0.10
pkgrel=2
pkgdesc='Utilities for "soft" global scope in interactive Julia environments'
arch=(any)
url=https://github.com/stevengj/SoftGlobalScope.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
makedepends=(julia-distrohelper)

_commit=5bdd989d20e4caecfd9da66c6ac4dbf3f98656f5
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('b871a44657298c809a5400b47c0bdddb1878963f3704cb6aef3e461808a79e55'
            '74225d1c6ba49d7378ed4a6c15d2f59539d166031269bd75c1af70fb1a00b9df'
            'bd88b87dce5f48dd61010d56f75d2cf8aa73ddfca287c5fdc6f71a09c2bd9ca4'
            '50a75c508968f20fc543fe466d9b5e31b945f3bd34ff631aa9e9ff62b76a454b')

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
