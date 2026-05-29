# Maintainer: fecet <xiezej@gmail.com>
pkgname=asus-proart-px13-quirks
pkgver=0.20260529
pkgrel=1
pkgdesc="Hardware quirks for ASUS ProArt PX13 (HN7306EA): TAS2783 audio DKMS + UCM configs + MT7925 btusb autosuspend disable"
arch=('any')
url="https://aur.archlinux.org/packages/asus-proart-px13-quirks"
license=('CC0-1.0' 'GPL-2.0-only')
# No kernel dependency: the audio codec patches ship as DKMS modules that build
# against whatever kernel headers are installed, so this rides a stock kernel.
depends=('dkms' 'alsa-ucm-conf' 'pipewire' 'wireplumber' 'linux-firmware-other>=1:20260519')
# Build-time only (none are runtime deps): patchutils (filterdiff in prepare),
# linux-cachyos-headers (the stock kernel we compile-check against), and the
# clang/lld/llvm toolchain the cachyos kernel is built with (LLVM=1 modules).
makedepends=('patchutils' 'linux-cachyos-headers' 'clang' 'lld' 'llvm')
optdepends=(
    'sof-firmware: SOF firmware for AMD ACP'
    'alsa-utils: alsactl store to persist channel assignments'
    'bluez: enables the BT stack the btusb quirk applies to'
)
# The DKMS modules override these in-tree .ko via /usr/lib/modules/$KVER/updates/.
provides=('snd-soc-tas2783-sdw' 'snd-soc-rt721-sdca' 'soundwire-amd' 'snd-soc-sdw-utils')
replaces=('px13-audio-fix' 'px13-quirks' 'proart-px13' 'px13-audio-dkms')
conflicts=('px13-audio-fix' 'px13-quirks' 'proart-px13' 'px13-audio-dkms')
install=${pkgname}.install

# px13-audio-dkms.tar.gz bundles the DKMS skeleton (raw cachyos 7.0.10-2 kernel
# source for the 4 modules, GPL-2.0, + the Kbuild tree + dkms.conf). nealstar's
# 16 codec patches (CachyOS issue 737) stay as flat files so they remain
# reviewable. AUR repos must be flat (no subdirs), hence the source tree is a
# tarball rather than committed subdirectories. Re-roll the tarball only if a
# future kernel breaks compilation (re-vendor + re-verify the patch series).
source=(
    'codecs_tas2783_init.conf'
    'sof-soundwire_tas2783.conf'
    'sof-soundwire_acp-dmic.conf'
    'conf.d_amd-soundwire_ASUSTeK-ProArtPX13.conf'
    '51-amd-sdw-channels.conf'
    '99-echo-cancel.conf'
    'btusb-no-autosuspend.conf'
    'rt721-sdw-no-autosuspend.rules'
    'px13-audio-dkms.tar.gz'
    0001-ALSA-tas2783-sdw-add-Playback-to-volume-control.patch
    0002-Names-to-match-snd_soc_dai_driver-playback-capturest.patch
    0003-removed-unused-fields.patch
    0004-SOC_SINGLE_RANGE_TLV-uses-snd_soc_get_volsw-snd_soc_.patch
    0005-dev_set_drvdata-already-called-intas_sdw_probe.patch
    0006-refactor-setting-sa_func_data.patch
    0007-check-AF01-for-init-data.patch
    0008-setup-ports.patch
    0009-Already-set-by-SOC_SINGLE_RANGE_TLV-Speaker-Playback.patch
    0010-control-to-set-channel.patch
    0011-mute-unmute-using-SND_SOC_DAPM_SWITCH.patch
    0012-use-SND_SOC_DAPM_REG-to-power-on-off.patch
    0013-reattach-after-resume.patch
    0015-to-help-alsa-find-them.patch
    0016-cleanup-controls.patch
    0017-ASoC-rt721-sdca-enable-jack-detect-irq-on-AMD-ACP70.patch
)
sha256sums=('8704e2350ece61e4fbfc6fab0e1555e9dadc4e50509f727c704cae137de7e372'
            '06feb24e7a3a5a5f59da7e0e1ed02c76b1b48e83a6942433ba232ae6c2dca138'
            'bbbc4eafdbdacfc9af5b58922bb21118da59c88320dae037925ceed5ebfa02ed'
            '9ae059bbaffdc4adf1ffb728d54b099adaded7ea6d9cb8eb224fbe5c3c4fb029'
            'a426f056bb4fc3169fe68e8c08172379899e7f03edeb5199b5e7d6c06444444d'
            '2a68adee036530d1fa9e59fba0268d414c31f7c5d4b2ea1e93a11ceb469f4642'
            '289f0457bebb51a1a6e2f6a555ebea829b484be837361afc71f7a81fee1e323c'
            'aa36adef4d19feb795c68324276896bc710767b80820957d76f75911d151e755'
            'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

_dkms_name=px13-audio

prepare() {
    # px13-audio-dkms.tar.gz extracts to $srcdir/px13-audio-dkms/ (skeleton:
    # raw source + Kbuild tree + dkms.conf). Assemble the build tree from it.
    local tree="$srcdir/dkms-tree"
    rm -rf "$tree"
    cp -a "$srcdir/px13-audio-dkms" "$tree"
    sed -i "s|@PKGVER@|${pkgver}|" "$tree/dkms.conf"

    # Apply nealstar's patches in numeric order (they form a dependent chain).
    # 0009 also drops a declaration in include/sound/soc_sdw_utils.h, which a
    # DKMS module cannot patch; the symbol has no out-of-tree callers, so filter
    # that hunk and leave the in-kernel header alone.
    pushd "$tree" >/dev/null
    local p
    for p in "$srcdir"/0*.patch; do
        case "$(basename "$p")" in
            0009-*)
                msg2 "applying $(basename "$p") (header hunk filtered)"
                filterdiff -x '*/soc_sdw_utils.h' "$p" | patch -p1 ;;
            *)
                msg2 "applying $(basename "$p")"
                patch -p1 < "$p" ;;
        esac
    done
    popd >/dev/null
}

