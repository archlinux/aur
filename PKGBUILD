# Maintainer: kanya-approve

pkgname=waydroid-apple-music
# pkgver tracks the pinned Apple Music release, since that is the payload most
# likely to change. Bump pkgrel for image or helper changes.
pkgver=6.5.2
pkgrel=1

_amid=com.apple.android.music
_amver=6.5.2
_imgtag=20260106
_imgzip="lineage-20.0-${_imgtag}-UNOFFICIAL-waydroid_x86_64.zip"

pkgdesc="Waydroid Android 13 image and setup helper for Apple Music Lossless playback on Linux"
arch=('x86_64')
url="https://github.com/WayDroid-ATV/waydroid-builds"
# Apache-2.0 covers the LineageOS/AOSP image; the bundled Apple Music APK is
# proprietary and is fetched from upstream at build time, never redistributed.
license=('Apache-2.0' 'LicenseRef-proprietary')

# Runtime requirements - these stay installed.
depends=('waydroid')

# Build-time only. Removed afterwards by `makepkg -r` / `yay --removemake`.
#   apkeep  fetches the pinned Apple Music release from APKPure. This lives in
#           the AUR, not the official repos, so plain `makepkg -s` cannot
#           resolve it - install it first (`yay -S --asdeps apkeep-bin`) or
#           build through an AUR helper.
#   unzip   splits the XAPK bundle apkeep returns
#   python  reads the bundle manifest to verify id and version
# adb is deliberately absent: ro.adb.secure=1 forces adb offline, so the app is
# installed through `waydroid shell pm` instead.
makedepends=('apkeep' 'unzip' 'python')

# Never auto-installed; suggestions only.
optdepends=('pipewire-audio: sample-rate switching for bit-perfect output')

# Ships the same image payload, so only one can be installed.
provides=('waydroid-image')
conflicts=('waydroid-image' 'waydroid-image-gapps')

install="${pkgname}.install"
options=('!strip' '!debug')

source=("${_imgzip}::${url}/releases/download/${_imgtag}/${_imgzip}"
        'waydroid-am')
sha256sums=('617bbc43dde28e70f161d5543e095aba5df17c81f1a8ba091e95c077dd164a9b'
            'SKIP')

prepare() {
    # Apple Music is proprietary and cannot be shipped, so it is fetched from
    # upstream on the building machine. Pinned to _amver: the container image is
    # Android 13, and a newer app build is more likely to drift away from it.
    msg2 "Fetching ${_amid}@${_amver} via apkeep"
    rm -rf "${srcdir}/am"; install -dm755 "${srcdir}/am"

    if ! apkeep -a "${_amid}@${_amver}" -d apk-pure "${srcdir}/am"; then
        error "Could not fetch ${_amid}@${_amver}."
        error "List what APKPure currently offers with:"
        error "    apkeep -a ${_amid} -l"
        error "then set _amver in the PKGBUILD to an available version."
        return 1
    fi
}

build() {
    cd "${srcdir}/am"
    install -dm755 out

    local bundle
    bundle=$(find . -maxdepth 1 \( -name '*.xapk' -o -name '*.apkm' -o -name '*.apk' \) | head -1)
    [ -n "${bundle}" ] || { error "apkeep produced no APK"; return 1; }
    msg2 "Processing ${bundle##*/}"

    if [[ "${bundle}" == *.apk ]]; then
        install -m644 "${bundle}" out/base.apk
    else
        unzip -o -q "${bundle}" -d x
        # An x86_64 container needs the base, the native ABI split, and one density.
        local f
        for f in base.apk split_config.x86_64.apk split_config.xxhdpi.apk; do
            [ -f "x/${f}" ] && install -m644 "x/${f}" out/
        done
        [ -f out/base.apk ] || { error "bundle contained no base.apk"; return 1; }
        [ -f out/split_config.x86_64.apk ] || \
            warning "no x86_64 split in bundle - Apple Music may fail to start"

        # Verify we actually got Apple Music at the pinned version.
        if [ -f x/manifest.json ] || [ -f x/info.json ]; then
            python - "$(ls x/manifest.json x/info.json 2>/dev/null | head -1)" <<'PY'
import json, sys
d = json.load(open(sys.argv[1]))
pkg = d.get("package_name") or d.get("pname") or "?"
ver = d.get("version_name") or d.get("release_version") or "?"
print(f"    manifest: {pkg} {ver}")
if pkg not in ("?", "com.apple.android.music"):
    sys.exit(f"    unexpected package id: {pkg}")
PY
        fi
    fi
    msg2 "Packaged splits:"; ls -1 out/
}

package() {
    # `waydroid init` picks these up instead of downloading the stock build.
    install -Dm644 "${srcdir}/system.img" \
        "${pkgdir}/usr/share/waydroid-extra/images/system.img"
    install -Dm644 "${srcdir}/vendor.img" \
        "${pkgdir}/usr/share/waydroid-extra/images/vendor.img"

    # Drop the app straight into the container's /system/app. Waydroid mounts
    # this overlay over /system, and Android's PackageManager installs whatever
    # it finds there at boot - so no running container and no pm call is needed.
    # Shipping it here rather than staging it from a hook also means pacman owns
    # the files and removes them on uninstall.
    install -dm755 "${pkgdir}/var/lib/waydroid/overlay/system/app/AppleMusic"
    install -m644 "${srcdir}"/am/out/*.apk \
        -t "${pkgdir}/var/lib/waydroid/overlay/system/app/AppleMusic/"

    # Waydroid generates the launcher entry itself once Android registers the
    # app, so no .desktop file is shipped here.
    install -Dm755 "${srcdir}/waydroid-am" "${pkgdir}/usr/bin/waydroid-am"
}
