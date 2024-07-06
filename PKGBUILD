# Maintainer: Marvin Dalheimer <me@marvin-dalheimer.de>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=godot-mono
pkgname=godot-mono
pkgver=4.2.2
pkgrel=4
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine"
arch=('x86_64')
url="https://godotengine.org/"
license=('MIT')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd libsquish
   libtheora libvorbis libwebp libwslay libxcursor libxi libxinerama libxrandr
   mbedtls2 miniupnpc pcre2 dotnet-sdk hicolor-icon-theme)
makedepends=(alsa-lib gcc pulseaudio scons yasm nuget python git rsync python)
optdepends=('pipewire-alsa: for audio support'
            'pipewire-pulse: for audio support')
provides=('godot')
conflicts=('godot')
source=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/godot-${pkgver}-stable.tar.xz"
	"https://gitlab.archlinux.org/archlinux/packaging/packages/godot/-/raw/main/miniupnpc-2.2.8.patch")
sha512sums=('4a623063be5488957e1ede7e45b6865f6cd61bc954ac311587b9e97bed848a4083c4a7225d0a81bca285d854d33be9b07d7d0c21465c9f25b90e92b08090429c'
            '3f1450d184a3923a64f569b73ba1695dc0c49374d5c068154d13ee08453421687d45da71adadb802164a716ec7e61c1702658f014b78f2dfd006f5c773318090')

prepare() {
  # Update the MIME info, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    "${srcdir}/godot-${pkgver}-stable"/misc/dist/linux/org.godotengine.Godot.xml

  #Miniupnpc 2.2.8 patch from godot package
  cd "$srcdir/godot-${pkgver}-stable"
  patch -p1 < "$srcdir/miniupnpc-2.2.8.patch"
}



build() {
    cd "${srcdir}/godot-${pkgver}-stable"

    #Build temporary binaries to generate needed files for mono support
    export BUILD_NAME=arch_linux
  scons -j$(nproc) \
    CFLAGS="$CFLAGS -fPIC -Wl,-z,relro,-z,now -w -I/usr/include/mbedtls2" \
    CXXFLAGS="$CXXFLAGS -fPIC -Wl,-z,relro,-z,now -w -I/usr/include/mbedtls2" \
    LINKFLAGS="$LDFLAGS -L/usr/lib/mbedtls2" \
    arch=$CARCH \
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
    builtin_mbedtls=no \
    builtin_miniupnpc=no \
    builtin_pcre2=no \
    builtin_pcre2_with_jit=no \
    builtin_recastnavigation=yes \
    builtin_rvo2=yes \
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

    ln -s "/usr/lib/${_pkgname}/bin/godot.linuxbsd.editor.x86_64.mono" "${pkgdir}/usr/bin/godot"
    
    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/LICENSE.txt" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/godot.6" \
	"${pkgdir}/usr/share/man/man6/${pkgname}.6"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.xml" \
	"${pkgdir}/usr/share/mime/packages/org.godotengine.Godot.xml"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop"\
	"${pkgdir}/usr/share/applications/org.godotengine.Godot.desktop"

    mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes"
    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/misc/dist/document_icons/project.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/x-godot-project.svg"
    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/misc/dist/document_icons/resource.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/x-godot-resource.svg"
    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/misc/dist/document_icons/scene.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/x-godot-scene.svg"
    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/misc/dist/document_icons/shader.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/x-godot-shader.svg"
    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/misc/dist/document_icons/gdscript.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/x-gdscript.svg"
    
}
