# Maintainer: Adopted by Khing
# This PKGBUILD file is modified from the hyprland package made by  Contributor: Skerse

# Former Maintainer info
# Maintainer: Neptune <neptune650@proton.me>
# Contributor: weitcis <weitcis at pm dot me>
# This PKGBUILD file is modified from
# the hyprland package made by
# Contributor: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="hyprland"
pkgname="${_pkgname}-legacyrenderer"
pkgver=0.40.0
pkgrel=1
pkgdesc='a highly customizable dynamic tiling Wayland compositor (legacy renderer)'
arch=(x86_64 aarch64)
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
             vulkan-headers
             xorgproto)
optdepends=('cmake: to build and install plugins using hyprpm'
            'cpio: to build and install plugins using hyprpm'
            'meson: to build and install plugins using hyprpm')
conflicts=("$_pkgname" "$_pkgname-git" "$pkgname-git")
provides=("$_pkgname")            
_archive="${_pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/releases/download/v$pkgver/source-v$pkgver.tar.gz"
        741ed28391f035658e2410934a88ea60e1c5cbe8.patch
        ec092bd601d9d351ff6ca34bd97f12055b2a4dd9.patch)
sha256sums=('0995fe7924a60e3d81428b3fa03ab15d8065958d6285443225afbafa31d29038'
            'd0719d5f1df0ed9b8cd92169aab4819457078c046e4253e752ff7ce5ad9e44d8'
            'a4ab9aad0aeba3aa1f806f5716b01745ef1ea24bae1349b1d2fe3ab29fee5e1c')

prepare() {
	ln -sf hyprland-source "$_archive"
	cd "$_archive"
	sed -i -e '/^release:/{n;s/-D/-DCMAKE_SKIP_RPATH=ON -D/}' Makefile

	patch -d subprojects/wlroots-hyprland/ -p1 -i "${srcdir}"/741ed28391f035658e2410934a88ea60e1c5cbe8.patch
	patch -p1 -i "${srcdir}"/ec092bd601d9d351ff6ca34bd97f12055b2a4dd9.patch
}

build() {
	cd "$_archive"
	make legacyrenderer
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
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/" assets/*.png
	install -Dm0644 -t "$pkgdir/usr/share/wayland-sessions/" "example/$_pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/" "example/$_pkgname.conf"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
        find subprojects/wlroots-hyprland/build -name 'libwlroots.so.*' -type f -execdir \
                install -Dm0755 -t "$pkgdir/usr/lib/" {} \;
}
