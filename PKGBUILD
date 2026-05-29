# Maintainer: fecet <xiezej@gmail.com>
pkgname=asus-proart-px13-quirks
# pkgver IS the mainline kernel version the codec module source is pinned to.
# The 4 modules are in-tree mainline drivers; nealstar's patches (CachyOS issue
# 737) are diffs against that source. DKMS rebuilds them for whatever kernel is
# installed. Bump pkgver (re-pin + re-verify the patch series) when moving to a
# newer kernel; bump pkgrel for packaging-only changes (UCM, btusb, patches).
_kver=7.0.10
pkgver=${_kver}
pkgrel=2
pkgdesc="Hardware quirks for ASUS ProArt PX13 (HN7306EA): TAS2783 audio DKMS + UCM configs + MT7925 btusb autosuspend disable"
arch=('any')
url="https://aur.archlinux.org/packages/asus-proart-px13-quirks"
license=('CC0-1.0' 'GPL-2.0-only')
# No kernel dependency: the audio codec patches build as DKMS modules against
# whatever kernel headers are installed. Works on any distro kernel near $_kver.
depends=('dkms' 'alsa-ucm-conf' 'pipewire' 'wireplumber' 'linux-firmware-other>=1:20260519')
makedepends=('patchutils')
optdepends=(
    'sof-firmware: SOF firmware for AMD ACP'
    'alsa-utils: alsactl store to persist channel assignments'
    'bluez: enables the BT stack the btusb quirk applies to'
)
# The DKMS modules override these in-tree .ko via /usr/lib/modules/$KVER/updates/.
provides=('snd-soc-tas2783-sdw' 'snd-soc-rt721-sdca' 'soundwire-amd' 'snd-soc-sdw-utils')
install=${pkgname}.install

_dkms_name=px13-audio

# Source closure for the 4 modules: every .c that composes them + the private
# headers they #include via "" (not shipped in kernel-headers). Fetched per-file
# from the mainline-stable tree at v$_kver -- the canonical upstream of these
# files (verified byte-identical to what distro kernels ship).
_src_files=(
    sound/soc/codecs/tas2783-sdw.c
    sound/soc/codecs/tas2783.h
    sound/soc/codecs/rt721-sdca.c
    sound/soc/codecs/rt721-sdca.h
    sound/soc/codecs/rt721-sdca-sdw.c
    sound/soc/codecs/rt721-sdca-sdw.h
    sound/soc/codecs/rt-sdw-common.h
    sound/soc/codecs/rt1308.h
    sound/soc/sdw_utils/soc_sdw_utils.c
    sound/soc/sdw_utils/soc_sdw_dmic.c
    sound/soc/sdw_utils/soc_sdw_rt_dmic.c
    sound/soc/sdw_utils/soc_sdw_rt700.c
    sound/soc/sdw_utils/soc_sdw_rt711.c
    sound/soc/sdw_utils/soc_sdw_rt5682.c
    sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
    sound/soc/sdw_utils/soc_sdw_rt_amp.c
    sound/soc/sdw_utils/soc_sdw_rt_amp_coeff_tables.h
    sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
    sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
    sound/soc/sdw_utils/soc_sdw_cs42l42.c
    sound/soc/sdw_utils/soc_sdw_cs42l43.c
    sound/soc/sdw_utils/soc_sdw_cs42l45.c
    sound/soc/sdw_utils/soc_sdw_cs_amp.c
    sound/soc/sdw_utils/soc_sdw_maxim.c
    sound/soc/sdw_utils/soc_sdw_ti_amp.c
    drivers/soundwire/amd_init.c
    drivers/soundwire/amd_init.h
    drivers/soundwire/amd_manager.c
    drivers/soundwire/amd_manager.h
    drivers/soundwire/bus.h
)
_ksrc="https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain"

