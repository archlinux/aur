# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-fixedpointnumbers
_pkgname=FixedPointNumbers
pkgver=0.5.3
pkgrel=4
pkgdesc='Fixed point types for Julia'
arch=(any)
url=https://github.com/JuliaMath/FixedPointNumbers.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)

_commit=b150d0d4335c17bb0e1a72f310ce21116fb9de95
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaMath/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('b24651e1f4e87cb1fae625cef50caabfff36dcf5b448a8c0d803eb6c06faa39d'
            'ad085f3a880b61f931088db9d9b70ab69fabf9a92084ae8be8cab1ef3691150b'
            'ccc35c4ecc6b3c409acb4d1078d27b571a60750e9dfb3c73a135ed8305e919e0'
            'a054fe95daecfa16cf8b32f30bb8e051e440e1e8b1c7f1a88a64d2f8eb000bda')

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
	          version = VersionNumber(\"$pkgver\")
	          majmin  = VersionNumber(\"${pkgver%.*}\")
	          deps = Dict{String,Any}()

	          for (key, value) in alldeps
	            vers = split(key, \"-\")
	            lower = VersionNumber(vers[1])
	            if length(vers) == 2
	              upper = VersionNumber(vers[2])
	              if (majmin  >= lower && majmin  <= upper) ||
	                 (version >= lower && version <= upper)
	                merge!(deps, value)
	              end
	            elseif length(vers) == 1
	              if majmin == lower || version == lower
	                merge!(deps, value)
	              end
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
