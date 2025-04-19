# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://gitlab.com/Matt.Jolly/chromium-patches/-/tags

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=35.2.0
_gcc_patches=134-1
pkgrel=1
_major_ver=${pkgver%%.*}
pkgname="electron${_major_ver}"
pkgdesc='Build cross platform desktop apps with web technologies'
arch=(x86_64)
url='https://electronjs.org'
license=(MIT BSD-3-Clause)
depends=(c-ares
         gcc-libs # libgcc_s.so
         glibc # libc.so libm.so
         gtk3 libgtk-3.so
         libevent
         libffi libffi.so
         libpulse libpulse.so
         nss # libnss3.so
         zlib libz.so)
makedepends=(clang
             git
             gn
             gperf
             # harfbuzz-icu # disabled because ICU 76 not supported yet
             java-runtime-headless
             libnotify
             libva
             lld
             llvm
             ninja
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs which is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             nodejs-lts-iron
             npm
             patchutils
             pciutils
             pipewire
             python
             python-requests
             qt5-base
             rsync
             rust
             rust-bindgen
             wget
             yarn)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
options=('!lto') # Electron adds its own flags for ThinLTO
source=("git+https://github.com/electron/electron.git#tag=v$pkgver"
        https://gitlab.com/Matt.Jolly/chromium-patches/-/archive/$_gcc_patches/chromium-patches-$_gcc_patches.tar.bz2
        # Chromium
        compiler-rt-adjust-paths.patch
        blink-fix-missing-stdlib-include.patch
        # Electron
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        jinja-python-3.10.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=134.0.6998.205
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=e14bdcd1f72d62bca1d541b66da43130384ec213
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v22.14.0
        chromium-mirror_third_party_engflow-reclient-configs::git+https://github.com/EngFlow/reclient-configs.git#commit=955335c30a752e9ef7bff375baab5e0819b6c00d
        chromium-mirror_third_party_clang-format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=37f6e68a107df43b7d7e044fd36a13cbae3413f2
        chromium-mirror_third_party_libc++_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=2e25154d49c29fa9aa42c30ad4a027bd30123434
        chromium-mirror_third_party_libc++abi_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=634228a732a1d9ae1a6d459556e8fc58707cf961
        chromium-mirror_third_party_libunwind_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=e55d8cf51c6db1fdd4bb56c158945ec59772c8ee
        chromium-mirror_third_party_llvm-libc_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libc.git#commit=6d0c8ee02e2fd44e69ac30e721e13be463035ee5
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=5a1675c86821a48f8983842d07f774df28dfb43c
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=a4ea8c1d3f066dd9ff0d41be07d2ea02d00cee9b
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=e7d001c82ee5bead5140481671828d5e156a525a
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=914c97c116e09ef01a99fbbbe9cd28cda56552c7
        chromium-mirror_third_party_anonymous_tokens_src::git+https://chromium.googlesource.com/external/github.com/google/anonymous-tokens.git#commit=2e328dd4eace9648adcc943cac6a1792b5dcdec5
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=9a408736204513e0e95dd2ab3c08de0d95963efc
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=7056f50fdefc6bc46aa442e720d0336e2855b570
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=00fe003dac355b979f36157f9407c7c46448958e
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=ea42fe28775844ec8fe0444fc421398be42d51fe
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=0dfd77492fdb0dcd06027c5842095e2e908adc90
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=fbc5e98031e1271a0a566fcd4d9092b2d3275d05
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=d5166861902b565df446e15181eba270fe168275
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_chromium-variations::git+https://chromium.googlesource.com/chromium-variations.git#commit=84c18c7a0205fbd0a27b0214b16ded7fc44dc062
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=3de9f013df4b470069d03d250224062e8cf15c49
        chromium-mirror_third_party_cpu_features_src::git+https://chromium.googlesource.com/external/github.com/google/cpu_features.git#commit=936b9ab5515dead115606559502e3864958f7f6e
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=8a1772a0c5c447df2d18edf33ec4603a8c9c04a6
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=d3d60ac6e0f16780bcfcc825385e1d338801a558
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=ea21b22629965105426f3df5e58190513e95a17e
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=e42fac3e9c1726ab14a61a25e6291d9ccc49e688
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=65b3f414b81ffe4df49202af6fc75bc26a3cb109
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=2a35a917be47766a895be610bedd66006980b7e6
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_fast_float_src::git+https://chromium.googlesource.com/external/github.com/fastfloat/fast_float.git#commit=cb1d42aaa1e14b09e1452cfdef373d051b8c02a4
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=d10a0f8bf5ddcce572df95105152bc74041cae0c
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=8db59321d9f02cdffa30126654059c7d02f70c32
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=14d466b30a8ab4a9d789977ed94f2c30e7209267
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=a363b6c001139b9c8ffb7cd63f60a72f15349c3b
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=b1f47850878d232eea372ab167e760ccac4c4e32
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=6d8035a99c279e32183ad063f0de201ef1b2f05c
        chromium-mirror_third_party_ink_src::git+https://chromium.googlesource.com/external/github.com/google/ink.git#commit=bf387a71d7def4b48bf24c8e09d412dfb9962746
        chromium-mirror_third_party_ink_stroke_modeler_src::git+https://chromium.googlesource.com/external/github.com/google/ink-stroke-modeler.git#commit=0999e4cf816b42c770d07916698bce943b873048
        chromium-mirror_third_party_instrumented_libs::git+https://chromium.googlesource.com/chromium/third_party/instrumented_libraries.git#commit=3cc43119a29158bcde39d288a8def4b8ec49baf8
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=955936be8b391e00835257059607d7c5b72ce744
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=c05bf9be660cf170d7c26bd06bb42b3322180e58
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=e235eb34c6c4fed790ccdad4b16394301360dcd4
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=c9fb4b3a6fb54aa8c20a03bbcaa0a4a985ffd34b
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=4ee78d7ea98330f7d7599c42576ca99e3c6ff9c5
        chromium-mirror_third_party_domato_src::git+https://chromium.googlesource.com/external/github.com/googleprojectzero/domato.git#commit=053714bccbda79cf76dac3fee48ab2b27f21925e
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=2610f7b1043d6784ada41392fc9392d1ea09ea07
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=3990233fc06a35944d6d33797e63931802122a95
        chromium-mirror_third_party_crabbyavif_src::git+https://chromium.googlesource.com/external/github.com/webmproject/CrabbyAvif.git#commit=c5938b119ef52f9ff628436c1e66c9a5322ece83
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=97690c6996f683a6f3e07d75fc4557958c55ac7b
        chromium-mirror_third_party_beto-core_src::git+https://beto-core.googlesource.com/beto-core.git#commit=89563fec14c756482afa08b016eeba9087c8d1e3
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros-components_src::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=1f1c782f06956a2deb5d33f09c466e4852099c71
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=ad78bb591d02162d3b90890aa4d0a238b2a37cde
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=624da0f593bb8d7e146b9f42b06d8e6c80d032a3
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=2209bb84a8e122dab7c02fe66cc61a7b42873d7f
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=927aabfcd26897abb9776ecf2a6c38ea5bb52ab6
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=9d46308f313f2bf8dbce1dfd4f364633ca869ca7
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=a52756acb1c5e133089c798736dd171567df11f5
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libva-fake-driver_src::git+https://chromium.googlesource.com/chromiumos/platform/libva-fake-driver.git#commit=a9bcab9cd6b15d4e3634ca44d5e5f7652c612194
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=7b3fa8114cf8ef23cbf91e50c368c1ca768d95d5
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=b4f01ea3ed6fd00923caa383bb2cf6f7a0b7f633
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=2af6c034ac871c967e04c8c9f8bf2dbc2e271b18
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=5a9a6ea936085310f3b9fbd4a774868e6a984ec4
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=13434b50dcb64a482cc91191f8cf6151d90f5465
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=f477acb1049f5e043904b87b825c5915084a9a29
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=eb8b80b28f956275e291ea04a7beb5ed8289e872
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=33f7f48613258446decb33b3575fc0a3c9ed14e3
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=38d1445b41d1eb597fcd100688dbaff98aa072ed
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=781f2eab3698d653c804ecbd11e0aed47eaad1c6
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=12f7715a6390050c5cffb7e4c9b2be1c2f2956d0
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=0d78d85c2bfb993ab8dd9a85b6fee6caa6a0f357
        chromium-mirror_third_party_protobuf-javascript_src::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf-javascript.git#commit=e34549db516f8712f678fcd4bc411613b5cc5295
        chromium-mirror_third_party_pthreadpool_src_934f177b::git+https://chromium.googlesource.com/external/github.com/google/pthreadpool.git#commit=e1469417238e13eebaa001779fa031ed25c59def
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=413da873d93a03d3662f24b881ea459a79f9c589
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=6dcd83d60f7944926bfd308cc13979fc53dd69ca
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=83fd40d730feb0804fafbc2d8814bcc19a17b2e5
        chromium-mirror_third_party_search_engines_data_resources::git+https://chromium.googlesource.com/external/search_engines_data.git#commit=6dc3b54b420e6e03a34ee7259fcd2b1978fac5f3
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=b467149a72ca10a2e46345a1e5cd031ce8637023
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=0ff96f7835817a27d0487325b6c16033e2992eb5
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=32ded457c0b1fe78ceb8397632c416568d6714a0
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=567495a62a62dc013888500526e82837d727fe01
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=86cf34f50cbe5a9f35da7eedad0f4d4127fb8342
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=51c6eed226abcfeeb46864e837d01563cc5b907b
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=2e4b45a53a0e2e66bcb6540ae384c53a517218d0
        chromium-mirror_third_party_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=0549c7127c2fbab2904892c9d6ff491fa1e93751
        chromium-mirror_third_party_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=b8fcf307f1f347089e3c46eb4451d27f32ebc8d3
        chromium-mirror_third_party_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=e7294a8ebed84f8c5bd3686c68dbe12a4e65b644
        chromium-mirror_third_party_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=ce37fd67f83cd1e8793b988d2e4126bbf72b19dd
        chromium-mirror_third_party_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=39f924b810e561fd86b2558b6711ca68d4363f68
        chromium-mirror_third_party_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=0508dee4ff864f5034ae6b7f68d34cb2822b827d
        chromium-mirror_third_party_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=c52931f012cb7b48e42bbf2050a7fb2183b76406
        chromium-mirror_third_party_vulkan-utility-libraries_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=fe7a09b13899c5c77d956fa310286f7a7eb2c4ed
        chromium-mirror_third_party_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=a30aa23cfaff4f28f039c025c159128a6c336a7e
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=56300b29fbfcc693ee6609ddad3fdd5b7a449a21
        chromium-mirror_third_party_wasm_tts_engine_src::git+https://chromium.googlesource.com/chromium/wasm-tts-engine.git#commit=7a91dbfddd93afa096a69fb7d292e22d4afecad2
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=a156431ea66fe67d69c9fbba8a8ad34dabbab81c
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=7d5a3a8b494ae44cd9651f9505e88a250082765e
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=450cceb587613ac1469c5a131fac15935c99e0e7
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=fb2b951ac3c23e453335edf35c9b3bad431d9009
        chromium-mirror_third_party_webpagereplay::git+https://chromium.googlesource.com/webpagereplay.git#commit=d812e180206934eb3b7ae411d82d61bc21c22f70
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=8d78f5de6c27b2c793039989ea381f1428fb0100
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=e3f919ccfe3ef542cfc983a82146070258fb57f8
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=ccf29cb237c3ed09c5f370f35239c93d07abfdd7
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=cb54d9db2e535ee4ef13cc91b65a1e2741a94a44
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=0824e2965f6edc2297e55c8dff5a8ac4cb12aaad
        chromium-mirror_third_party_zstd_src::git+https://chromium.googlesource.com/external/github.com/facebook/zstd.git#commit=ea0aa030cdf31f7897c5bfc153f0d36e92768095
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=4f282ae4acae85cdcc8c167cbc296a86d24c1cf6
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=cb550a25c75a99ae0def91a02e16ae29d73e6d1e
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=48e7f3020f52ef9adc31aa0f5db01dc42cc487cd
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=a660247d3c14a172b74b8e832ba1066b30183c97
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=a252ef1991b42918f6e74bc8c26b6543afe7bb2e
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=e262f0f8896e459fe7fd2a076af48d5746b1d332
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=e2d024354e11cc6b041b0cff032d73f0c7e43a07
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0bad08bb207bbfc1d6f3bbc82b9242b0c50e5794
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=b35641f4a3c62aa86a0b3c983d163bc0fe36026d
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=209717dd69cd62f24cbacc4758261ae2dd78cfac
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=f81f6c011baf9b0132a5594c034fe0060820711d
        chromium-mirror_third_party_dawn_third_party_dxc::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectXShaderCompiler.git#commit=c2ed9ad4ee775f3de903ce757c994aecc59a5306
        chromium-mirror_third_party_dawn_third_party_dxheaders::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectX-Headers.git#commit=980971e835876dc0cde415e8f9bc646e64667bf7
        chromium-mirror_third_party_dawn_third_party_khronos_OpenGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenGL-Registry.git#commit=5bae8738b23d06968e7c3a41308568120943ae77
        chromium-mirror_third_party_dawn_third_party_khronos_EGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/EGL-Registry.git#commit=7dea2ed79187cd13f76183c4b9100159b9e3e071
        chromium-mirror_third_party_dawn_third_party_protobuf::git+https://chromium.googlesource.com/chromium/src/third_party/protobuf.git#commit=da2fe725b80ac0ba646fbf77d0ce5b4ac236f823
        chromium-mirror_third_party_dawn_tools_protoc_wrapper::git+https://chromium.googlesource.com/chromium/src/tools/protoc_wrapper.git#commit=b5ea227bd88235ab3ccda964d5f3819c4e2d8032
        chromium-mirror_third_party_dawn_third_party_jsoncpp::git+https://github.com/open-source-parsers/jsoncpp.git#commit=69098a18b9af0c47549d9a271c054d13ca92b006
        chromium-mirror_third_party_dawn_third_party_langsvr::git+https://github.com/google/langsvr.git#commit=303c526231a90049a3e384549720f3fbd453cf66
        chromium-mirror_third_party_dawn_third_party_partition_alloc::git+https://chromium.googlesource.com/chromium/src/base/allocator/partition_allocator.git#commit=2e6b2efb6f435aa3dd400cb3bdcead2a601f8f9a
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        # END managed sources
        )
