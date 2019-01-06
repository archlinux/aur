# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-ijulia
_pkgname=IJulia
pkgver=1.15.1
pkgrel=3
pkgdesc='Julia-language backend combined with the Jupyter interactive environment'
arch=(any)
url=https://github.com/JuliaLang/IJulia.jl
license=(MIT)
depends=(julia
  julia-compat
  julia-json
  julia-loadpath
  julia-mbedtls
  julia-softglobalscope
  julia-zmq
  jupyter
)
makedepends=(
  julia-conda
  julia-versionparsing
)

_commit=ccf2fdff37e06ab95d1d5de487f66de0268cabb8
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('f6c228d7e2e172161983f9e5abf111726773ab6008ef976382f1507f48f6a88a'
            'dcdb09b20e51ea32814516904292ea28cc2dff1e0db7bcd7bb594a5e38663393'
            '8f528e7a9177c8b3a30fb17b50b9fbc3bbc4f8a677a3d4cc940446182885e6b0'
            '0042ae63c62ccaaed382eab4d969669cf5397fb6bb83a8403b0c79adb6ba9aa9')

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

	cd $_pkgname.jl-$pkgver/deps

	# Hard-code check for conda to fail. We want it to fail so we use the system jupyter.
	sed -i '/isconda =/c\isconda = false' build.jl
}

build() {
	cd $_pkgname.jl-$pkgver/deps
	HOME="$srcdir" julia build.jl

	# Fix reference to $srcdir
	sed -i "s|$srcdir/$_pkgname.jl-$pkgver|/usr/share/julia/vendor/$_pkgname|" \
	        "$srcdir"/.local/share/jupyter/kernels/julia-1.0/kernel.json

	msg2 "NOTE: If the Julia kernel fails to run, clear your $HOME/.julia/cache"
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r     $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 "$srcdir"/.local/share/jupyter/kernels/julia-1.0/kernel.json \
	               "$pkgdir"/usr/share/jupyter/kernels/julia-1.0/kernel.json
}