build() {
    # Compile-check the modules so a build that does not compile against the
    # target kernel fails makepkg here (no package is produced) rather than
    # silently installing and only erroring at dkms-build time. Compiles a
    # throwaway copy; package() ships the pristine source tree.
    local kdir="/usr/lib/modules/$(uname -r)/build"
    if [[ ! -d $kdir ]]; then
        # Off-target build (e.g. chroot): fall back to the stock kernel headers.
        kdir=$(dirname "$(pacman -Qql linux-cachyos-headers | grep -m1 '/build/Makefile$')")
    fi
    [[ -d $kdir ]] || { error "no kernel headers found to compile-check the DKMS modules"; return 1; }

    # CachyOS kernels are clang/LLVM-built; match that or gcc rejects the
    # kernel's clang-only cflags (this is what dkms passes at install time too).
    local llvm=()
    if grep -q '^CONFIG_CC_IS_CLANG=y' "$kdir/.config" 2>/dev/null; then
        llvm=(LLVM=1)
    fi

    msg2 "compile-checking px13-audio modules against ${kdir} ${llvm[*]}"
    cp -a "$srcdir/dkms-tree" "$srcdir/build-check"
    make -C "$kdir" M="$srcdir/build-check" "${llvm[@]}" modules
}

package() {
    # --- Audio codec DKMS modules (built per-kernel at install time) ---
    install -d "${pkgdir}/usr/src/${_dkms_name}-${pkgver}"
    cp -a "$srcdir/dkms-tree/." "${pkgdir}/usr/src/${_dkms_name}-${pkgver}/"

    # tas2783 firmware ships in linux-firmware-other >= 1:20260519 at
    # ti/audio/tas2783/1714-1-0x{8,B}.bin.zst (Arch zst-compresses). The
    # kernel requests the flat names 1714-1-{8,B}.bin
    # (tas_generate_fw_name: "%04X-%1X-%1X.bin") and falls back to the
    # .zst variant transparently, so symlink both ends as .zst.
    install -d "${pkgdir}/usr/lib/firmware"
    ln -s ti/audio/tas2783/1714-1-0x8.bin.zst "${pkgdir}/usr/lib/firmware/1714-1-8.bin.zst"
    ln -s ti/audio/tas2783/1714-1-0xB.bin.zst "${pkgdir}/usr/lib/firmware/1714-1-B.bin.zst"

    # ALSA UCM device files (new files in alsa-ucm-conf namespace, no conflict)
    install -Dm644 "${srcdir}/codecs_tas2783_init.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/codecs/tas2783/init.conf"
    install -Dm644 "${srcdir}/sof-soundwire_tas2783.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/sof-soundwire/tas2783.conf"
    install -Dm644 "${srcdir}/sof-soundwire_acp-dmic.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/sof-soundwire/acp-dmic.conf"

    # UCM card-longname override: inlines the upstream amd-soundwire trampoline +
    # tas2783 spk_init + AMD ACP70 DMIC redirect (device 4), via alsa-ucm-conf's
    # confd1 lookup. Beats the driver-default trampoline only for our card;
    # pacman -Qkk stays clean.
    install -Dm644 "${srcdir}/conf.d_amd-soundwire_ASUSTeK-ProArtPX13.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/conf.d/amd-soundwire/ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC.conf"

    # PipeWire & WirePlumber vendor drop-ins
    install -Dm644 "${srcdir}/99-echo-cancel.conf" \
        "${pkgdir}/usr/share/pipewire/pipewire.conf.d/99-echo-cancel.conf"
    install -Dm644 "${srcdir}/51-amd-sdw-channels.conf" \
        "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d/51-amd-sdw-channels.conf"

    # MT7925 btusb autosuspend quirk (vendor modprobe.d slot)
    install -Dm644 "${srcdir}/btusb-no-autosuspend.conf" \
        "${pkgdir}/usr/lib/modprobe.d/btusb-no-autosuspend.conf"
    install -Dm644 "${srcdir}/rt721-sdw-no-autosuspend.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-rt721-sdw-no-autosuspend.rules"
}