sha256sums=('79d0e5dfdc457a7baf375edaf61f5c3eeeac4f7b0ae1eeb18ab3f26ee71cd26b'
            '6a7e3703a6453f0e960a0d69d0676aebf14a0a57428f938e349b39876ef2e157'
            'b3de01b7df227478687d7517f61a777450dca765756002c80c4915f271e2d961'
            'a4a822e135b253c93089a80c679842cc470c6936742767ae09d952646889abd6'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '13fcf26193f4417fd5dfbc82a3f24e5c7a1cce82f729f6a73f1b1d3a7b580b34'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            '991e54f4490cdbb5e52c9a4a4f6e0e32f2fc95979f18a4736016d065da229c2e'
            '869bb5d3e6653e5e53e1add0524cbd08c61d28bcad665878164adf05e24c16e0'
            '2cba5d2d3675356b2ebd487cd76717b74bd8ade92f3a57dc1eb4df3627713089'
            '0b7a546ee6913c49519c10c293ac530ff381641a8a465fa2e184d6dbe0fb784d'
            '9a96d033c1060583d53feddfda63e0eefc6d71eed23a7e40bf832792198e027e'
            '3522166c3ca75316a172b7cc4fe12bba9367e30fed16df8193ede2e236dca8c5'
            '60935b226794933e881973746d892eb6fb7b7d596bf6cf9ff3c4f2da56240a9b'
            '452f24c4b79dd84d83220a95339cd549dd17560246e414d1883aa204b91c43a6'
            'b47dd23cba2716b8836a415ac9e463a10c88d902e0460e9bb2acd02842388d15'
            'f5413780556ab39fbe7b60f02d61880c9c7336745fd62280f73d1611af478886'
            'd027e888266fdb16b815f528bf491bdea5a7955566e51b641414231748795583'
            '5f90c9f6609aa1b3b2fbe6f3fad085a898cb7ef117deb9d9c028b42dfc155b9a'
            'e03d2643cc77daa71f5db75c1d73c68a9bd8e450be39caf21ebc25692266e958'
            '456cc5196131432aad725f6baad56c454908a8420c84f0fb2103b4f94e6a2858'
            '347789c9374d6ac4e85da4c3eff676215a6fecd59d07751d0035829969e05aed'
            '4b24bb508d0b2b2429676d4584a41a3ef553b9ed5688e065784f0791323be254'
            '89a368f0652d857d38402d6f3c5cded3c1757230ab7abe01df850a7bf8359119'
            '47f069339c9938a45084b8247b2afe0a6ffe6a02d1255abd023f5ad21cde6c53'
            'a9941345a51bce0fe13bd9e5e88d0fe105de1a8edd01fd6aa1e8b03c3c1bb86d'
            '5f359dae10e80599f26483879b879d7a6808520d4a56c98ee0879373a6339619'
            '7d32d5db3bd65edded35aa7f9cc92e3ac87d43c911e80233d3ab3f7b00dbe93d'
            'ba7ec5686978ac429fa26ccc265a387aba504b2bdf5e7634c1c306c0f9a9e9f1'
            'cdae148ab29e40b686bb56d1da689dbc376c6a4b467fbb6d39e6bcb4b59ed4a5'
            'daf849cd8220e962701b452920d592f2ec39b89e48bae83908ca014808aa05e4'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            'ea03dcbbf20bb146fbfef8e3be6f7fa50346ba5e4289696967caeaf3e8ad2b12'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '9e950d9f0bf7f0b52de6744de0922583b4b32281e87f0488c2d1cfc533665aa5'
            '6125206b56f365874ba812038dbcd4271f8a73235ab4d211c42b7fd2d636bbc8'
            '2f2cf58cb6a0123b37dce1f317d7971efeae26a9880f96918a18bd68b1b4065b'
            '6ae7ae01b3c23f8bf7657a59427aac6f3216e041ebdb983b82c002a949bdb071'
            '0d5c967ff545290ed5ecd9b7343573918187a5445f5632de27db79000725b52c'
            '757211b6442d39b69b33d6d75beb02fbd1c42c81c1bbfc57ca03fb846bf06a6f'
            '34b7cb94c731a65909a18e7fdb684a285bd0be8f1f8c73dec3b4a01e25b5ca37'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            '1057a9c60b0b40e2586d3d8d0a538774144f0664bff8bb53441486d4ca9d4305'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            'be05ebb53b7468e246aac2a22d1ce748c25e2e0cc5d0227e16272a00827092ff'
            '0c14e1bf4058217068db49ba6a852f425c8e9fbf0ad83b9d7bc0caad5d588b93'
            'cf96ae84ef29434dd20b0f2daca6013373dd6e47c87cde3aa03abce0500a9f03'
            '7df2a26df1b8e69c58692295443e18de9f19bc0107bd5911beed53157a592ad3'
            '0db8417b0fd669b95227c266cbc578af1f5e00198fd24f51fee8cfcfccb8b06b'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            '4643371f9d5bf68aea5a453bc8886e114c894bb3381b3125b5a1e893b61e7326'
            '3c70e83153a9ee7084a5773514f9458b36841104b750fe981f00a8e82f36ae92'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            'fd0acdcbbe1072732f03801c9a8ae4c75fa222824f346a71ffcf5025adad83a2'
            'bd34ee4a1fe681d507c19eb1efc18530643bf02b2154ac1bb79d3b65c513a0d6'
            'ed1d70be45736383da22f440847d9c256d711a209d85624caba7b16b07a04642'
            'b6501c43424ae8742ab6c9fc9ef7ffd18ae102977cf2bda3e87753bae4b9bd32'
            '66004b44318ad7e4329d65b08320136ee8a9f074b7b001107c52377493d28cc0'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '488513b955f90b0f965be248631fedab0f27714c49632eb58389c2ff18815199'
            'c4937556055fb68ab813cbe0d7319a716e44f9950e79fa6be4ac61b8017c5a81'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            'f7b3bcbdb44bdc9043de1b96bc20f9f960bef46b5c088ba1f9ec277d24b0ed89'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '2c21c74e00540f211bb57b33e8644f8ab2ec511b7b905b432acc163d898cca34'
            'c2eb3aee5d91aa9d80d651d5bc26ae729e9a5bdd2f62985ca394cebac5b8174f'
            'bb19e0319273e64c3eda91786d1bb1c6038cc90e1380c56abcb96a62e29d46ee'
            '4d9744e80315f439cb0cdcb51ccc883b9d9aac571078079ace23cd2b253a7328'
            'c5dacc6dc968ed1e6c39ad964b29aca7ee36129a1450a87e39ed499938dcdcab'
            'd24ed34b895190401570a7f433af20b7428e7d86222c95f04f9a7a64cc265b93'
            'ac36790b054f2b0fbc5bcb64951ee2f77201d3795d5ccf590adc78b5bc7cb6e2'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            '037f53cc94468f16efb0525cadb258060a9af63550b681a28d34ee3825b2111a'
            'ae2c189d21dcd056116ee1c3d54b5ae3874e5ac0cc2086c137625b618334cbb1'
            'dd3fe1521ff5bc4481bfd447d62322417f069371d107d5df2df8134b0a1bfd79'
            'fe2f23319ca61ecb2fac8e586ad71fe36ba340fd4f5c4d0372d0e119d5c264e0'
            '3bb4ad9e05483ad8cadd9bf9d7ca0e2e16fd4eb1495ef36f4858be22c2eb31b2'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            'cf14b8dbbde77c5a844eb06b1869c40342ea41bf1bff8b112ab388729a92f3e0'
            '25906418111df0d29db783092d94148e130592d722393ad4bd76809c6f63f9bd'
            '867f9d88a2146f54979508a670f28f681c729dd144956941066a422714fbd8c7'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            '7b81837265657fa3404c93b2de8d5735265dfecc52ec9e5a3157ef4a14cfdba1'
            '696b96eb6f8fcfe70a2913632b639d75325f1066f6968878483a57f61caee1ca'
            '6ce1c843cf14734395760cd772f4193417426b24c08d928e478053164e892f55'
            '453e01c28b9e9c438fe8fedc54dc4c6b1800741e75c93c7cbfb5857378584934'
            '0ba01dd26c1c899edcf7d33ec2796c6d4a3ca7cb2c8bc45aca39e220a82a8f46'
            'e475d42b746955422ff9e905354091d0b17cdb2c8989cc6beb6470e76a4aa1dd'
            'f2aba031573fc4929d2bd9d03e4b18c4385f399fa0b605eca35898567ebdf7b4'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            '3d55fa9e1d628aed3e127b6fb4d3dd47b7ada7b865f683f52e21a51043827479'
            '34f643fd7cf56634ef1fe040568ebc42329cb8645c98933087a98136468ab671'
            '604377456e0d5608f6c61bccc8cffcc6bd89c862b0c1a58567218b90a8de7660'
            'dcff8156cea26e31c68609789a106a2f6d334d79b8f3507aa8d2080c58a545ad'
            '602a646863f7c4004376990d9a9339e6ae821d7ea98fe5f675e14eb508fb7747'
            '86e56fcf3067e8702fda2008213173a9d4afe4d070d9369b4279c44ef8056213'
            'ccb9f7ddf1928c7a2c99b47bdae93db891d9045eb25bd4f91c9cc08fac260e8a'
            '78f5096d2d425b9663cb289964d994c9a15db7938c5a1a35cc4b286014ca2545'
            'e9a8df49e9688d0e8af91d8ebb9a0deb13d93b508545fcb3823c24d7eb2fc5b7'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            '215cb74a45a6df118ec77d96848ea7dce7885f1a4be401c4e11cb8f8c32f4078'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            'b7a7a43eae0f41a9e18f54c2334d5797a547238b76d64d59ede26a4d6621de0d'
            'e233bbe7474752668e3f1f72f677f532b54526f8891a6160bb87891cba236015'
            '0e4ad5140fb91b49930d3a8de8964752bf8a70e18b2eded82f848df6dfb7da4d'
            '59a172a08dd57239132b86ffbbed3b97edbba408d5ba13d94d0397a84df2c93a'
            '4ebe3ffd4fcd7b1057ce72b0439638c43aa8825040be30b11b8b5a5101a06bb0'
            'b07116bf69c635b29f36e097c97445200042b713d5ac8b64a4b95777aa6fc7ee'
            '1a94dc238b495ea06f98e8876591691eddfc41e3980b84624fd0834add444afb'
            '12700b33ff59df075c871232316dc3bb012f172ec1ec27abe770310cd68c4cf8'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            'dc5ce42dd4fea4b4fd99c3b8b01b7a4ede893bd9e6951fc49219443e5722c65c'
            '007907816e9edf03e47142ae70ef70db4ed2b1cc3e72f63102a31b84ed902e89'
            '0f2541301cce2f1bdb380680b5c07335042ec9d9029c0afa7ba4586a768c05bd'
            '0f18fde832017387600b5ee2ec6a0ae82125c82b97c0f717772f3cd5dfdcd57b'
            '8a1f7e4672522fc431536b99ea66059a46cf16b7c9af74e837a540a5f57bd1cf'
            'eae27ed68b64bec4f6c669472148d9ffd03e24813edec9cc06a554ba7cf5ed30'
            '3802a75ffe68b0f6f59c8dd53c9543d45017527aaf0026a2a9203084a1c9a0b3'
            '67650c2395ae9203745f75e62c0c6f38f97c38f8759ffda131d721138bdc0029'
            '8ec360e4617c946f6d40eba5821b0b73b85db5e097f49d94ba8d91604be88d22'
            '8adcd335bd0f56cc09e06afbfa6b85e4080ac941879a7ba2e6ec9d15bc0476bb'
            '896c0242cf24db3ccb2583ff352dc6877e2cd7127323236257e4702a13c9efb6'
            '913fc3a85ae676025bafe63880c6413ffafe42495a04a52527ee914ee9ba3ae5'
            '9683c7f9f5b0a91879debaa6d1af670a66ec3a6761caafbbc703f24c816263fb'
            '8ee0bade4127e082dc1ae86f0068aa32ea0fbce26069ed2d9dbdef324e1bb980'
            '900f9249e65a3bf0189f3e32c6a2d84bd88b9b3a7d7cfba8c12c1be0d78dd31f'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '02696a90c7831e3fa903df105573c5f10f4934602fb0e90c846fb44213c40b27'
            'ac3a122bf70f773c7a7dbc562c5e2d7a7c90c5a2d4b3909f3ad3a9263e56842c'
            'c0f4a9554543b4d00dda4a13202f0fa3e7be2d766f848edcdc12d8700e2ac6d0'
            '995dfe82bfbcda05b1eff51400e8ea48205358aed8cb64e9837bd9b5218e3ac3'
            '85fad6069278059b8f65f33fe17d4a8f2dcd10701fd229901b038e91a7fc76c0'
            '0c9106a2bef658f02b2312d081faad6ba8a72bbb5b4ee1cae7d0a95e4ef53f8f'
            '04a61e218b3a10ec3cf58e3fe12fb2ea23610f03889d19b31b8ccb3b078efd6e'
            '910bc5d9e7523ccd09506bafe3fac586db5106d8cc72d77e8457fdf8b43c225e'
            'a12f87505e4dd4e69c6ddb29d7d47ec7c0936ebbd4816f4bd4eca4db0c093e77'
            '77625b6591fdbad846dfbf38f1951b94743839cb91ed545bf8da593f597ef7dd'
            '504c8f75eaa40dfb6114047a92589f6ef2851140c5f6ddc6155f7288f00277fc'
            'e05229c1c6fbf852f90a06bf8b5b7252be5d20f1742cb581dc78e7689855ec3e'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            '8aff4931c7911bbaa942c4f6c8b0b5e08641ef435569b2bbb42e70a589a8b252'
            'f9dfff0e33f53f979f55f7b73179d068c17ad49f0c736844b066aab3f3bb476c'
            '28671769fe978b6cb97062b2e98a23f60f995d392628768917faaa24b618a0a3'
            '3dc479be726e4164a6ad900bdae8d068bb2d1b568ef58e67a1bf8427d9cd8571'
            'b48490fbcdad8becc160f2dab2ee4a0f67327f1e9d9ddbd96e44150175c68ca9'
            '0b95ed21612b4f02e65643f2029d8ce5710f49dbe8b229350bbe643167a4b83b'
            '9bd1e05f5128b4715c2d354a6895839d01aae4fc9f56b9d0411afc87fb46daf4'
            '3ae63a893b5b585823f04b5a2e604d3df4c7c6e311f5da5b5d5af92a1fd00465'
            'd1bea5be4ca41f2e9f29354bc3bdf12d9bba47778eb6fa6b01db053a831f3b42'
            '0c8a1400e1d78dd219c969407300f5234a4b1b8ca27b78b23e6901db6b3e86d1'
            'f7f5d15365443cbd8137445c3aedf8ccd31c3402f72c0fa7c16e7bf1c7977139'
            'f8627f5f3a7c119807afc9dc66ce7cb350f905fd1db7fb6b0077552974a07515'
            'ac3f025aa27fec77b24b443df3a69750dc9bb070a40af5180d031b81e66e328c'
            '9c09dfbb8ebed025ec8ba34bf95c80fe30dd69eee5a02945c0357ce253d9dcbc'
            '8bd1361cf5c6e4e3336cad5b37c79dcc986a46b99e4ad7d679da146dd1fdb7fe'
            '868159a9a965cebd40f98f5995d6ac6361869904712c1b62c6b8a67d10dd93b4'
            'bde40f830d8edac53f2682acd50bf7db2632cb31c6ddaa1923a8703a58899e11'
            '37bd9bc812c1bfc471be2eb003f714e475f8425913c42703b21237f2b1c99e57'
            'c23fa31250811a76be900554b9ac127f861ebde09c07ac67cd6b82dd214e5686')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
