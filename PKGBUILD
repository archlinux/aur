# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-ijulia
_pkgname=IJulia
pkgver=1.10.0
pkgrel=1
pkgdesc='Julia-language backend combined with the Jupyter interactive environmen'
arch=(any)
url=https://github.com/JuliaLang/IJulia.jl
license=(custom)
depends=(julia
  julia-compat
  julia-json
  julia-mbedtls
  julia-zmq
  jupyter
)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('2768d2a98c8522b252dac9651863cb06eae48c1509fc9c75d490a1c2c9452f81')

prepare() {
	cd $_pkgname.jl-$pkgver
	cat >deps/deps.jl <<'EOF'
const jupyter = "/usr/bin/jupyter"
const notebook_cmd = ["/usr/bin/jupyter", "notebook", "--NotebookApp.iopub_data_rate_limit=2147483647"]
const jupyter_vers = v"4.4.0"
const IJULIA_DEBUG = false
EOF

	cat >deps/kernel.json <<'EOF'
{
  "display_name": "Julia 1.0.0",
  "argv": [
    "/bin/julia",
    "-i",
    "--startup-file=yes",
    "--color=yes",
    "/usr/share/julia/environments/v1.0/IJulia/src/kernel.jl",
    "{connection_file}"
  ],
  "language": "julia"
}
EOF
}

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test,deps} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/

	install -dm755 $pkgdir/usr/share/jupyter/kernels/ijulia
	install deps/{kernel.json,logo*} $pkgdir/usr/share/jupyter/kernels/ijulia/

	install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
