# Maintainer: Marvin Dalheimer <me@marvin-dalheimer.de>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=godot-mono
pkgname=godot-mono
pkgver=4.3
pkgrel=3
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine"
arch=('x86_64')
url="https://godotengine.org/"
license=('MIT')
depends=(brotli ca-certificates embree freetype2 graphite harfbuzz harfbuzz-icu libglvnd
   libspeechd libsquish libtheora libvorbis libwebp libwslay libxcursor libxi libxinerama 
   libxrandr openxr miniupnpc pcre2 dotnet-sdk hicolor-icon-theme
   libogg libpng zlib glibc zstd)
makedepends=(alsa-lib gcc pulse-native-provider scons yasm nuget python git rsync python)
optdepends=('pipewire-alsa: for audio support'
            'pipewire-pulse: for audio support')
source=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/godot-${pkgver}-stable.tar.xz")
sha512sums=('6e1eaba5c3447527ce60d623f7f81cbd90633a5a1ad4c6dd469055a43c8fb9b4807fcd3bae25331294596c2418eb6c0c9db0871c3e1405ddcc7d84e29c39a45b')

prepare() {
  # Update the MIME info, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    "${srcdir}/godot-${pkgver}-stable"/misc/dist/linux/org.godotengine.Godot.xml
  # Patch miniupnpc
  sed -i 's/addr, 16/addr, 16, nullptr, 0/g' "$srcdir"/godot-$pkgver-stable/modules/upnp/upnp.cpp
}



build() {
    cd "${srcdir}/godot-${pkgver}-stable"

    #Build temporary binaries to generate needed files for mono support
    # Miniupnpc disabled since 4.3 due to compiler error
    # mbedtls disabled due to `godot` issue #3
    export BUILD_NAME=arch_linux
  scons -j$(nproc) \
    cflags="$CFLAGS -fPIC -Wl,-z,relro,-z,now -w" \
    cxxflags="$CXXFLAGS -fPIC -Wl,-z,relro,-z,now -w" \
    linkflags="$LDFLAGS" \
    arch=$CARCH \
    builtin_brotli=no \
    builtin_certs=no \
    builtin_clipper2=yes \
    builtin_embree=no \
    builtin_enet=yes \
    builtin_freetype=no \
    builtin_msdfgen=yes \
    builtin_glslang=yes \
    builtin_graphite=no \
    builtin_harfbuzz=no \
    builtin_icu4c=yes \
    builtin_libogg=no \
    builtin_libpng=no \
    builtin_libtheora=no \
    builtin_libvorbis=no \
    builtin_libwebp=no \
    builtin_wslay=yes \
    builtin_mbedtls=yes \
    builtin_miniupnpc=no \
    builtin_openxr=no \
    builtin_pcre2=no \
    builtin_pcre2_with_jit=no \
    builtin_recastnavigation=yes \
    builtin_rvo2_2d=yes \
    builtin_rvo2_3d=yes \
    builtin_squish=no \
    builtin_xatlas=yes \
    builtin_zlib=no \
    builtin_zstd=no \
    colored=yes \
    platform=linuxbsd \
    production=yes \
    pulseaudio=yes \
    system_certs_path=/etc/ssl/certs/ca-certificates.crt \
    target=editor \
    use_llvm=no \
    werror=no \
    module_mono_enabled=yes \
    mono_glue=no

    bin/godot.linuxbsd.editor.x86_64.mono --headless --generate-mono-glue modules/mono/glue

    # Build normal binaries
    modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd
}

package() {
    install -d \
        "${pkgdir}/usr/lib/${_pkgname}/" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/applications/"

    rsync -a \
        "${srcdir}/godot-${pkgver}-stable/bin" "${pkgdir}/usr/lib/${_pkgname}"

    ln -s "/usr/lib/${_pkgname}/bin/godot.linuxbsd.editor.x86_64.mono" "${pkgdir}/usr/bin/godot-mono"
    
    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/LICENSE.txt" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/godot.6" \
	"${pkgdir}/usr/share/man/man6/${pkgname}.6"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop"\
	"${pkgdir}/usr/share/applications/org.godotengine.Godot-mono.desktop"

    sed -i "s/Exec=godot/Exec=godot-mono/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono.desktop"
    sed -i "s/Icon=godot/Icon=godot-mono/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono.desktop"
    sed -i "s/Name=Godot Engine/Name=Godot Engine Mono/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono.desktop"
}