declare -gA _system_libs=(
  [brotli]=brotli
  # [dav1d]="dav1d libdav1d.so"
  # [ffmpeg]="ffmpeg libavcodec.so libavcodec.so libavformat.so libavutil.so" # YouTube playback stopped working in Chromium 120
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  # [icu]="icu libicui18n.so libicuuc.so" # disabled because ICU 76 not supported yet
  # [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  # [libaom]=aom
  # [libavif]=libavif # libavif.so libavutil.so # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
  [libdrm]=libdrm # libdrm.so
  [libjpeg]="libjpeg-turbo libjpeg.so"
  [libpng]="libpng libpng16.so"
  # [libvpx]=libvpx
  # [libwebp]="libwebp libwebpdemux.so libwebpmux.so libwebp.so" # //third_party/libavif:libavif_enc needs //third_party/libwebp:libwebp_sharpyuv
  [libxml]="libxml2 libxml2.so"
  [libxslt]="libxslt libxslt.so"
  [opus]="opus libopus.so"
  # [re2]="re2 libre2.so" # needs libstdc++
  # [snappy]=snappy # libsnappy.so # needs libstdc++
  # [woff2]="woff2 libwoff2dec.so" # needs libstdc++
  [zlib]=minizip # libminizip.so
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

_update_sources() {
  python makepkg-source-roller.py update "v$pkgver" "$pkgname"
  updpkgsums
}

prepare() {
  sed -i "s|@ELECTRON@|${pkgname}|" electron-launcher.sh
  sed -i "s|@ELECTRON@|${pkgname}|" electron.desktop
  sed -i "s|@ELECTRON_NAME@|Electron ${_major_ver}|" electron.desktop

  cp -r chromium-mirror_third_party_depot_tools depot_tools
  export PATH+=":$PWD/depot_tools" DEPOT_TOOLS_UPDATE=0
  #export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Putting together electron sources"
  # Generate gclient gn args file and prepare-electron-source-tree.sh
  python makepkg-source-roller.py generate electron/DEPS $pkgname
  rbash prepare-electron-source-tree.sh "$CARCH"
  mv electron src/electron

  echo "Running hooks..."
  # depot_tools/gclient.py runhooks
  src/build/landmines.py
  src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  src/build/util/lastchange.py \
    -s src/third_party/dawn --revision src/gpu/webgpu/DAWN_VERSION
  src/tools/update_pgo_profiles.py --target=linux update \
    --gs-url-base=chromium-optimization-profiles/pgo_profiles

  # https://gitlab.archlinux.org/archlinux/packaging/packages/electron32/-/issues/1
  src/third_party/node/update_npm_deps

  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  # https://github.com/nodejs/node/issues/48444
  export UV_USE_IO_URING=0

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
         -e '1i #include <cstdlib>' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  patch -Np0 -i ../blink-fix-missing-stdlib-include.patch

  # Upstream fixes

  # Fix build with Pipewire 1.4
  git -C third_party/webrtc cherry-pick -n 0a9787897f3d36055130b0532967d31c31e8408f

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../chromium-patches-*/chromium-132-compiler.patch

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -sfn /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  mkdir -p third_party/jdk/current/bin
  ln -sfn /usr/bin/java third_party/jdk/current/bin/
  ln -sfn /usr/bin/clang-format buildtools/linux64

  # Electron specific fixes
  patch -Np1 -i "${srcdir}/jinja-python-3.10.patch" -d "third_party/electron_node/tools/inspector_protocol/jinja2"
  patch -Np1 -i "${srcdir}/use-system-libraries-in-node.patch"
  # patch -Np1 -i "${srcdir}/default_app-icon.patch"  # Icon from .desktop file

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
        \! -regex '.*\.\(gn\|gni\|isolate\)' \
        -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  cd src

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=true' # https://github.com/llvm/llvm-project/issues/61705
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_hangout_services_extension=true'
    'enable_widevine=false'
    'enable_nacl=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  local _clang_version=$(
    clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')

  _flags+=(
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    "clang_version=\"$_clang_version\""
    'chrome_pgo_phase=2'
  )

  # Allow the use of nightly features with stable Rust compiler
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
  export RUSTC_BOOTSTRAP=1

  _flags+=(
    'rust_sysroot_absolute="/usr"'
    'rust_bindgen_root="/usr"'
    "rustc_version=\"$(rustc --version)\""
  )

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  # Let Chromium set its own symbol level
  CFLAGS=${CFLAGS/-g }
  CXXFLAGS=${CXXFLAGS/-g }

  # https://github.com/ungoogled-software/ungoogled-chromium-archlinux/issues/123
  CFLAGS=${CFLAGS/-fexceptions}
  CFLAGS=${CFLAGS/-fcf-protection}
  CXXFLAGS=${CXXFLAGS/-fexceptions}
  CXXFLAGS=${CXXFLAGS/-fcf-protection}

  # This appears to cause random segfaults when combined with ThinLTO
  # https://bugs.archlinux.org/task/73518
  CFLAGS=${CFLAGS/-fstack-clash-protection}
  CXXFLAGS=${CXXFLAGS/-fstack-clash-protection}

  # https://crbug.com/957519#c122
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${_flags[*]}"
  ninja -C out/Release electron electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir:?}/usr/lib/${pkgname}"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/${pkgname}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/${pkgname}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" "${l}")" \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -Dm755 "${srcdir}/electron-launcher.sh" \
    "${pkgdir}/usr/bin/${pkgname}"

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 electron.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}
