# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Maintainer: moetayuko <loli at yuko dot moe>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: ThatOneCalculator <kainoa@t1c.dev>
# Contributor: Brenno Lemos <brenno@syndel.is>
# Contributor: Gabriel Fox <inbox@gabrielfox.dev>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: lilydjwg <lilydjwg@gmail.com>

_pkgname="hyprland"
pkgname="${_pkgname}-hidpi-xprop"
pkgver=0.41.0
pkgrel=1
pkgdesc='a highly customizable dynamic tiling Wayland compositor'
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/hyprwm/${_pkgname^}"
license=(BSD-3-Clause)
depends=(cairo # libcairo.so
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         glib2 libgobject-2.0.so
         glslang
         hyprcursor libhyprcursor.so
         hyprlang libhyprlang.so
         libdisplay-info libdisplay-info.so
         libdrm # libdrm.so
         libglvnd libEGL.so libGLESv2.so libOpenGL.so
         libinput # libinput.so
         libliftoff libliftoff.so
         libx11
         libxcb # libxcb-dri3.so libxcb-present.so libxcb-render.so libxcb-res.so libxcb-shm.so libxcb.so libxcb-xfixes.so libxcb-xinput.so
         libxcomposite # libxcb-composite.so
         libxfixes
         libxkbcommon libxkbcommon.so
         libxrender
         mesa # libgbm.so
         opengl-driver
         pango libpango-1.0.so libpangocairo-1.0.so
         pixman libpixman-1.so
         seatd libseat.so
         systemd-libs libsystemd.so
         tomlplusplus libtomlplusplus.so libudev.so
         vulkan-icd-loader
         vulkan-validation-layers
         wayland libwayland-client.so libwayland-server.so
         wayland-protocols
         xcb-proto
         xcb-util
         xcb-util-errors # libxcb-errors.so
         xcb-util-image
         xcb-util-keysyms
         xcb-util-renderutil # libxcb-render-util.so
         xcb-util-wm # libxcb-ewmh.so  libxcb-icccm.so
         xorg-xinput
         xorg-xwayland)
makedepends=(cmake
             gdb
             hyprwayland-scanner
             meson
             ninja
             patch
             vulkan-headers
             xorgproto)
optdepends=('cmake: to build and install plugins using hyprpm'
            'cpio: to build and install plugins using hyprpm'
            'meson: to build and install plugins using hyprpm')
_archive="${_pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/releases/download/v$pkgver/source-v$pkgver.tar.gz"
        https://patch-diff.githubusercontent.com/raw/hyprwm/Hyprland/pull/6446.diff)
sha256sums=('36c84bf0deeae01c73b9ed831c7716de3b33fa966a619d996a102cce1c6cdce1'
            'f174dc667a7a889e449a0cc9d3ca1c5f9c9bf9b37cdcda43c3985c93fad7ff16')
options=(debug)

prepare() {
	ln -sf hyprland-source "$_archive"
	cd "$_archive"
	sed -i -e '/^release:/{n;s/-D/-DCMAKE_SKIP_RPATH=ON -D/}' Makefile
	patch -Np1 -i "${srcdir}"/6446.diff
}

build() {
	cd "$_archive"
	make release
}

package() {
	cd "$_archive"
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
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/" assets/*.png
	install -Dm0644 -t "$pkgdir/usr/share/wayland-sessions/" "example/$_pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/" "example/$_pkgname.conf"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
        find subprojects/wlroots-hyprland/build -name 'libwlroots.so.*' -type f -execdir \
                install -Dm0755 -t "$pkgdir/usr/lib/" {} \;
}
