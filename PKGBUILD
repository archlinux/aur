# Maintainer: Jonathon Fernyhough <jonathon_at manjaro_dot org>
# Upstream author: Mo Zhou <lumin_at debian dot_org>

pkgname=julia-distrohelper
_pkgname=DistroHelper.jl
_pkgver=0.1.0
_commit=dabf5af662307865a88274c4d89fdf5f0b2ad667
pkgver=0.1.0r1.dabf5af
pkgrel=1
pkgdesc="DistroHelper.jl (dh_julia)"
arch=(any)
url="https://github.com/cdluminate/DistroHelper.jl"
license=('Custom:Expat')
source=("git+$url.git#commit=$_commit"
        distro-project-full.diff
        https://raw.githubusercontent.com/JuliaLang/Pkg.jl/889a5dd661d5f843afffd1d6ae47b4bd2ab32811/src/versions.jl
        versionrange-check.diff)
sha256sums=('SKIP'
            '0c9c185024e335bba20f1907754c1057cf6b43b74f0b7d1490b5c2099b3e5656'
            '09cb809f94a29d6b576e6dbd5cc17e7534168b725c5106cdddd09ccafbc46964'
            '61d089d1b9dc3e44bfdc8469ca8c248fb7b17914cc7879346491c7f1425d37f4')

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
