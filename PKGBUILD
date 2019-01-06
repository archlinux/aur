# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-datastructures
_pkgname=DataStructures
pkgver=0.14.0
pkgrel=4
pkgdesc='Julia implementation of Data structures'
arch=(any)
url=https://github.com/JuliaCollections/DataStructures.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath) # julia-primes) circular dependency for check()

_commit=e558358589cf4704b991bd4425dd9e5fa84c7d11
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaCollections/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('7934fd1fd78e9489cbafd73ee1a07381953035e675b3d5c6a7faa6cde1e4f087'
            '5a4ef8d0b38f4b5d6096e3809d03cc71f38ef275e93ed2ee80b4bafde2f7aea6'
            '7f7668d5864d661e32aa75e5ef6e9de218e160ec849b67d7555e66a48b2aa4e9'
            'ad72f6850abd7dbb09bad3165f5c192ed8e2c5b006a384c53c8a61d533055f1c')

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

	cp      -r    $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644 Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s    ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/License.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Has circular dependency on julia-primes
#check() {
#	cd $_pkgname.jl-$pkgver
#	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
