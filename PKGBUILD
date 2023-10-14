# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: tas <tasgon_@out/look.com>
# Contributor: QuantMint <qua/ntmint@/protonm/ail.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

_pkgname=godot-mono
pkgname=godot-mono-git
pkgver=4.1.r2708.g51f81e1
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine built properly"
arch=(x86_64 i686)
url="https://godotengine.org/"
license=(MIT)
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd libsquish
   libtheora libvorbis libwebp libwslay libxcursor libxi libxinerama libxrandr
   mbedtls2 miniupnpc pcre2 dotnet-sdk hicolor-icon-theme)
makedepends=(alsa-lib gcc pulseaudio scons yasm xorg-server-xvfb nuget python git rsync gzip python)
provides=(godot-mono)
conflicts=(godot-mono)
source=("git+https://github.com/godotengine/godot.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/godot"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/.stable//'
}

prepare() {
  # Update the MIME info, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    "${srcdir}/godot"/misc/dist/linux/org.godotengine.Godot.xml
}

build() {
    cd "${srcdir}/godot"

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
        "${srcdir}/godot/bin" "${pkgdir}/opt/${_pkgname}"

    cat > "${pkgdir}/usr/bin/${_pkgname}" <<-EOF
		#!/usr/bin/env sh
		/opt/godot-mono/bin/godot.linuxbsd.editor.x86_64.mono
	EOF
    sed -i 's/x86_64.mono/x86_64.mono "$@"/g' "${pkgdir}/usr/bin/${_pkgname}"
    
    chmod a+x "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 \
        "${srcdir}/godot/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    install -Dm644 \
	"${srcdir}/godot/LICENSE.txt" \
	"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    [[ -f "${srcdir}/godot/misc/dist/linux/godot.6" ]] && gzip -9 "${srcdir}/godot/misc/dist/linux/godot.6"

    install -Dm644 \
	"${srcdir}/godot/misc/dist/linux/godot.6.gz" \
	"${pkgdir}/usr/share/man/man6/${_pkgname}.6.gz"

    install -Dm644 \
	"${srcdir}/godot/misc/dist/linux/org.godotengine.Godot.xml" \
	"${pkgdir}/usr/share/mime/packages/org.godotengine.Godot-mono-git.xml"

    if cat "${srcdir}/godot/misc/dist/linux/org.godotengine.Godot.desktop" | grep mono;
    then
	:
    else
    sed -i 's/Exec=godot/Exec=godot-mono/g' "${srcdir}/godot/misc/dist/linux/org.godotengine.Godot.desktop"
    sed -i 's/Icon=godot/Icon=godot-mono/g' "${srcdir}/godot/misc/dist/linux/org.godotengine.Godot.desktop"
    sed -i 's/Name=Godot Engine/Name=Godot Engine Mono/g' "${srcdir}/godot/misc/dist/linux/org.godotengine.Godot.desktop"
    fi

    install -Dm644 \
	"${srcdir}/godot/misc/dist/linux/org.godotengine.Godot.desktop"\
	"${pkgdir}/usr/share/applications/org.godotengine.Godot-mono-git.desktop"

}
