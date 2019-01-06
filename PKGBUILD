# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-conda
_pkgname=Conda
pkgver=1.1.1
pkgrel=3
pkgdesc='Use conda as a cross-platform binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPy/Conda.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
checkdepends=(julia-versionparsing)

_commit=9934475171b9a1bafb950868280b5aa2138687ed
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaPy/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('e506dc7be838432d5f92407db3bdfcb5f1716ff0d1e52015e93956f1eb206994'
            '65fbb8a34cb714871ee7cea2cf6f2ded558444055eaa168e3173ba094b94dbf2'
            '16404fdeb5c5df9d923ffbdc6f6d146561242cbf1255dc67ab668625480d4be2'
            '1e610d2ab3e73eebb5380c2d846f21389334603e1aea3807e2e9c107b2a965ce')

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

build() {
	cd $_pkgname.jl-$pkgver/deps
	CONDA_JL_HOME=/usr julia build.jl
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r     $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Will download the full MiniConda installer, so disable
#check() {
#	cd $_pkgname.jl-$pkgver
#	ROOTENV=/usr JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
