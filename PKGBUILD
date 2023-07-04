# Maintainer: Mr.Smith1974
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>

pkgname=orbiter2016-git
pkgver=r559.a2dc3556
pkgrel=1
pkgdesc="Orbiter Space Flight Simulator"
arch=(x86_64)
url="http://orbit.medphys.ucl.ac.uk/index.html"
license=(MIT)
depends=()
makedepends=(git cmake glfw-x11 openal libsndfile glm texlive-latex)
provides=()
conflicts=()
source=("TheGondos-orbiter::git+https://github.com/TheGondos/orbiter.git#branch=linux"
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
  cmake -B build -S TheGondos-orbiter -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  #can't find Orbitersdk.h at the first run
  cmake --build build || true
  cmake --build build
}

package () {
  DESTDIR="$pkgdir" cmake --install build
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
