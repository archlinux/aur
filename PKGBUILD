# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://gitlab.com/Matt.Jolly/chromium-patches/-/tags

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=30.1.0
_gcc_patches=124
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
             harfbuzz-icu
             http-parser
             java-runtime-headless
             libnotify
             libva
             lld
             llvm
             ninja
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs whith is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             nodejs-lts-iron
             npm
             patchutils
             pciutils
             pipewire
             python
             python-httplib2
             python-pyparsing
             python-requests
             python-six
             rust
             qt5-base
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
        drop-flag-unsupported-by-clang17.patch
        compiler-rt-adjust-paths.patch
        # Electron
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        jinja-python-3.10.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=124.0.6367.243
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=e14bdcd1f72d62bca1d541b66da43130384ec213
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v20.14.0
        chromium-mirror_third_party_engflow-reclient-configs::git+https://github.com/EngFlow/reclient-configs.git#commit=955335c30a752e9ef7bff375baab5e0819b6c00d
        chromium-mirror_third_party_clang-format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=e5337933f2951cacd3aeacd238ce4578163ca0b9
        chromium-mirror_third_party_libc++_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=80307e66e74bae927fb8709a549859e777e3bf0b
        chromium-mirror_third_party_libc++abi_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=ec88f0ab262c5f2426dbf138b92ee9ae5961e431
        chromium-mirror_third_party_libunwind_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=419b03c0b8f20d6da9ddcb0d661a94a97cdd7dad
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=fef0b5aa1bd31efb88dfab804bdbe614f3d54f28
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=b58f65651ed89b3a21f82d49b5f263b0d6e6bad1
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=9f8738892edd83219d2f83fdd73c7c14d5dbb80d
        chromium-mirror_third_party_accessibility_test_framework_src::git+https://chromium.googlesource.com/external/github.com/google/Accessibility-Test-Framework-for-Android.git#commit=4a764c690353ea136c82f1a696a70bf38d1ef5fe
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=bda89e1f7c7195a9d03d037039c2dd5057563a59
        chromium-mirror_third_party_anonymous_tokens_src::git+https://chromium.googlesource.com/external/github.com/google/anonymous-tokens.git#commit=321a40ba18a083feccb8ae2f99a8676bb1702676
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=9a408736204513e0e95dd2ab3c08de0d95963efc
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=006ca01d387ac6652825d6cce1a57b2de67dbf8d
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=e04b03f714994b7a747b5472da4ffae9e6e38938
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=8f20644eca693cfb74aa795b0006b6779c370e7a
        chromium-mirror_third_party_google_benchmark_src::git+https://chromium.googlesource.com/external/github.com/google/benchmark.git#commit=344117638c8ff7e239044fd0fa7085839fc03021
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=4fa4804c8ab4521079af62dba5260a99c34b8a29
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=76788faa4ef163081f82273bfca7fae8a734b971
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=71f51fd6fa45fac73848f65421081edd723297cd
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=9128ec6d34905512199f953bc60ff75ca29d0cf2
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_chromium-variations::git+https://chromium.googlesource.com/chromium-variations.git#commit=e78e275e34f94fdf333245137878f0f6482db67d
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=3de9f013df4b470069d03d250224062e8cf15c49
        chromium-mirror_third_party_cpu_features_src::git+https://chromium.googlesource.com/external/github.com/google/cpu_features.git#commit=936b9ab5515dead115606559502e3864958f7f6e
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=aa4b2163b99ac9534194520f70b93eeefb0b3b4e
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=fa5ade41ee480003d9c5af6f43567ba22e4e17e6
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=9a51dc89c4f21362e858b20a6a7cc8adfd7c7238
        chromium-mirror_third_party_crossbench::git+https://chromium.googlesource.com/crossbench.git#commit=acbea986f40578f43c88239c78c797f61842e642
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=9c43bc14f1a7404fd4b6f744050d553acca557bf
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=694ad4ed3c55195acd701950d2b2528880e9201e
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=2a9055b50ed22101da7d77e999b90ed50956fe0b
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=52d8ef3799b2f16b66351dd0972bb0bcee1648ac
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=bcb9ef187628fe07514e57756d05e6a6296f7dc5
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=14d466b30a8ab4a9d789977ed94f2c30e7209267
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=822dab21d9995c5cf942476b35ca12a1aa9d2737
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=f42ce25563b73fed0123d18a2556b9ba01d2c76b
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=155015f4bec434ecc2f94621665844218f05ce51
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=9ba6d25d0d9313569665d4a9d2b34f0f39f9a50e
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=f9a93151adf7203c6ab90f3c94bbd5972b7967b8
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=c231e6f5b152029dbd5fa4a9e0c04095035aec3f
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=bad7ddbf921358177e56fd723c2f59f8041a370f
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=068d5ee1a3ac40dabd00d211d5013af44be55bea
        chromium-mirror_third_party_libFuzzer_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/compiler-rt/lib/fuzzer.git#commit=758bd21f103a501b362b1ca46fa8fcb692eaa303
        chromium-mirror_third_party_fuzztest_src::git+https://chromium.googlesource.com/external/github.com/google/fuzztest.git#commit=bddcd9f77ba0a81a99ce50bcadf5149efe545df0
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=e8712e415627f22d0b00ebee8db99547077f39bd
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=158761dfb40e77f3a54c3b14a596112837baa24b
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=43ec9ace31c6ca11efddddb61b94b744450d46e2
        chromium-mirror_third_party_libavifinfo_src::git+https://aomedia.googlesource.com/libavifinfo.git#commit=b496868f7c3fd17dfeeecc0364fe37e19edd548a
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=33e682f24427a0eb634bd3186fe3c6fd96bd6768
        chromium-mirror_third_party_beto-core_src::git+https://beto-core.googlesource.com/beto-core.git#commit=8bd72cfb219344308ee857bcbe65a27fe91acfe8
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_speedometer_v3.0::git+https://chromium.googlesource.com/external/github.com/WebKit/Speedometer.git#commit=8d67f28d0281ac4330f283495b7f48286654ad7d
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros-components_src::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=a254b37189cf97cfc76634644e58be511aefb69a
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=98e1db501173303e58ef6a1def94ab7a2d84afc1
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=441f98d02deafd9b090aea568282b28f66a50e36
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=2209bb84a8e122dab7c02fe66cc61a7b42873d7f
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=9b894306ec3b28cea46e84c32b56773a98c483da
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=5b7c744eb8310250ccc534f3f86a2015b3887a0a
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=19832b1702d5b0adf616a0e080abd5207c8445b5
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=e4fbea0c9751ae8aa86629b197a28d8276a2b0da
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=ca332209cb5567c9b249c86788cb2dbf8847e760
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=a6a2ec654b1be1166b376476a7555c89eca0c275
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=13434b50dcb64a482cc91191f8cf6151d90f5465
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=f477acb1049f5e043904b87b825c5915084a9a29
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=09a4f3ec842a8932341b195c5b01e141c8a16eb7
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=90e48ecc4ed9feeba36f49065c738d620d6f0780
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=95fe35ffb383710a6e0567e958ead9a3b66e930c
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=dcdd830ae4e1b14f85383d1baf84efee6bc853cc
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=a66020f87046d8934c22e20acb2bb8a91901ce8e
        chromium-mirror_third_party_protobuf-javascript_src::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf-javascript.git#commit=e34549db516f8712f678fcd4bc411613b5cc5295
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=4fe0e1e183925bf8cfa6aae24237e724a96479b8
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=caa0a6eaba816ecb737f9a70782b7c80b8ac8dbc
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=6598a8ecd57724c8c7d43b2fca8eb9f9969ce57c
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=587c2cf8b11d3c32fa26887063eda3171a3d353e
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=a747f7ea37db6ea3871816dbaf2eb41b5776c826
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=c9f9edf6d75bb065fa47468bf035e051a57bec7c
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=f51e3fa404f5853650525549c78d7489a7f457b3
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=bbe6452b420c5ddc4b0fd421b0a3ce271262f4ca
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=55bc062601e4ee5a4efa834a84ae5c5ec6b28306
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=3cebaae6743688201c8aa9b3694bba6948f0fa68
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=56300b29fbfcc693ee6609ddad3fdd5b7a449a21
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=c35d1a3d1c0a1735afe5eb227cb826faa878ec19
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=681c33c8547d6aefe24455ba2bffe1c5ae11fee5
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=f4bf599a8b575df685c31d9c4729a70a04e377ed
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=addbf812fd750dc8cebbd63732e7ce54a763fbee
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=a55ff9e83e4592010969d428bee656bace8cbc3b
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=e3f919ccfe3ef542cfc983a82146070258fb57f8
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=ccf29cb237c3ed09c5f370f35239c93d07abfdd7
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=cb54d9db2e535ee4ef13cc91b65a1e2741a94a44
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=7e696d941310a528dd2d6fbee3d499d19b24746d
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=a926d0a32e02c4c03ae95bb798e6c780e0e184ba
        chromium-mirror_third_party_zstd_src::git+https://chromium.googlesource.com/external/github.com/facebook/zstd.git#commit=621a263fb2e6c2175fbd489e5d77ee8038baa2b2
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=cc9dc1eb196bc3cbeca92eeec62949b4ac7cd757
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=ec9827528085fcffca353c8d941ec20e3de7aaea
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=48ab3bd053bfe2fef4635d7cb1861f8923167b96
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=c6118a585ff6b2ef9f9a3b180d57b3cbf79e1788
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=de6b303a8915c2610e6ff30f5e7c89b2c8e4e2af
        chromium-mirror_third_party_dawn_testing::git+https://chromium.googlesource.com/chromium/src/testing.git#commit=035a9b18047370df7403758b006e6c9696d6b84d
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=e2d024354e11cc6b041b0cff032d73f0c7e43a07
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0bad08bb207bbfc1d6f3bbc82b9242b0c50e5794
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=62e175ef9fae75335575964c845a302447c012c7
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=526382e41c9c5275dc329db4328b54e4f344a204
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=1cd1f16ff8f7fb5402aeda870c82652edf8f663a
        chromium-mirror_third_party_dawn_third_party_dxc::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectXShaderCompiler.git#commit=511cfef8e0509d172fbfa156be8a97ed2b42590b
        chromium-mirror_third_party_dawn_third_party_dxheaders::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectX-Headers.git#commit=980971e835876dc0cde415e8f9bc646e64667bf7
        chromium-mirror_third_party_dawn_third_party_khronos_OpenGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenGL-Registry.git#commit=5bae8738b23d06968e7c3a41308568120943ae77
        chromium-mirror_third_party_dawn_third_party_khronos_EGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/EGL-Registry.git#commit=7dea2ed79187cd13f76183c4b9100159b9e3e071
        chromium-mirror_third_party_dawn_third_party_protobuf::git+https://chromium.googlesource.com/chromium/src/third_party/protobuf.git#commit=41759e11ec427e29e1a72b9401d2af3f6e02d839
        chromium-mirror_third_party_dawn_tools_protoc_wrapper::git+https://chromium.googlesource.com/chromium/src/tools/protoc_wrapper.git#commit=b5ea227bd88235ab3ccda964d5f3819c4e2d8032
        chromium-mirror_third_party_dawn_third_party_jsoncpp::git+https://github.com/open-source-parsers/jsoncpp.git#commit=69098a18b9af0c47549d9a271c054d13ca92b006
        chromium-mirror_third_party_dawn_third_party_langsvr::git+https://github.com/google/langsvr.git#commit=a34f394de431efaeb79bec26577389516b531e31
        chromium-mirror_third_party_dawn_third_party_partition_alloc::git+https://chromium.googlesource.com/chromium/src/base/allocator/partition_allocator.git#commit=67fd2f86eef40b1357387e2b0fc1eaf3c67d6ed7
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        chromium-mirror_third_party_vulkan-deps_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=9f37ad360ea1c32162f0cc1799b1b292594fc771
        chromium-mirror_third_party_vulkan-deps_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=b8fcf307f1f347089e3c46eb4451d27f32ebc8d3
        chromium-mirror_third_party_vulkan-deps_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=8b246ff75c6615ba4532fe4fde20f1be090c3764
        chromium-mirror_third_party_vulkan-deps_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=c6615779ef8a1eb5ef48fef77bf3eb2cf4f5438d
        chromium-mirror_third_party_vulkan-deps_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=577baa05033cf1d9236b3d078ca4b3269ed87a2b
        chromium-mirror_third_party_vulkan-deps_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=61a9c50248e09f3a0e0be7ce6f8bb1663855f979
        chromium-mirror_third_party_vulkan-deps_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=733fd2b522918f81f9c4669350dafd066f99c5d5
        chromium-mirror_third_party_vulkan-deps_vulkan-utility-libraries_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=a4140c5fd47dcf3a030726a60b293db61cfb54a3
        chromium-mirror_third_party_vulkan-deps_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=5b8af92af052c83444ac560ff1e28c1c322424ef
        # END managed sources
        )
