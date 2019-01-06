# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-compat
_pkgname=Compat
pkgver=1.4.0
pkgrel=3
pkgdesc='Compat Package for Julia.'
arch=(any)
url=https://github.com/JuliaLang/Compat.jl
license=(MIT)
depends=(julia julia-loadpath)

_commit=0a4458707f81e5cf3885e6162f22a0d28d819f5b
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$_pkgname.jl/archive/v$pkgver.tar.gz
        $_pkgname-Project.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('64913d7dbde5b5a64608a1a52dc127dd58c9089dfa68fa4d3584a0a38ac50e5e'
            '7f362281b2c125dc2399af6421585d273a009cf619bee19c0440cf19477177ea'
            '635b69201accd41cbf62491638b8e880370a473dd6ecf438fcfc1a80211b3b6c'
            'fb4b9fbfdd0bb4f846603ae206a1e73c5266c81c6be3a36a6db3525604abe5c3')

_slug() {
	local uuid=$(grep uuid $pkgname-Package.toml | cut -f3 -d' ')
	local sha1=$(grep \"$pkgver\" -a1 $pkgname-Versions.toml | tail -n1 | cut -f3 -d' ')
	julia -e "u = Base.UUID($uuid);
	          s = Base.SHA1(hex2bytes($sha1));
	          println(Base.version_slug(u,s));"
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r    $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644 $_pkgname-Project.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s    ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
