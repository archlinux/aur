# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-orderedcollections
_pkgname=OrderedCollections
pkgver=1.0.2
pkgrel=4
pkgdesc='Julia implementation of associative containers that preserve insertion order '
arch=(any)
url="https://github.com/JuliaCollections/OrderedCollections.jl"
license=(MIT)
depends=(julia julia-loadpath)

_commit=18f9a555382c1ee43861bbc4b1e2df7b3ae0829b
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('33d4e568f7cbffe9187d7548e86487f375ec0be07fa0da3743a2e008a8453707'
            '6982f10acd1bce62ac2ce772b4d038ce74b11667bba5db75a3b8861d648da93b'
            '70bf9e181599853f1903f8c8f2ca5f26d9aab31d945df87796d6a2f3c8019060'
            '9d8e19a723312d212e7124c0df34f6dc86a85017eb8a3fe4e5316fc0e612e06d')

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

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