sha256sums=('464b996e65b2dcaec19f3120f42031e2442e386f627f2474273ce2a1d02f810a'
            'c2bc4e65ed2a4e23528dd10d5c15bf99f880b7bbb789cc720d451b78098a7e12'
            '3bd35dab1ded5d9e1befa10d5c6c4555fe0a76d909fb724ac57d0bf10cb666c1'
            'b3de01b7df227478687d7517f61a777450dca765756002c80c4915f271e2d961'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '13fcf26193f4417fd5dfbc82a3f24e5c7a1cce82f729f6a73f1b1d3a7b580b34'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '3ae82375ba212c31fd4ba6f1fa4e2445eeca8eb8c952176131ad57c0258db224'
            'f1674e6550645996c9e4fdb3de00f1f53978c2d4a72daec127d9e2973cc33ecb'
            '0b7a546ee6913c49519c10c293ac530ff381641a8a465fa2e184d6dbe0fb784d'
            'b8670cb7c3ff51e53dbfa77ad1508260e674a46ef0ec8a177d7dd6c4acd4f443'
            '3522166c3ca75316a172b7cc4fe12bba9367e30fed16df8193ede2e236dca8c5'
            '1a1204e831ce56a1ea506037aae01417cf5157b5fb0e26a5e3310227ebd973cc'
            'e4b03ed3959fc4c880c7e886e69003009575209f5add6c8911e8c10d518b21f6'
            '8588f7e7b417006c6795c105d4fba762b18c2e6bf798a5dbc386a5dd1432a4ed'
            '6aacdcddb947184037ceacbe3e3eff57c4e9a494135ebd68e29bfbb26dcc5800'
            '5abf726ce9e19c0b0e7818a7ced615a1a6d16f306e7315b9e6db53118c0669b5'
            '045eb27642ac8f49b52efec7c52bb6ea3c908552ffadc50449a23b27da7a4737'
            '8a8c21768a1f3764e6887cfc907dd857e9fc00a1269dd858e2ba98d70aef889d'
            'a62dd76d5ebcae2e2302509f057d21c35ffd69549ee7cdac47b2a85616dcc9be'
            '403878357b3f2f126655b51370db05104f0ba7aa1c46aae17545bb1a15a2581c'
            '3d1b926224bdec6ae7c3c995d9fd282a35f0e2183cc116bfde57927c89d0d301'
            'de6dba1f7c67cb568c5f23e75a994422944ce46c01fc35bddae4ebc023a7145a'
            '62ddaee5c1c5d861fd8ac7badc1c5e552389ea3fd80b484f32ebaf40753d6979'
            'f8e611ff60421cdf2e9431739e55808fa00920c5828a03b252febcd52ee4b315'
            '89a368f0652d857d38402d6f3c5cded3c1757230ab7abe01df850a7bf8359119'
            '4fae43a0a499b60ffe7cdb938880acbcd3547f74a2c80006dc2d497462f2021b'
            'ace780651ede37cb2f02be00ee9921b7555e74431a02445bb64853f220652cc8'
            'd6045d4ebf49f14b994e58fbd2a84f95ca43a23f627db19b20cbfad1a0f49016'
            'bd07cc3f0dfa91629028ed53691eec8e0bf9bed7b3a602f4b8e78a7472e4e6fb'
            '1d34860ad27880462dfac4917fce5749b9804cd45803b5c58e661ae73a2f3777'
            'f7aad18d8ba3e0659820838004993d6003f32a6509fecebc167fd3335fb276ea'
            'af24f30b90d5942ecb89b9e5f373de70ec16ce590788a03a8d21f714bbca7337'
            '978cb7753b1ae225eda637bd464ddba19102833365d6bc187bcdc3e09a03010e'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            'f14006efaa2876941e3d35b13370eda1ab050aa9d698c20a895a9972dbd07839'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '9e950d9f0bf7f0b52de6744de0922583b4b32281e87f0488c2d1cfc533665aa5'
            '6125206b56f365874ba812038dbcd4271f8a73235ab4d211c42b7fd2d636bbc8'
            'a4b9f42bb9fbf59318e01c77a9a498d32fe3f60850f92a9c348a1f375d8f8a23'
            '4f5fd6719234fbc67c517e20e2170db66d37455d69bec880624a0a0304a0e91c'
            '01201e2c2022f0d48b17b7e3745629d110ac689b994ec0c595952561a85fc196'
            '7173e93d9f15285dc5957f51c17f94f643d6bf29026e96d568a252b26ef56f0e'
            '9d45d56744eaa9a2d5745ea95ac2e04c385b37a6bea29322796bcce64b685d2d'
            'a5beaa3851ced23ccee9a3a73c73c0c400ba2d2c8f5212f7776c080ed1774ce2'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            '0e5fcc7df6e30d54350231f4be6e8e9960b00c5dc46297dddf8e6e8de7ddad4b'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            'a15036bb43b6558fbbb7511125f863de226bc31d0fabb29173270e1261fb18c7'
            'cf96ae84ef29434dd20b0f2daca6013373dd6e47c87cde3aa03abce0500a9f03'
            'e1f5935ff59c8fec646878794a789a20e7d23269ea1ea0b95774d25cad5f7038'
            '0db8417b0fd669b95227c266cbc578af1f5e00198fd24f51fee8cfcfccb8b06b'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            '792d29bbb3fdcfdf21face515e6b9fba1a14ee7bdc82f0cff9620592925425c9'
            'c15f4b24688675499c115097d11ba02a4abcfa2cd787066add8703bf2cc54b2e'
            '12081574c11ef21850e9d2cf62580216296a6b7af48f679e6c28e05a376d1f3d'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            '0c7f1847c2a818019123e8d575833774d99fb5f0c36870517ebef9c036948cb7'
            '88cdf771889253831a8873b3234e80cd0b6604bd1fc31a93cff36fa9c2281159'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '7ba5c3246731ea235e3fcc2315e0b862914c20c37b1d87a788c583e7b0bc5b17'
            'e505d99e0051104a74b5d4868080461b1c48e2c45b2a4f083b1cb53e3a32da9b'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            'd88e3663b3e3f4cd7765bc50ba172329001f2611aa798e79dd2eabb97b796fa7'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '0debfc572068aeab2fa4e6e7ba45fc14a402fa735423cc9bbfc5ce94a8cd074d'
            '1a7d08a586c05f35cee816b3a6a4ad807f21d0d8cd04eb4024997b0e89737d2f'
            '09859a379cc6358b289fbd373807cd41779ac54b2e6dc067318b2c4b4dedd779'
            '63e3cc92fb9b5b9181082eb8ba1574a11e4c36272d10930c4bd7610fed17308a'
            '3d3b00e6246b70e016ae365e4ea970d651b3299d7469abc87ef2b359c2c2db31'
            'fafeac9dcf69efb33cfc1ce1083a1bce9b5c45ded23b75f57dc264afa87f5b5c'
            '1578ca03e489a68b8c7b8372139b83637583462b66a9187b1b268ca4605b9d6f'
            'cc419d3646322e44b14e075198f1c0decfb17ecfb4ab32f46b14d31cef7ce85a'
            '865e86583808e267801019efb78a9425a6e685f3ced460fba12f329fdee56b44'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            'f849a0242720e6389140b7d7853e9f56186bac9793aea5e7b9b713d76847c398'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            '0147da77d1c1f9dc735469eff0d17cd6a0fe63b1bcfd10b78cda81c3fb0929ab'
            'f90cb311a300832f764a36141fe4ffbda8d3303787bcc12805acc09066c7ba75'
            'cc74c39e0133905a1f4f264590b44282df4231b73972e7a9708b311e46e00f88'
            'fe2f23319ca61ecb2fac8e586ad71fe36ba340fd4f5c4d0372d0e119d5c264e0'
            '07db0f4f83ec397994c4ef55476ebd6d64c2bd734800ae2eccdb52c37d5b9ce5'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            '9c8de69ad47af04565a89920c08f44694f97d7a16f8f23610e5beaf9f38cb71c'
            '25906418111df0d29db783092d94148e130592d722393ad4bd76809c6f63f9bd'
            '698e598c6f94a46eb9a26020a74d8904def28553157712af8afc3e809771ff25'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            '27a59772403b198d5be1736188455f8a5b0c0d1e6ddbb81eb164e6649710aa85'
            '7b32c27a5513c451032132fe5dc724de23d3b0738a0609a96bd44deee1d46681'
            '9595fd0fb65cbd6a152411617d7564e1f43a76bccb19e19b855c64184d87e707'
            '82003e56072e56ab65267e3366b37a6a75730d846881fe6167965205d1c2549c'
            'e475d42b746955422ff9e905354091d0b17cdb2c8989cc6beb6470e76a4aa1dd'
            'f2aba031573fc4929d2bd9d03e4b18c4385f399fa0b605eca35898567ebdf7b4'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            '3d55fa9e1d628aed3e127b6fb4d3dd47b7ada7b865f683f52e21a51043827479'
            'd1c16289a7869f143d72e6d574d4f27f439fd2fd027064dcce1dd6a6aee75d00'
            '1f3ed3b9c74a3553539687d0797fd29e202e5c00dd465df443420bea36888e4d'
            '486eace860a647e919af3fb83743800b5f47da6bf21ddea8f32729827512f43a'
            '0c82b35ab74b47cb90e37dcffa27a341339567403aa59b7866bee77251878e13'
            '4ecbf454601b3fd2e1b335237efe038024ed30ee01689f5f9198cf37ed794e6e'
            '92ee54e1e707b9dd16ee20c06b9cb24b7e0bc18925366f582b511c01502cfbd2'
            '78f5096d2d425b9663cb289964d994c9a15db7938c5a1a35cc4b286014ca2545'
            'd42b085e33a0961dcc74d9484e67bed481f6a626d9598b0e6d9bae54dd5205ba'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            'dc1206af7485794e1644097b08736e39c8fa50296e514561f8805c6d28b58925'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            '96555b1d6cfa4c9914663aaf4560b63e22b22e4ae9141d073e090e20c74a1163'
            'bdda3911b435ef7c90e202472bd974030c067f50348b355fcc636ddaab862d68'
            '5f18dc2811cc640dfa38cc0907f2c5c3063cbab6bcd40e92107d92dd6058330f'
            '3624b28203c972ea54b490342be74fbd99d4b4748123f9e2837a54ca01c8b392'
            'bd724ee01b93651b4ec6ba62ba64d23e153ea7100be760ccaee4a1e6e32787a6'
            'b7ab046f3d5b0fa2a6f22912bde55a24b09a86586d884ee1260b0084b0880c79'
            '16939f238285647738b1433e61e848bc8a145ec8efaefc28be8e8983bd782da3'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            'e92b08102c29cf48ce0eea0494b138531b57e4bd855a7cd0702d750d8ec1629d'
            'e738263cc30ac53bb1268d07a29f2a0be2f3c0cdfbc3e1c50d31d26cbb627e42'
            '913fc3a85ae676025bafe63880c6413ffafe42495a04a52527ee914ee9ba3ae5'
            '3e0c064bcd499cd9ce7a6c2bb1138c011ca41a1a0baccb5665ff4c283fa9c61c'
            '3787099f99a88ca52e8add69ed9640f23e32dc5a67bebaee3384711469a1bf46'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '02696a90c7831e3fa903df105573c5f10f4934602fb0e90c846fb44213c40b27'
            'd67105e55534b8ef8fa45c70b6bae7c65466ac3c714b7bb3d22a37ce6dbc0502'
            '41409a8253be4422332bbb733af93eabed239f48c37ef28991ae343c48fcde9e'
            'a1a8ca741988049882a84b6e29c514e4534298a548b1e3f7599e6510a5c73dcd'
            '0c9106a2bef658f02b2312d081faad6ba8a72bbb5b4ee1cae7d0a95e4ef53f8f'
            '04a61e218b3a10ec3cf58e3fe12fb2ea23610f03889d19b31b8ccb3b078efd6e'
            '910bc5d9e7523ccd09506bafe3fac586db5106d8cc72d77e8457fdf8b43c225e'
            'd0838256e115347b90379dc4b9844975f6a7070f656376babee995c19d757e12'
            '548c8cd89cf822c790e4703eff53756791450eba73d267a84f3bf3eedf60bef5'
            'fafcc7ce83bd384d41453d98e110c750b75fa635d44fd8a0a08e775390d50fd8'
            'c85f688ff29164880abfa8f35e157f322390d495e66bec057df68b99b7dcffcd'
            'e67cdb017c07a7ec72a06f1062dc2f124d97527869604575fe48610ff98b581a'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            '0a3e32e4f77ff9b1477b382a32278137ba821b2c7d56c42137fa8f51c8f76de5'
            '50b51a692ecacfeac38be03baa0d9a4705249440b6e929f657cecb641d782d24'
            '4f1ce58c65876680af870f90d48b85f8f1cad5663ae843495d89bee1b5d7d5b3'
            '04b46f2082ca88af9e0a4af5f11f452bf222365cd9aebf878885a04e940b4778'
            '902d9c00f2d8731693272cf94fe742beec6d7351eb2603c28c76b40eca58005b'
            'b48490fbcdad8becc160f2dab2ee4a0f67327f1e9d9ddbd96e44150175c68ca9'
            '0b95ed21612b4f02e65643f2029d8ce5710f49dbe8b229350bbe643167a4b83b'
            '785f769c6c0d465f79038ec4f4c210025043285c345041667b122296c6b961e1'
            '149af77a3896e6a2a93383aa6c65e4a7cac0fe90abc909802afdd55f79a0faf5'
            '4610fe2ec6b7b8a8d40b5379921aa9deaa18249b27b150e3f6f2bab8297033c0'
            'f5a6858b8bc3836cf1dfb274c83aad5e3e54235b8e6a3a530eb294533df3ed04'
            'f7f5d15365443cbd8137445c3aedf8ccd31c3402f72c0fa7c16e7bf1c7977139'
            'f8627f5f3a7c119807afc9dc66ce7cb350f905fd1db7fb6b0077552974a07515'
            'ac3f025aa27fec77b24b443df3a69750dc9bb070a40af5180d031b81e66e328c'
            '34158c2a53e1aecd50ed31b8473e45f4f785532b538774a294aacd29c10e928b'
            '8bd1361cf5c6e4e3336cad5b37c79dcc986a46b99e4ad7d679da146dd1fdb7fe'
            '868159a9a965cebd40f98f5995d6ac6361869904712c1b62c6b8a67d10dd93b4'
            '6d5ce5a365dcfdbccf019fd4b5b3971ddb6b71460e0bc97d09fe131793f9a197'
            '4ef4e78fa0174bf25cc5d0373fe716e1b712a2a398c8d57ae32cadc132e44b86'
            '7d89448b9cccc0e2309ce34fef37ed85fd08fd2b030422e456fc531ebb1e8f80'
            'af6701d7ba7465d0d1ac558bc7dae8791a55416ea863dcbc2516e6cf6d533dd8'
            '0f18fde832017387600b5ee2ec6a0ae82125c82b97c0f717772f3cd5dfdcd57b'
            'bbbdf1f65d11a5e6a1f03da5804e555af9c027e76f9dd22135a092f88b8a9b2b'
            '874ecfc831f6e91b43e0af84fead867a9d444d1478ec3f834ec55f2f2b786711'
            'b0a3072cca7d583acaaaaa1c483b74befdc91eb3872bdc6f036f6a467835a826'
            '031a0d9f671e088b3eaeb97d5df90e27a6e45df64901e147f8973d2cf3faa829'
            'aa8bbfcfe4c153bfff99a203d06cf13519423054f745b847855a9df34c5f70fd'
            'c90d55dbff2f09ea9fce383ddaa3987b4fca15537467ee4a9297be18a95244d5'
            'cb023b113d3413928eb16efc78c02c86800279fdfe8d03648d922c07e714f875')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