source=(
    'codecs_tas2783_init.conf'
    'sof-soundwire_tas2783.conf'
    'sof-soundwire_acp-dmic.conf'
    'conf.d_amd-soundwire_ASUSTeK-ProArtPX13.conf'
    '51-amd-sdw-channels.conf'
    '99-echo-cancel.conf'
    'btusb-no-autosuspend.conf'
    'rt721-sdw-no-autosuspend.rules'
    'dkms.conf'
    'Kbuild.top'
    'Kbuild.codecs'
    'Kbuild.sdw_utils'
    'Kbuild.soundwire'
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
# Per-file mainline source, saved under each file's basename (all unique).
for _f in "${_src_files[@]}"; do
    source+=("${_f##*/}::${_ksrc}/${_f}?h=v${_kver}")
done

# Fill in with updpkgsums; kept SKIP-free so the mainline fetch is verified.
sha256sums=('8704e2350ece61e4fbfc6fab0e1555e9dadc4e50509f727c704cae137de7e372'
            '06feb24e7a3a5a5f59da7e0e1ed02c76b1b48e83a6942433ba232ae6c2dca138'
            'bbbc4eafdbdacfc9af5b58922bb21118da59c88320dae037925ceed5ebfa02ed'
            '9ae059bbaffdc4adf1ffb728d54b099adaded7ea6d9cb8eb224fbe5c3c4fb029'
            'a426f056bb4fc3169fe68e8c08172379899e7f03edeb5199b5e7d6c06444444d'
            '2a68adee036530d1fa9e59fba0268d414c31f7c5d4b2ea1e93a11ceb469f4642'
            '289f0457bebb51a1a6e2f6a555ebea829b484be837361afc71f7a81fee1e323c'
            'aa36adef4d19feb795c68324276896bc710767b80820957d76f75911d151e755'
            'e1b51041a7ea3069d87bda7dcf6a506c73344d2557e9455b0ab09ecfe03b69c6'
            'febed13c901ac3988da80936c7b9989bf459b304a52c5c41d982b667303eae48'
            '21c636861268b217f52ed934895d84f14e2f3b162fc10a8bb16651973d46f378'
            '53c47ede0d2329e891e4cb0683436df5f084960df7db7f8f4fdeccedd5d9c859'
            'd886e66f683aedb28d05a771d5bfe67b08224cae360c3c83cdc6bf9771dc1cc4'
            'b7cc6a705c783c0dee1d59d0c4755b5852b2aa7978187590523005db23c686d6'
            'e2a9154ab6dd3b8b8516cd05e61d0a7849954eeaf0130ff133808519c634215f'
            '9ddb312a48561a6ae6d4e410c53672d5f64420e29b1121862b40f6be04a6e0b7'
            '8bb18803760400dd8932c66d976070302bf80de77ae0c18ac1a675b8dfbb3800'
            '9348569f3998763e354e74e56a517b73c1406135eb3317af48eedf70f6d74ec9'
            '786d7646adaed114a951b291b9f63e6816383df891689df913cfa55b7516ec8d'
            'c1fe0dd57de5803535daec0bd12eac129fd08a0183b4e8368e2f0605e11afd0b'
            '0bf19dc030dda37945c4fe5b719f43698a84ac26bef8555db23e90d2f01a0d3b'
            'd11a7fd2ab27f89d77a27be7d7b1b324cde5b4239790bc6b80f06b9884daf946'
            '20ea5a188aa5c5058d6f42c9f083bac88bd80294eefcb40f87c3db341863d65c'
            '1339df9c2250f36b6d51c760ac6e29df39aca85320ef92e2055848c007e603ec'
            '5f51cdcca2efac77057f26f0a34d33805d943db97cfdc7b1ae7726457ad9f2ae'
            '74b1e37055321b7ff878f842a73669da3b6ca245c98c1329a08f88e753f10e16'
            '929ff4b238982b98a7d79473efba2403887353ef89b68c327795090b504b04a1'
            'be215990daff3959349f84c859699f65d9cdacfb3eba9ed4d2392faf6ce29a41'
            '3df85635993af6fd76dc18fa28b53723bc22eb6bb42836d84e3a962d7825b6e3'
            'e6b9405525ebbec06ea27544a0cfd871020ff0952a6df25a2cc851d31822766e'
            '0804ef869734742872008653fdc4a1c2b0eab39929521a4ad2cbb4e72f598b01'
            '1407d9c11d3578f94e06d7f60512aa3fa901dc3d192341c26e769c43cdb41184'
            'e24c75a2ba1fe8d5bf85a8957443ee04403190714ae2d3876a4e5e67b3ed21fa'
            '6f283d47b393f0bd66d75a91b05bab3f77f5932e5b1adb0e85e41a94099efe6d'
            '83d7fdcd0e3737a631566bcb18cc7d70d17f78774f921ab6f466e625bc9f7a87'
            '38823f8011afeeab0250cdd6d566e995237777b917b04d36b67908a74d348c65'
            '7153ad89ac4c9a7cb10cf1554ad437dfd600bb3eff629469f299b0d099280bcd'
            '0d7df1ca0ec71ffd3ace16f34f7acdecef904dd727745a5380c66672483d7b65'
            'd33aa197ebb628566dd7c54b8d39c48427260c7640f55899eef2544346b08691'
            '93d81a626b98e726cc801c1822ad7f4a505a6e4bf0ab9d9f592792b054354beb'
            '27ae93708915bfe015cb273fc04371f1e62cb28e2e4f303341aae31a9de2212a'
            'd6eb0616bf4de85a3de46c2cfe69227fd104ae5804f793e593c5966c74b4ebf5'
            '8a8db74c470f369e2c9abda76e0f1681b09d00d31c108c442f9d21ee76a33f93'
            'b1854a3a3130bfab2d103bf9c90039bac54dd61671226d130823c440c153aacd'
            'cb1bd81f2863822465cfe2513cb97e48b044d3f1da27595e1b110f8f4b079ecf'
            '99a270047e64a08eb55348acfc36351c794ff265692df91defa73bb107e40184'
            'cd245b169db4bd5bdafab3d6a1c1136bbf0df02f84e4ca6702f7be0f99647a58'
            '5a1149b2005ca8ff829dc1675fb8e44f247ee2ff7bda9605644ec7094664ed97'
            '0cfcf2ab2cc8d2b201f8d842bdaf524f8f05d7b0beeadaa239e7577b5521f0c6'
            'd83ff68de708fb23ca3be731be309b9a371784d00834f2672a9a9eaa28f4e9fc'
            '6feacfda51470711a76ec1d6be81948d017cfd15a5c09f9fdbb8cc0231009236'
            'fb70da2bb6df9bcca0d55f476b227bb3031b5177a89896a7192216d89d877d96'
            '4932970281face6d86902a0eb2131c189af0207267ceb096e34294c3fae89ced'
            '26dc8b4769feb74881fcd611b6e81d0b55a970cfe474feb03c1638334dd583ab'
            '131079c16825ed07a1c02a2952291b295ac5a1ae80e4fa97160d08146cb14b54'
            'd6c961f8911fe910985bffe00f39e9a0e833b1c03388d264cf3cb72e49b385da'
            'ee113260557a83e79f6a98caa7af093c47513d7c604113c2a5d9a150c8986207'
            'a66ac90b614299f53cf5c3b0b7c22bb0c5cef38363ecca5799c82367dfadcdcc'
            'c25915dc7b0b0357fd1260229b246c5edbf904e3f956bf8f5d7aa1473fe25663')

prepare() {
    local tree="$srcdir/dkms-tree"
    rm -rf "$tree"
    install -d "$tree"

    # Scaffolding (ours): build recipe + versioned dkms.conf.
    install -Dm644 "$srcdir/Kbuild.top"       "$tree/Kbuild"
    install -Dm644 "$srcdir/Kbuild.codecs"    "$tree/sound/soc/codecs/Kbuild"
    install -Dm644 "$srcdir/Kbuild.sdw_utils" "$tree/sound/soc/sdw_utils/Kbuild"
    install -Dm644 "$srcdir/Kbuild.soundwire" "$tree/drivers/soundwire/Kbuild"
    sed -e "s|@PKGVER@|${pkgver}|" "$srcdir/dkms.conf" > "$tree/dkms.conf"

    # Mainline source files: makepkg saved each under its basename; lay them
    # back out into the kernel-relative tree the patches and Kbuild expect.
    local f
    for f in "${_src_files[@]}"; do
        install -Dm644 "$srcdir/${f##*/}" "$tree/$f"
    done

    # Apply nealstar's patches in numeric order (a dependent chain). 0009 also
    # drops a declaration in include/sound/soc_sdw_utils.h, which a DKMS module
    # cannot patch; the symbol has no out-of-tree callers, so filter that hunk.
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

package() {
    # Audio codec DKMS source (built per-kernel at install time).
    install -d "${pkgdir}/usr/src/${_dkms_name}-${pkgver}"
    cp -a "$srcdir/dkms-tree/." "${pkgdir}/usr/src/${_dkms_name}-${pkgver}/"

    # tas2783 firmware ships in linux-firmware-other >= 1:20260519 at
    # ti/audio/tas2783/1714-1-0x{8,B}.bin.zst (Arch zst-compresses). The kernel
    # requests the flat names 1714-1-{8,B}.bin and falls back to .zst, so
    # symlink both ends as .zst.
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
    # tas2783 spk_init + AMD ACP70 DMIC redirect (device 4). Beats the
    # driver-default trampoline only for our card; pacman -Qkk stays clean.
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
