# Maintainer: Mr.Smith1974
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>

_pkgname=Orbiter
pkgname=orbiter2016-git
pkgver=r560.01aaeb02
pkgrel=4
pkgdesc="Orbiter Space Flight Simulator"
arch=(x86_64)
url="http://orbit.medphys.ucl.ac.uk/index.html"
license=(MIT)
depends=()
makedepends=('git' 'cmake' 'glfw' 'openal' 'libsndfile' 'glm' 'texlive-latex')
provides=()
conflicts=()
source=("Orbiter_BasicLogo.png"
	"Orbiter.desktop"
	"TheGondos-orbiter::git+https://github.com/TheGondos/orbiter.git#branch=linux"
        "TheGondos-imgui::git+https://github.com/TheGondos/imgui.git"
        "TheGondos-XRVessels::git+https://github.com/TheGondos/XRVessels.git"
        "TheGondos-SOIL2::git+https://github.com/TheGondos/SOIL2.git"
        "TheGondos-NASSP::git+https://github.com/TheGondos/NASSP.git"
        "TheGondos-G42-200::git+https://github.com/TheGondos/G42-200.git"
        "TheGondos-UCSO::git+https://github.com/TheGondos/UCSO.git"
        "TheGondos-Deepstar::git+https://github.com/TheGondos/Deepstar.git"
        "TheGondos-libnsbmp::git+https://github.com/TheGondos/libnsbmp.git"
        "TheGondos-nanovg::git+https://github.com/TheGondos/nanovg.git"
        "TheGondos-imgui-node-editor::git+https://github.com/TheGondos/imgui-node-editor.git"
        "TheGondos-imgui-notify::git+https://github.com/TheGondos/imgui-notify.git"
        "TheGondos-md4c::git+https://github.com/mity/md4c.git"
        "TheGondos-imgui_md::git+https://github.com/TheGondos/imgui_md.git"
        "TheGondos-SDL_GameControllerDB::git+https://github.com/gabomdq/SDL_GameControllerDB.git"
        "TheGondos-imgui-knobs::git+https://github.com/altschuler/imgui-knobs.git"
        "TheGondos-Orb42S::git+https://github.com/TheGondos/Orb42S.git"
        "TheGondos-SSRMS::git+https://github.com/TheGondos/SSRMS.git"
        "TheGondos-plus42desktop::git+https://github.com/TheGondos/plus42desktop.git")
sha256sums=('086f1d52d8dfefe71e2f79c3bfd899886ded39a277bb5de78a7aa8f59222ad50'
            'c2285249255e7959d99d25d56fa2c97d18db19a4c5549560c1342e536c428821'
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
            'SKIP'
            'SKIP')

pkgver() {
  cd TheGondos-orbiter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd TheGondos-orbiter
  git submodule init
  git config submodule.Extern/imgui.url                 "${srcdir}/TheGondos-imgui"
  git config submodule.Addons/XRVessels.url             "${srcdir}/TheGondos-XRVessels"
  git config submodule.OVP/OGLClient/SOIL2.url          "${srcdir}/TheGondos-SOIL2"
  git config submodule.Addons/NASSP.url                 "${srcdir}/TheGondos-NASSP"
  git config submodule.Addons/G42-200.url               "${srcdir}/TheGondos-G42-200"
  git config submodule.Addons/UCSO.url                  "${srcdir}/TheGondos-UCSO"
  git config submodule.Addons/Deepstar.url              "${srcdir}/TheGondos-Deepstar"
  git config submodule.Extern/libnsbmp.url              "${srcdir}/TheGondos-libnsbmp"
  git config submodule.OVP/OGLClient/nanovg.url         "${srcdir}/TheGondos-nanovg"
  git config submodule.Extern/imgui-node-editor.url     "${srcdir}/TheGondos-imgui-node-editor"
  git config submodule.Extern/imgui-notify.url          "${srcdir}/TheGondos-imgui-notify"
  git config submodule.Extern/md4c.url                  "${srcdir}/TheGondos-md4c"
  git config submodule.Extern/imgui_md.url              "${srcdir}/TheGondos-imgui_md"
  git config submodule.Extern/SDL_GameControllerDB.url  "${srcdir}/TheGondos-SDL_GameControllerDB"
  git config submodule.Extern/imgui-knobs.url           "${srcdir}/TheGondos-imgui-knobs"
  git config submodule.Addons/Orb42S.url                "${srcdir}/TheGondos-Orb42S"
  git config submodule.Addons/SSRMS.url                 "${srcdir}/TheGondos-SSRMS"
  git -c protocol.file.allow=always submodule update

  cd Addons/Orb42S
  git submodule init
  git config submodule.plus42desktop.url                 "${srcdir}/TheGondos-plus42desktop"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${srcdir}

  [[ -d build ]] && rm -rf build

  cmake -B build -S TheGondos-orbiter -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package () {
  DESTDIR="$pkgdir" cmake --install build
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"

  ln -s "${pkgdir}/usr/Orbiter/Orbiter" 			"${pkgdir}/usr/bin/Orbiter"
  install -Dm644 "${srcdir}/Orbiter.desktop"			"${pkgdir}/usr/share/applications/Orbiter.desktop"
  install -Dm644 "${srcdir}/Orbiter_BasicLogo.png"		"${pkgdir}/usr/share/pixmaps/Orbiter_BasicLogo.png"
  install -D "${srcdir}/TheGondos-orbiter/LICENSE" -t   	"${pkgdir}/usr/share/licenses/${_pkgname}"
}
