# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-versionparsing
_pkgname=VersionParsing
pkgver=1.1.3
pkgrel=3
pkgdesc="Flexible parsing of version-number strings into Julia's built-in VersionNumber type"
arch=(any)
url=https://github.com/stevengj/VersionParsing.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)

_commit=334790bf66964522555084d375eef20d1390fb06
source=($pkgname-$pkgver.tar.gz::https://github.com/stevengj/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('b681185b05ced15f0eb9be26f943898ac43cfcf561201a2f6e35e321c8e441e6'
            'ea5619020ec53b46849fd990e7869bdb935d7bd44a84fdc035bbc8de5969c313'
            'c8de56d3c846a487b5909e6666d3665ec7a7676571b108da71784dbeec385e92'
            '45a10d2ee6b9eef6897306c77f8ba49610afb8514a3c640a76fc2615acc165e6')

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
