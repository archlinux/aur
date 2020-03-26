# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-zeromq-jll
_pkgname=ZeroMQ_jll
pkgver=4.3.2+1
pkgrel=1
pkgdesc='Binary wrapper for ZeroMQ'
arch=(any)
url=https://github.com/JuliaBinaryWrappers/ZeroMQ_jll.jl
license=(MIT)
depends=(julia julia-loadpath)
makedepends=(julia-distrohelper)

_commit=28c4f605027b0162910055c9c41d0d96ed6d22e5
source=($pkgname-$pkgver.tar.gz::$url/archive/ZeroMQ-v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('32ed73fd677c95e86f686937046f3ef176b945f73d52187cf8284feaf2ee17a5'
            '99573347cf33ceb81436e6164b79bf96d7e0376825e3e01edd8cc4264967b51c'
            'bc2b49fa81297a28daedad213bd4cee7c51c9582f0aaf72a48d9d6469670b8e5'
            '3eef8e6d8297943c659652f36919ce7d569cb2ab81aa42699e35c6dc31c377ce')

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

	cp      -r     $_pkgname.jl-ZeroMQ-v${pkgver/+/-} "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-ZeroMQ-v${pkgver/+/-}/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