declare -gA _system_libs=(
  [brotli]=brotli
  [dav1d]="dav1d libdav1d.so"
  # [ffmpeg]="ffmpeg libavcodec.so libavcodec.so libavformat.so libavutil.so" # YouTube playback stopped working in Chromium 120
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  [icu]="icu libicui18n.so libicuuc.so"
  # [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  # [libaom]=aom
  # [libavif]=libavif # libavif.so libavutil.so # needs https://github.com/AOMediaCodec/libavif/commit/5410b23f76
  [libdrm]=libdrm # libdrm.so
  [libjpeg]="libjpeg libjpeg.so"
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
  # needs newer clang to read the bundled PGO profile
  # src/tools/update_pgo_profiles.py --target=linux update \
  #   --gs-url-base=chromium-optimization-profiles/pgo_profiles
  depot_tools/download_from_google_storage.py --no_resume --extract --no_auth \
    --bucket chromium-nodejs -s src/third_party/node/node_modules.tar.gz.sha1

  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  # https://github.com/nodejs/node/issues/48444
  export UV_USE_IO_URING=0

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  ## Upstream fixes

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc \
    third_party/maldoca/src/maldoca/ole/oss_utils.h

  # Drop compiler flag that needs newer clang
  patch -Np1 -i ../drop-flag-unsupported-by-clang17.patch

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../chromium-patches-*/chromium-117-material-color-include.patch

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
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
  )

  # Allow the use of nightly features with stable Rust compiler
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
  export RUSTC_BOOTSTRAP=1

  _flags+=(
    'rust_sysroot_absolute="/usr"'
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
