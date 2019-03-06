# Maintainer: Jonathon Fernyhough <jonathon_at manjaro_dot org>
# Upstream author: Mo Zhou <lumin_at debian dot_org>

pkgname=julia-distrohelper
_pkgname=DistroHelper.jl
_pkgver=0.1.0
_commit=fa337bc4bbfb58428f0255c1e8903be5a1be57a3
pkgver=0.1.0r31.fa337bc
pkgrel=2
pkgdesc="DistroHelper.jl (dh_julia)"
arch=(any)
url="https://github.com/cdluminate/DistroHelper.jl"
license=('Custom:Expat')
source=("git+$url.git#commit=$_commit"
        distro-project-full.diff
        https://raw.githubusercontent.com/JuliaLang/Pkg.jl/b807801a7749e42d34e4157d24aa6ecaf50a95bb/src/versions.jl
        versionrange-check.diff)
sha256sums=('SKIP'
            '0c9c185024e335bba20f1907754c1057cf6b43b74f0b7d1490b5c2099b3e5656'
            '208d54252ea1a59eb396f3aafd1180b37ee950112e80554d7ce62983d0f52ec0'
            '5795b95c7fe46116fb87dc24cda16b5da1b2ce3d0ec215bd97626d3299402c61')

pkgver() {
	# Upstream package is currently UNRELEASED so use the commit to provide the
	# pre-release version number
	cd "$_pkgname"
	printf "${_pkgver}r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Add distro_project_() function to generate a full Project.toml
	git -C $_pkgname apply ../distro-project-full.diff

	# Fix version bounds/range checks, use Pkg's versions.jl
	git -C $_pkgname apply ../versionrange-check.diff
}

package() {
	cd "$_pkgname"

	install -D     dh_julia            "$pkgdir"/usr/bin/dh_julia
	install -Dm644 Project.toml        "$pkgdir"/usr/share/julia/DistroHelper/Project.toml
	install -Dm644 src/DistroHelper.jl "$pkgdir"/usr/share/julia/DistroHelper/src/DistroHelper.jl
	install -m644  ../versions.jl      "$pkgdir"/usr/share/julia/DistroHelper/src/versions.jl
	install -Dm644 LICENSE             "$pkgdir"/usr/share/licenses/julia-distrohelper/LICENSE
}
