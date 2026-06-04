# Maintainer: Brian
pkgname=beatboss-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="BeatBoss Music Player - music streaming and download app (Flutter desktop)"
arch=('x86_64')
url="https://github.com/TheVolecitor/BeatBoss"
license=('LicenseRef-custom')
depends=('gtk3' 'mpv' 'webkit2gtk-4.1' 'libsecret')
makedepends=('patchelf')
provides=('beatboss')
conflicts=('beatboss')
# Prebuilt upstream binaries: don't strip (Dart AOT snapshot lives in libapp.so).
options=('!strip' '!debug')
_tag="Release_1.9"
source=("beatboss-${pkgver}.deb::${url}/releases/download/${_tag}/BeatBoss-${pkgver}-linux.deb")
noextract=("beatboss-${pkgver}.deb")
sha256sums=('1d57338fdc131887a96ef281d94a68af49929876e3e2bccae5eb17e46a6f1284')

package() {
    cd "$srcdir"
    ar x "beatboss-${pkgver}.deb" data.tar.zst

    # Unpack the .deb payload into a staging dir, then lay it out FHS-style.
    local _stage="$srcdir/stage"
    rm -rf "$_stage"; mkdir -p "$_stage"
    tar --use-compress-program=unzstd -xf data.tar.zst -C "$_stage"

    # App bundle -> /usr/lib/beatboss. Upstream ships it under /usr/share, which
    # is wrong for a tree of ELF executables; the binary locates its lib/ + data/
    # via $ORIGIN, so the whole bundle relocates as a unit.
    install -d "$pkgdir/usr/lib"
    cp -a "$_stage/usr/share/beatboss" "$pkgdir/usr/lib/beatboss"

    # Desktop entry + icons stay under /usr/share.
    install -d "$pkgdir/usr/share"
    cp -a "$_stage/usr/share/applications" "$pkgdir/usr/share/applications"
    cp -a "$_stage/usr/share/icons" "$pkgdir/usr/share/icons"

    # Scrub insecure build-host RUNPATHs (/home/runner/...) baked in by upstream
    # CI; repoint each affected plugin at its sibling libs.
    local _so
    for _so in "$pkgdir"/usr/lib/beatboss/lib/*.so; do
        if patchelf --print-rpath "$_so" 2>/dev/null | grep -q '/home/runner'; then
            patchelf --set-rpath '$ORIGIN' "$_so"
        fi
    done

    # Upstream's .desktop uses `Exec=beatboss`, so expose it on PATH.
    install -d "$pkgdir/usr/bin"
    ln -s /usr/lib/beatboss/beatboss "$pkgdir/usr/bin/beatboss"
}
