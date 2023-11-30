# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Note about this package: I am creating this package because the `godot-mono` maintainer does not base their PKGBUILD off of `godot`, leading to missing out on all of the changes that the godot in extra has. They have never commented in their 
_pkgname=godot-mono
pkgname=godot-mono-enhanced
pkgver=4.2
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine built properly"
arch=('x86_64')
url="https://godotengine.org/"
license=('MIT')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd libsquish
   libtheora libvorbis libwebp libwslay libxcursor libxi libxinerama libxrandr
   mbedtls2 miniupnpc pcre2 dotnet-sdk-bin hicolor-icon-theme)
makedepends=(alsa-lib gcc pulseaudio scons yasm xorg-server-xvfb nuget python git rsync gzip python)
optdepends=('pipewire-alsa: for audio support'
            'pipewire-pulse: for audio support')
provides=('godot-mono' 'godot-mono-bin')
conflicts=('godot-mono' 'godot-mono-bin')
source=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/godot-${pkgver}-stable.tar.xz")
sha512sums=('ec10126260e939e83dbadb32a3620e79f43249e3f99a1dcfe2ea7b28eaf866040046aea198d42596bac29da02c79a5a0ec0a5c39283b4535923b518530fb64f2')

prepare() {
  # Update the MIME info, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    "${srcdir}/godot-${pkgver}-stable"/misc/dist/linux/org.godotengine.Godot.xml
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

    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" bin/godot.linuxbsd.editor.x86_64.mono --generate-mono-glue modules/mono/glue

    # Build normal binaries
    modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd
}

package() {
    install -d \
        "${pkgdir}/opt/${_pkgname}/" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/applications/"

    rsync -a \
        "${srcdir}/godot-${pkgver}-stable/bin" "${pkgdir}/opt/${_pkgname}"

    cat > "${pkgdir}/usr/bin/${_pkgname}" <<-EOF
		#!/usr/bin/env sh
		/opt/godot-mono/bin/godot.linuxbsd.editor.x86_64.mono
	EOF
    sed -i 's/x86_64.mono/x86_64.mono "$@"/g' "${pkgdir}/usr/bin/${_pkgname}"
    
    chmod a+x "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/LICENSE.txt" \
	"${pkgdir}/usr/share/licenses/godot-mono-enhanced/LICENSE"

    [[ -f "${srcdir}/godot-${pkgver}-stable/misc/dist/linux/godot.6" ]] && gzip -9 "${srcdir}/godot-${pkgver}-stable/misc/dist/linux/godot.6"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/godot.6.gz" \
	"${pkgdir}/usr/share/man/man6/godot-mono-enhanced.6.gz"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.xml" \
	"${pkgdir}/usr/share/mime/packages/org.godotengine.Godot-mono-enhanced.xml"

    if cat "${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop" | grep mono;
    then
	:
    else
    sed -i 's/Exec=godot/Exec=godot-mono %f/g' "${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop"
    sed -i 's/Icon=godot/Icon=godot-mono/g' "${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop"
    sed -i 's/Name=Godot Engine/Name=Godot Engine Mono/g' "${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop"
    fi

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop"\
	"${pkgdir}/usr/share/applications/org.godotengine.Godot-mono-enhanced.desktop"

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
