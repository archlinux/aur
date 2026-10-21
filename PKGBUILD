# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Wicked IDE: repackages the official GitHub release tarball.
# Submit by pushing this and the generated .SRCINFO (makepkg --printsrcinfo > .SRCINFO) to
#   ssh://aur@aur.archlinux.org/wicked-ide-bin.git
pkgname=wicked-ide-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Code editor that runs AI models on your own machine"
arch=('x86_64')
url="https://github.com/codingncaffeine/Wicked-IDE"
license=('GPL-3.0-or-later')
provides=('wicked-ide')
conflicts=('wicked-ide')
# The publish is self-contained (.NET, ASP.NET Core, Skia and HarfBuzz are in the tarball). Avalonia draws through X11 or
# Wayland (libx11 + extensions, wayland + libxkbcommon) and EGL/OpenGL (libglvnd); icu = .NET globalization. The
# llama.cpp engines the app downloads need OpenMP (gcc-libs) and OpenSSL 3.
depends=('fontconfig' 'freetype2' 'libglvnd' 'libx11' 'libxi' 'libxcursor' 'libxext' 'libxrandr' 'libxrender'
         'libice' 'libsm' 'wayland' 'libxkbcommon' 'icu' 'zlib' 'gcc-libs' 'openssl')
optdepends=('vulkan-icd-loader: run models on the GPU through the Vulkan engine')
options=('!strip')   # a self-contained .NET bundle: stripping breaks it
source=("$url/releases/download/v$pkgver/WickedIDE-$pkgver-linux-x64.tar.gz")
sha256sums=('8b43b77fd0c85ed34140a5c859471c6d216a3282b2c328e394954ac647091728')
# The tarball unpacks flat ("./"); stage it in its own folder so package() copies the payload wholesale.
noextract=("WickedIDE-$pkgver-linux-x64.tar.gz")

prepare() {
    rm -rf "$srcdir/publish"
    mkdir -p "$srcdir/publish"
    bsdtar -xf "$srcdir/WickedIDE-$pkgver-linux-x64.tar.gz" -C "$srcdir/publish"
}

package() {
    local _lib="$pkgdir/usr/lib/wicked-ide" _id=io.github.codingncaffeine.WickedIDE
    install -dm755 "$_lib" "$pkgdir/usr/bin"

    # Copy the WHOLE publish output, never a list of names: the payload is three apphosts, ~250 managed assemblies, the
    # native libraries and the runtimeconfig/deps files, and a narrowed copy installs cleanly and fails at launch.
    cp -a "$srcdir/publish/." "$_lib/"
    rm -rf "$_lib/"{README.txt,LICENSE,share}

    local _dlls _f _bin _size
    _dlls=$(find "$_lib" -maxdepth 1 -name '*.dll' | wc -l)
    if (( _dlls < 150 )); then
        echo "==> ERROR: only $_dlls managed assemblies packaged." >&2
        return 1
    fi
    for _f in wicked wicked.dll wickedd wickedd.dll wicked-cli wicked-cli.dll Wicked.Core.dll Wicked.Editor.dll \
              Microsoft.AspNetCore.dll wicked.runtimeconfig.json wicked.deps.json libcoreclr.so libSkiaSharp.so; do
        if [[ ! -f "$_lib/$_f" ]]; then
            echo "==> ERROR: $_f is missing from the package payload." >&2
            return 1
        fi
    done

    for _bin in wicked wickedd wicked-cli; do
        printf '#!/bin/sh\nexec /usr/lib/wicked-ide/%s "$@"\n' "$_bin" > "$pkgdir/usr/bin/$_bin"
        chmod 755 "$pkgdir/usr/bin/$_bin"
    done

    for _size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "$srcdir/publish/share/wicked-$_size.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_id.png"
    done
    install -Dm644 "$srcdir/publish/share/$_id.desktop" "$pkgdir/usr/share/applications/$_id.desktop"
    install -Dm644 "$srcdir/publish/share/$_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_id.metainfo.xml"
    install -Dm644 "$srcdir/publish/README.txt" "$pkgdir/usr/share/doc/wicked-ide/README.txt"
    install -Dm644 "$srcdir/publish/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
