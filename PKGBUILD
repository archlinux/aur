# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-json
_pkgname=JSON
pkgver=0.20.0
pkgrel=4
pkgdesc='JSON parsing and printing for Julia'
arch=(any)
url=https://github.com/JuliaIO/JSON.jl
license=(MIT)
depends=(julia
  julia-compat
  julia-datastructures
  julia-fixedpointnumbers
  julia-loadpath
  julia-offsetarrays
  julia-orderedcollections
)

_commit=f2c833d0b5c23a66f28811f02ff6edbdfd23c6dc
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaIO/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('1185a2d71ebbc0cce52ea5defb4722036f340b96c9e5719e495ca5c9b89c1f96'
            '45df09f58c92f61efa553b66d6c01028add7819865658934abd57fb98a394693'
            '60ccc8cd6ece9c85ce4a34b5bc9b56b88149a910d6d7cb7f40695a04a2437d06'
            '98eab77e3d637164697aedbe438eded75fbc00c5b1b881b11876aba44ad23441')

_slug() {
	local uuid=$(grep uuid $pkgname-Package.toml | cut -f3 -d' ')
	local sha1=$(grep \"$pkgver\" -a1 $pkgname-Versions.toml | tail -n1 | cut -f3 -d' ')
	julia -e "u = Base.UUID($uuid);
	          s = Base.SHA1(hex2bytes($sha1));
	          println(Base.version_slug(u,s));"
}

_deps() {
	julia -e "using Pkg

	          alldeps = Pkg.TOML.parsefile(\"$srcdir/$pkgname-Deps.toml\")
	          version = join(split(\"$pkgver\", \".\")[1:2],\".\")
	          deps = Dict{String,Any}()

	          for (key, value) in alldeps
	            vers = split(key, \"-\")

	            if version == vers[1] || (version > vers[1] && length(vers) == 2 && version <= vers[2])
	              merge!(deps, value)
	            end
	          end

	          Pkg.TOML.print(deps)"
}

prepare() {
	# Generate a Project.toml from Registry metadata
	rm -f Project.toml && touch Project.toml
	cat $pkgname-Package.toml       >> Project.toml
	echo -e "version = \"$pkgver\"" >> Project.toml
	echo -e "\n[deps]"              >> Project.toml
	echo -e "$(_deps)" | sort       >> Project.toml
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
