# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=moonray-git
pkgname=($pkgbase moonray-gui-git)
_pkgname=openmoonray
pkgver=1.0.0.0.r0.g9b629e0
pkgrel=1
pkgdesc='DreamWorks’ production MCRT renderer'
arch=(x86_64)
license=(Apache2)
url="https://$_pkgname.org"
_url="https://github.com/dreamworksanimation"
depends=(lua
         python)
makedepends=(boost
             cmake
             git
             #usd # in AUR but doesn’t build
             )
source=("$_pkgname::git+$_url/$_pkgname"
        "$_pkgname+arras+arras4_core::git+$_url/arras4_core.git"
        "$_pkgname+arras+arras_render::git+$_url/arras_render.git"
        "$_pkgname+arras+distributed+arras4_node::git+$_url/arras4_node.git"
        "$_pkgname+arras+distributed+minicoord::git+$_url/minicoord.git"
        "$_pkgname+cmake_modules::git+$_url/cmake_modules.git"
        "$_pkgname+moonray+hydra+hdMoonray::git+$_url/hdMoonray.git"
        "$_pkgname+moonray+hydra+moonray_sdr_plugins::git+$_url/moonray_sdr_plugins.git"
        "$_pkgname+moonray+mcrt_denoise::git+$_url/mcrt_denoise.git"
        "$_pkgname+moonray+moonray::git+$_url/moonray.git"
        "$_pkgname+moonray+moonray_arras+mcrt_computation::git+$_url/mcrt_computation.git"
        "$_pkgname+moonray+moonray_arras+mcrt_dataio::git+$_url/mcrt_dataio.git"
        "$_pkgname+moonray+moonray_arras+mcrt_messages::git+$_url/mcrt_messages.git"
        "$_pkgname+moonray+moonray_dcc_plugins::git+$_url/moonray_dcc_plugins.git"
        "$_pkgname+moonray+moonray_gui::git+$_url/moonray_gui.git"
        "$_pkgname+moonray+moonshine::git+$_url/moonshine.git"
        "$_pkgname+moonray+moonshine_usd::git+$_url/moonshine_usd.git"
        "$_pkgname+moonray+render_profile_viewer::git+$_url/render_profile_viewer.git"
        "$_pkgname+moonray+scene_rdl2::git+$_url/scene_rdl2.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# git submodule status | cut -c2- | awk '{s=$2; gsub("/", "+", s); gsub(".*/", "", $2); print "\"$_pkgname+" s "::git+$_url/" $2 ".git\"" }'

prepare() {
	cd "$_pkgname"
	git submodule init
	for s in ${source[@]%%::*}; do
		case "$s" in
			$_pkgname+*)
				local module=${s#$_pkgname+}
				local path=${module//+//}
				git config submodule.$path.url "$srcdir/$s"
				;;
		esac
	done
	git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\.\([ab]\)/\1/'
}

build() {
	cd "$_pkgname"
	cmake --preset dwa-release
	cmake --build
}


package_moonray-git() {
	provides=("${pkgname%-git}=$pkgver")
	conflicts=(${pkgname%-git})
	cd "$_pkgname"
}

package_moonray-gui-git() {
	provides=("${pkgname%-git}=$pkgver")
	conflicts=(${pkgname%-git})
	depends+=($pkgbase)
	cd "$_pkgname"
}
