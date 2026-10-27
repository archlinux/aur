# Maintainer: zyk-miao <45023244+zyk-miao@users.noreply.github.com>
pkgname=uuway-git
pkgver=1.2.0.r123.gb692cf0
pkgrel=1
pkgdesc='NetEase UU Remote host bridge for KDE Wayland with native capture'
arch=('x86_64')
url='https://github.com/zyk-miao/UUWay'
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later' 'MIT')
depends=('nvidia-utils' 'lib32-nvidia-utils' 'vulkan-icd-loader' 'pipewire' 'gst-plugin-pipewire' 'gst-plugins-base-libs'
         'json-c' 'libx11' 'libxfixes' 'wayland' 'fcitx5' 'python' 'python-gobject' 'python-dbus'
         'libappindicator' 'xdg-desktop-portal-kde' 'kscreen' 'lib32-glibc'
         'lib32-freetype2' 'lib32-libpng' 'xorg-server-xvfb' 'xclip' 'gtk3'
         'libunwind' 'libxext' 'libpulse' 'alsa-lib' 'gnutls'
         'lib32-libx11' 'lib32-libxext' 'lib32-alsa-lib' 'lib32-libpulse'
         'lib32-glib2' 'lib32-systemd' 'lib32-gnutls')
optdepends=('sane: optional Wine scanner support'
            'libgphoto2: optional Wine camera support'
            'perl: optional Wine development utilities')
makedepends=('wine' 'cuda' 'git' 'gcc' 'mingw-w64-gcc' 'meson' 'ninja' 'glslang' 'vulkan-headers'
             'pkgconf' 'curl' 'ripgrep' 'binutils')
provides=('uuway')
conflicts=('uuway')
_wine_deb='wine-stable-amd64_11.0.0.0~noble-1_amd64.deb'
_wine_main='wine-stable_11.0.0.0~noble-1_amd64.deb'
_wine_i386='wine-stable-i386_11.0.0.0~noble-1_i386.deb'
source=('uuway::git+https://github.com/zyk-miao/UUWay.git'
        "${_wine_deb}::https://dl.winehq.org/wine-builds/ubuntu/pool/main/w/wine/${_wine_deb}"
        "${_wine_main}::https://dl.winehq.org/wine-builds/ubuntu/pool/main/w/wine/${_wine_main}"
        "${_wine_i386}::https://dl.winehq.org/wine-builds/ubuntu/pool/main/w/wine/${_wine_i386}"
        'dxvk::git+https://github.com/doitsujin/dxvk.git#commit=70d7508c01201ed3d4bfb33da42ba834eafe3857'
        'wine-source-11.0.tar.gz::https://codeload.github.com/wine-mirror/wine/tar.gz/db11d0fe6a169c457e23d007e20404643d067aa8'
        'nv-codec-headers::git+https://github.com/FFmpeg/nv-codec-headers.git#commit=e844e5b26f46bb77479f063029595293aa8f812d'
        'directx::git+https://github.com/Joshua-Ashton/mingw-directx-headers.git#commit=9df86f2341616ef1888ae59919feaa6d4fad693d'
        'spirv::git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=04f10f650d514df88b76d25e83db360142c7b174'
        'vulkan::git+https://github.com/KhronosGroup/Vulkan-Headers.git#commit=8864cdc896bbc2a9b6eb36b3218fc9ef57908d77'
        'dxbc-spirv::git+https://github.com/doitsujin/dxbc-spirv.git#commit=37a97745bddaf56d717253b0e4565904ce5eb06c'
        'display-info::git+https://github.com/doitsujin/libdisplay-info.git#commit=275e6459c7ab1ddd4b125f28d0440716e4888078'
        'spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=c8ad050fcb29e42a2f57d9f59e97488f465c436d'
        'dxvk-3.1.tar.gz::https://github.com/doitsujin/dxvk/releases/download/v3.1/dxvk-3.1.tar.gz')
sha256sums=('SKIP'
            '6cb835e2171b5572b17f1c06729735c2c7e40178239d7fa6c29ef14bd9b40d16'
            '04e7b4b995262c734019099d93277d8f219f7d180ebb65b5ccb3df7f97be1078'
            'b322b50f9e8bd59687840d9a7bad10d70b12ef9bdb873298e858ff93a6205e56'
            'SKIP' '18aaee150ad540885b9706ae73ccf6febca904049de2792199a9dc18a2772e6a'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            '30f9cc326874be344285582275446968cfa4c069db31ce56df312d6644179154')

pkgver() {
    cd "$srcdir/uuway"
    printf '1.2.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "$srcdir/wine"
    bsdtar -xOf "$srcdir/$_wine_deb" data.tar.zst | bsdtar -xf - -C "$srcdir/wine"
    bsdtar -xOf "$srcdir/$_wine_main" data.tar.zst | bsdtar -xf - -C "$srcdir/wine"
    bsdtar -xOf "$srcdir/$_wine_i386" data.tar.zst | bsdtar -xf - -C "$srcdir/wine"
    [[ -x "$srcdir/wine/opt/wine-stable/bin/winegcc" ]] || return 1
    [[ -f "$srcdir/wine/opt/wine-stable/lib/wine/i386-windows/kernel32.dll" ]] || return 1

    local tree="$srcdir/uuway"
    install -dm755 "$tree/build/dxvk-capture" "$tree/build/gpu-relay/downloads"
    cp -aT "$srcdir/dxvk" "$tree/build/dxvk-capture/source-v3.1"
    install -dm755 "$tree/build/gpu-relay/wine-review"
    bsdtar -xf "$srcdir/wine-source-11.0.tar.gz" -C "$tree/build/gpu-relay/wine-review" \
        --strip-components 1 wine-db11d0fe6a169c457e23d007e20404643d067aa8/include
    cp -aT "$srcdir/nv-codec-headers" "$tree/build/gpu-relay/nv-codec-headers"
    install -m644 "$srcdir/dxvk-3.1.tar.gz" "$tree/build/gpu-relay/downloads/dxvk-3.1.tar.gz"
    local dxvk="$tree/build/dxvk-capture/source-v3.1"
    git -C "$dxvk" submodule init
    local path repo
    for mapping in 'include/native/directx directx' 'include/spirv spirv' \
                   'include/vulkan vulkan' 'subprojects/dxbc-spirv dxbc-spirv' \
                   'subprojects/libdisplay-info display-info'; do
        read -r path repo <<< "$mapping"
        git -C "$dxvk" config "submodule.$path.url" "$srcdir/$repo"
    done
    git -C "$dxvk" -c protocol.file.allow=always submodule update --init --depth 1
    local dxbc="$dxvk/subprojects/dxbc-spirv"
    git -C "$dxbc" submodule init
    git -C "$dxbc" config submodule.submodules/spirv_headers.url "$srcdir/spirv-headers"
    git -C "$dxbc" -c protocol.file.allow=always submodule update --init --depth 1
}

build() {
    cd "$srcdir/uuway"
    UURB_WINE_BIN="$srcdir/wine/opt/wine-stable/bin" bash packaging/arch-build.sh
}

package() {
    cd "$srcdir/uuway"
    python packaging/stage-arch.py --legacy-build-layout "$pkgdir"
    install -dm755 "$pkgdir/opt/uuway"
    cp -a --no-preserve=ownership "$srcdir/wine/opt/wine-stable" "$pkgdir/opt/uuway/wine-11.0"
    install -Dm644 "$srcdir/wine/usr/share/doc/wine-stable/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/Wine-copyright"
}
