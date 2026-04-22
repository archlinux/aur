# Maintainer: Nova Bürky (me@novadragon.space)
pkgbase=godot-bin
pkgname=('godot-bin' 'godot-mono-bin')
pkgver=4.6.2
pkgrel=1
pkgdesc="Godot Engine - Prebuilt binary from GitHub"
arch=(x86_64)
url="https://godotengine.org"
license=(MIT)
makedepends=(setconf)
depends=(brotli ca-certificates embree freetype2 graphite libglvnd libspeechd libsquish libtheora libvorbis
         libwebp libwslay libxcursor libxi libxinerama libxrandr miniupnpc openxr pcre2)

_pkgver_url="4.6.2-stable"
_filename_std="Godot_v${_pkgver_url}_linux.x86_64.zip"
_filename_mono="Godot_v${_pkgver_url}_mono_linux_x86_64.zip"

source=("https://github.com/godotengine/godot-builds/releases/download/${_pkgver_url}/${_filename_std}"
        "https://github.com/godotengine/godot-builds/releases/download/${_pkgver_url}/${_filename_mono}"
        "godot.desktop"
        "godot.svg"
        "org.godotengine.Godot.xml")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            )
noextract=("${_filename_std}" "${_filename_mono}")

prepare(){


  cp -f godot.desktop godot-mono.desktop
  setconf godot-mono.desktop Exec godot-mono %f
  setconf godot-mono.desktop Icon godot-mono.svg
  setconf godot-mono.desktop Name 'Godot Engine Mono'

  # MIME info fix, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    org.godotengine.Godot.xml

  # Godot Mono MIME config
  cp -f org.godotengine.Godot.xml org.godotengine.Godot-mono.xml

}

package_godot-bin() {
    pkgdesc="Godot Engine - Prebuilt binary from GitHub"
    provides=("godot=${pkgver}")
    conflicts=('godot')


    install -dm755 "$pkgdir/opt/godot"
    bsdtar -xf "${_filename_std}" -C "$pkgdir/opt/godot"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/godot/Godot_v${_pkgver_url}_linux.x86_64" "$pkgdir/usr/bin/godot"

    install -Dm644 "$srcdir/godot.desktop" "$pkgdir/usr/share/applications/godot.desktop"
    install -Dm644 "$srcdir/godot.svg" "$pkgdir/usr/share/pixmaps/godot.svg"
    install -Dm644 "$srcdir/org.godotengine.Godot.xml" "$pkgdir/usr/share/mime/packages/org.godotengine.Godot.xml"

}

package_godot-mono-bin() {
    pkgdesc="Godot Engine (Mono) - Prebuilt binary from GitHub"
    provides=("godot-mono=${pkgver}")
    conflicts=('godot-mono')

    install -dm755 "$pkgdir/opt/godot-mono"

    bsdtar -xf "${_filename_mono}" -C "$pkgdir/opt/godot-mono"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/godot-mono/Godot_v${_pkgver_url}_mono_linux_x86_64/Godot_v${_pkgver_url}_mono_linux.x86_64" "$pkgdir/usr/bin/godot-mono"

    install -Dm644 "$srcdir/godot-mono.desktop" "$pkgdir/usr/share/applications/godot-mono.desktop"
    install -Dm644 "$srcdir/godot.svg" "$pkgdir/usr/share/pixmaps/godot-mono.svg"
    install -Dm644 "$srcdir/org.godotengine.Godot-mono.xml" "$pkgdir/usr/share/mime/packages/org.godotengine.Godot-mono.xml"

}
