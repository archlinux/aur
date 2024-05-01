# Maintainer: Adopted by Khing

# Former Maintainer info
# Maintainer: Neptune <neptune650@proton.me>
# Contributor: weitcis <weitcis at pm dot me>
# This PKGBUILD file is modified from
# the hyprland package made by
# Contributor: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="hyprland"
pkgname="${_pkgname}-legacyrenderer-git"
pkgver=0.39.1.r119.4ed6b69b
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks.(upstream hyprland legacy-renderer)"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/Hyprland"
license=(BSD)
depends=(
  cairo
  cpio
  gcc-libs
  glib2
  glibc
  glslang
  hyprlang
  hyprcursor
  hyprwayland-scanner
  libdisplay-info
  libdrm
  libglvnd
  libinput
  libliftoff
  libx11
  libxcb
  libxcomposite
  libxfixes
  libxkbcommon
  libxrender
  opengl-driver
  pango
  pixman
  polkit
  seatd
  systemd-libs
  tomlplusplus
  wayland
  wayland-protocols
  xcb-proto
  xcb-util
  xcb-util-errors
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
  xorg-xinput
  xorg-xwayland
)
depends+=(libdisplay-info.so)
makedepends=(
  cmake
  gdb
  git
  jq
  meson
  ninja
  pkgconf
  xorgproto
)
provides=("hyprland=${pkgver%%.r*}")
conflicts=(hyprland)
source=(
  "git+https://github.com/hyprwm/Hyprland.git"
  "git+https://github.com/hyprwm/wlroots-hyprland.git"
  "git+https://github.com/hyprwm/hyprland-protocols.git"
  "git+https://github.com/canihavesomecoffee/udis86.git"
  "git+https://github.com/wolfpld/tracy.git"
)
b2sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pick_mr() {
  git pull origin pull/$1/head --no-edit
}

prepare() {
  cd Hyprland
  git submodule init
  git config submodule.subprojects/wlroots-hyprland.url "$srcdir/wlroots-hyprland"
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
  git config submodule.subprojects/udis86.url "$srcdir/udis86"
  git config submodule.subprojects/tracy.url "$srcdir/tracy"
  git -c protocol.file.allow=always submodule update

  if [[ -z "$(git config --get user.name)" ]]; then
    git config user.name local && git config user.email '<>' && git config commit.gpgsign false
  fi
  # Pick pull requests from github using `pick_mr <pull request number>`.

  git -C subprojects/wlroots-hyprland reset --hard
  sed -E -i -e "s/(soversion = .*$)/soversion = 13032/g" subprojects/wlroots-hyprland/meson.build
}

pkgver() {
  git -C Hyprland describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}


build() {
	cd ./Hyprland
	make legacyrenderer
}

package() {
	cd ./Hyprland
	find src \( -name '*.h' -o -name '*.hpp' \) -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/{}" \;
	pushd subprojects/wlroots-hyprland/include
	find . -name '*.h' -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/wlroots-hyprland/{}" \;
	popd
	pushd subprojects/wlroots-hyprland/build/include
	find . -name '*.h' -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/wlroots-hyprland/{}" \;
	popd
	mkdir -p "$pkgdir/usr/include/hyprland/protocols"
	cp protocols/*-protocol.h "$pkgdir/usr/include/hyprland/protocols"
	pushd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	popd
	install -Dm0644 -t "$pkgdir/usr/share/pkgconfig" build/hyprland.pc
	install -Dm0644 -t "$pkgdir/usr/share/man/man1" docs/{Hyprland,hyprctl}.1
	for cmd in hyprctl hyprpm; do
		install -Dm0644 "$cmd/$cmd.bash" "$pkgdir/usr/share/bash-completion/completions/$cmd"
		install -Dm0644 "$cmd/$cmd.zsh" "$pkgdir/usr/share/zsh/site-functions/_$cmd"
		install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "$cmd/$cmd.fish"
	done
	install -Dm0755 -t "$pkgdir/usr/bin/" build/Hyprland build/hyprctl/hyprctl build/hyprpm/hyprpm
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/" assets/*.png
	install -Dm0644 -t "$pkgdir/usr/share/wayland-sessions/" "example/$_pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/" "example/$_pkgname.conf"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
        find subprojects/wlroots-hyprland/build -name 'libwlroots.so.*' -type f -execdir \
                install -Dm0755 -t "$pkgdir/usr/lib/" {} \;
}
