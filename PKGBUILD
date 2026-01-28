# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://gitlab.com/Matt.Jolly/chromium-patches/-/tags

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=38.8.0
_gcc_patches=140
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
             rustup
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
        chromium-138-nodejs-version-check.patch
        chromium-138-rust-1.86-mismatched_lifetime_syntaxes.patch
        compiler-rt-adjust-paths.patch
        increase-fortify-level.patch
        chromium-140.0.7339.41-rust.patch
        # Electron
        electron-launcher.sh
        jinja-python-3.10.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=140.0.7339.249
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=e14bdcd1f72d62bca1d541b66da43130384ec213
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v22.22.0
        chromium-mirror_third_party_engflow-reclient-configs::git+https://github.com/EngFlow/reclient-configs.git#commit=955335c30a752e9ef7bff375baab5e0819b6c00d
        chromium-mirror_third_party_clang-format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=37f6e68a107df43b7d7e044fd36a13cbae3413f2
        chromium-mirror_third_party_compiler-rt_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/compiler-rt.git#commit=dc425afb37a69b60c8c02fef815af29e91b61773
        chromium-mirror_third_party_libc++_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=adbb4a5210ae2a8a4e27fa6199221156c02a9b1a
        chromium-mirror_third_party_libc++abi_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=a6c815c69d55ec59d020abde636754d120b402ad
        chromium-mirror_third_party_libunwind_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=84c5262b57147e9934c0a8f2302d989b44ec7093
        chromium-mirror_third_party_llvm-libc_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libc.git#commit=6adc0aa946a413c124758a3a0ac12e5a536c7dd3
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=a4cbc4325e6de42ead733f2af43c08292d0e65a8
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=42832178b3b6ae20f0d1c9634c040c528614f45f
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=a8c8a6febe630c6239a5e207530e9fac651ae373
        chromium-mirror_third_party_anonymous_tokens_src::git+https://chromium.googlesource.com/external/github.com/google/anonymous-tokens.git#commit=50b2ee441f1c3bad73ab7430c41fd1ea5a7a06a6
        chromium-mirror_third_party_readability_src::git+https://chromium.googlesource.com/external/github.com/mozilla/readability.git#commit=04fd32f72b448c12b02ba6c40928b67e510bac49
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=9a408736204513e0e95dd2ab3c08de0d95963efc
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=716164239ad6e6b11c5dcdaa3fb540309d499833
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=67be7fddacc4f4bcb21d0cf7bf8bb18752d8fb08
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=00fe003dac355b979f36157f9407c7c46448958e
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=0a0009998fa180695f3e2071805dc03c9a5f3124
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=ff252ff6faf5e3a52dc4955aab0d84831697dc94
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=f5ee589bdaea60418f670fa176be15ccb9a34942
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=0fd1415f0cf3219ba097d37336141897fab7c5e9
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=3de9f013df4b470069d03d250224062e8cf15c49
        chromium-mirror_third_party_cpu_features_src::git+https://chromium.googlesource.com/external/github.com/google/cpu_features.git#commit=936b9ab5515dead115606559502e3864958f7f6e
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=33ed0be77d7767d0e2010e2c3cf972ef36c7c307
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=d3d60ac6e0f16780bcfcc825385e1d338801a558
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=07b9fafa3fff468afa2960789d2b28444c38db3e
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=7d1e2bdb9168718566caba63a170a67cdab2356b
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=725edaaf06b966e670194d0376d50be0c25deb13
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_dragonbox_src::git+https://chromium.googlesource.com/external/github.com/jk-jeon/dragonbox.git#commit=6c7c925b571d54486b9ffae8d9d18a822801cbda
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=81044ec13df7608d0d9d86aff2ef9805fc69bed1
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_fast_float_src::git+https://chromium.googlesource.com/external/github.com/fastfloat/fast_float.git#commit=cb1d42aaa1e14b09e1452cfdef373d051b8c02a4
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=d2d06b12c22d27af58114e779270521074ff1f85
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=8db59321d9f02cdffa30126654059c7d02f70c32
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=86b48ec01ece451d5270d0c5181a43151e45a042
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=27c1cb10a52420515ce66729dfca897be21691b8
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=9f83bbbe64654b45ba5bb06927ff36c2e7588495
        chromium-mirror_third_party_ink_src::git+https://chromium.googlesource.com/external/github.com/google/ink.git#commit=4e6081ad7052f97df7d77e1d87cea2d70c18a47b
        chromium-mirror_third_party_ink_stroke_modeler_src::git+https://chromium.googlesource.com/external/github.com/google/ink-stroke-modeler.git#commit=fe79520c9ad7d2d445d26d3c59fda6fc54eb4d5c
        chromium-mirror_third_party_instrumented_libs::git+https://chromium.googlesource.com/chromium/third_party/instrumented_libraries.git#commit=69015643b3f68dbd438c010439c59adc52cac808
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=955936be8b391e00835257059607d7c5b72ce744
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=c05bf9be660cf170d7c26bd06bb42b3322180e58
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=373af2e3df71599b87a40ce0e37164523849166b
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=1b2e3e8a421efae36141a7b932b41e315b089af8
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=4ee78d7ea98330f7d7599c42576ca99e3c6ff9c5
        chromium-mirror_third_party_domato_src::git+https://chromium.googlesource.com/external/github.com/googleprojectzero/domato.git#commit=053714bccbda79cf76dac3fee48ab2b27f21925e
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=2610f7b1043d6784ada41392fc9392d1ea09ea07
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=e91b7aa26d6d0979bba2bee5e1c27a7a695e0226
        chromium-mirror_third_party_crabbyavif_src::git+https://chromium.googlesource.com/external/github.com/webmproject/CrabbyAvif.git#commit=644c9d84c123ac811a611760a9adc807e3eb5be5
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=a8889d12a27ef7006d1a47dfefc272e0815f5c41
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_jetstream_main::git+https://chromium.googlesource.com/external/github.com/WebKit/JetStream.git#commit=fe1f348226d4b7c3447e606577960a606cc058e4
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros-components_src::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=7ccdbf60606671c2c057628125908fbfef9bd0c8
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=ad78bb591d02162d3b90890aa4d0a238b2a37cde
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=69d6c054c1bd5258c2a13405a7f5628c72c177c2
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=2209bb84a8e122dab7c02fe66cc61a7b42873d7f
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=e14cbfaa85529d47f9f55b0f104a579c1061f9ad
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=9d46308f313f2bf8dbce1dfd4f364633ca869ca7
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=7bf98f78a30b067e22420ff699348f084f802e12
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=a52756acb1c5e133089c798736dd171567df11f5
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libva-fake-driver_src::git+https://chromium.googlesource.com/chromiumos/platform/libva-fake-driver.git#commit=a9bcab9cd6b15d4e3634ca44d5e5f7652c612194
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=a985e5e847a2fe69bef3e547cf25088132194e39
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=f2a982d748b80586ae53b89a2e6ebbc305848b8c
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=4fa21912338357f89e4fd51cf2368325b59e9bd9
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=cdd3bae84818e78466fec1ce954eead8f403d10c
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ed31caa60f20a4f6569883b2d752ef7522de51e0
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=13434b50dcb64a482cc91191f8cf6151d90f5465
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=e2c93c34982b286b27ce8b56dd7159e0b90869a2
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=eb8b80b28f956275e291ea04a7beb5ed8289e872
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=652bdb7719f30b52b08e506645a7322ff1b2cc6f
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=f51be2dd676c855bc588a439f002bc941b87db6b
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=57572a0e91890fe7183de25a62153aec955d64ba
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=1afaa1a380fcd06cec420f3e5b6ec1d2ccb920dc
        chromium-mirror_third_party_perfetto_3b5d0997::git+https://chromium.googlesource.com/external/github.com/google/perfetto.git#commit=4ab725613a8ee64e9acd7930eceb8995e24df562
        chromium-mirror_third_party_protobuf-javascript_src::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf-javascript.git#commit=28bf5df73ef2f345a936d9cc95d64ba8ed426a53
        chromium-mirror_third_party_pthreadpool_src_934f177b::git+https://chromium.googlesource.com/external/github.com/google/pthreadpool.git#commit=149f0a86f5ad215e9f0441684385ce09f345dbe4
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=ed3deb8a056b260c59f2fd42af6dfa3db48a8cad
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=8451125897dd7816a5c118925e8e42309d598ecc
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=9940fbf1e0c0863907e77e0600b99bb3e2bc2b9f
        chromium-mirror_third_party_search_engines_data_resources::git+https://chromium.googlesource.com/external/search_engines_data.git#commit=5c5db51f8c13cb42379d8b333890971f1a1a1797
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=f3ff281f2330f2948888a9cc0ba921bbdc107da8
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=0ff96f7835817a27d0487325b6c16033e2992eb5
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=32ded457c0b1fe78ceb8397632c416568d6714a0
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=cc08c79629643fdd5b592f1391e738815f5577b6
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=fdb6700ecb04103b658d2e4623d6bc663ba80ea8
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=fe38b1b8c23d86ed93c13ef367b19496e398462d
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=c466059b72815c7fbce8bb3ab4832407aabc5dc5
        chromium-mirror_third_party_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=38f6708b6b6f213010c51ffa8f577a7751e12ce7
        chromium-mirror_third_party_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=b8fcf307f1f347089e3c46eb4451d27f32ebc8d3
        chromium-mirror_third_party_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=97e96f9e9defeb4bba3cfbd034dec516671dd7a3
        chromium-mirror_third_party_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=3aeaaa088d37b86cff036eee1a9bf452abad7d9d
        chromium-mirror_third_party_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=a01329f307fa6067da824de9f587f292d761680b
        chromium-mirror_third_party_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=f2389e27734347c1d9f40e03be53f69f969976b1
        chromium-mirror_third_party_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=f766b30b2de3ffe2cf6b656d943720882617ec58
        chromium-mirror_third_party_vulkan-utility-libraries_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=b0a40d2e50310e9f84327061290a390a061125a3
        chromium-mirror_third_party_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=6b1b8e3d259241a68c0944ca0a7bb5320d086191
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=cb0597213b0fcb999caa9ed08c2f88dc45eb7d50
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=a156431ea66fe67d69c9fbba8a8ad34dabbab81c
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=efbc060534be948b63e1f395d69b583eebba3235
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=1e954903022e9386b9acf452c24f4458dd4c4fc1
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=c01b768bce4a143e152c1870b6ba99ea6267d2b0
        chromium-mirror_third_party_webpagereplay::git+https://chromium.googlesource.com/webpagereplay.git#commit=eebd5c62cb5c6a5afbb36eccdcc3b3e01f28adc9
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=36ea4535a500ac137dbf1f577ce40dc1aaa774ef
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=e3f919ccfe3ef542cfc983a82146070258fb57f8
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=bdba2f9adaca673fd58339d8140bc04727ee279d
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=cb54d9db2e535ee4ef13cc91b65a1e2741a94a44
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=ae40b1a2d93d5c516bc7657c6c3eea1470f917ae
        chromium-mirror_third_party_zstd_src::git+https://chromium.googlesource.com/external/github.com/facebook/zstd.git#commit=f9938c217da17ec3e9dcd2a2d99c5cf39536aeb9
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=b7ed978e41b4bac7802b206404d0e2f3d09f31ac
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=6edcf02205fd1e8979dc3f3964257a81959b80c8
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=ad59a18f2ce08e60c9f4ab0aaf9b62679ab8c626
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=bb0dbc354cf9dd386f59a4db38564a21be756cd9
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=c734cf94f4e1501e80663319392cfbe0ce26dbb1
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=7ade8a8f2a759b822022560e08d49b33a2e8496d
        chromium-mirror_third_party_dawn_tools_mb::git+https://chromium.googlesource.com/chromium/src/tools/mb.git#commit=6c50647ee969539f9371fafdeeb38d6b2c13dc34
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=e2d024354e11cc6b041b0cff032d73f0c7e43a07
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0bad08bb207bbfc1d6f3bbc82b9242b0c50e5794
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=b35641f4a3c62aa86a0b3c983d163bc0fe36026d
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=209717dd69cd62f24cbacc4758261ae2dd78cfac
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=cae4b6a3990e1431caa09c7b2ed1c76d0dfeab17
        chromium-mirror_third_party_dawn_third_party_dxc::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectXShaderCompiler.git#commit=50764bac3d4048144e9ada5f5a742c82cc97cc9a
        chromium-mirror_third_party_dawn_third_party_dxheaders::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectX-Headers.git#commit=980971e835876dc0cde415e8f9bc646e64667bf7
        chromium-mirror_third_party_dawn_third_party_khronos_OpenGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenGL-Registry.git#commit=5bae8738b23d06968e7c3a41308568120943ae77
        chromium-mirror_third_party_dawn_third_party_khronos_EGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/EGL-Registry.git#commit=7dea2ed79187cd13f76183c4b9100159b9e3e071
        chromium-mirror_third_party_dawn_third_party_webgpu-headers_src::git+https://chromium.googlesource.com/external/github.com/webgpu-native/webgpu-headers.git#commit=c8b371dd2ff8a2b028fdc0206af5958521181ba8
        chromium-mirror_third_party_dawn_third_party_protobuf::git+https://chromium.googlesource.com/chromium/src/third_party/protobuf.git#commit=1a4051088b71355d44591172c474304331aaddad
        chromium-mirror_third_party_dawn_tools_protoc_wrapper::git+https://chromium.googlesource.com/chromium/src/tools/protoc_wrapper.git#commit=8ad6d21544b14c7f753852328d71861b363cc512
        chromium-mirror_third_party_dawn_third_party_partition_alloc::git+https://chromium.googlesource.com/chromium/src/base/allocator/partition_allocator.git#commit=2041003ba674f918c33b1afaaad74e652f34bcea
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        # END managed sources
        )
sha256sums=('4a565380e171d283ae55f4e3b4dad5adeb9eff0a0e33d805eca2101531e925ae'
            'e8b1c431dd64442bacaf8e1db57faf442c510e67d171ebc6e887aee8c6aa3f9f'
            '11a96ffa21448ec4c63dd5c8d6795a1998d8e5cd5a689d91aea4d2bdd13fb06e'
            '5abc8611463b3097fc5ce58017ef918af8b70d616ad093b8b486d017d021bbdf'
            '75681c815bb2a8c102f0d7af3a3790b5012adbbce38780716b257b7da2e1c3d5'
            'd634d2ce1fc63da7ac41f432b1e84c59b7cceabf19d510848a7cff40c8025342'
            '0eb47afd031188cf5a3f0502f3025a73a1799dfa52dff9906db5a3c2af24e2eb'
            '13fcf26193f4417fd5dfbc82a3f24e5c7a1cce82f729f6a73f1b1d3a7b580b34'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            '991e54f4490cdbb5e52c9a4a4f6e0e32f2fc95979f18a4736016d065da229c2e'
            '7135a7cd88d24febf39f1551a85358f6c7e46a7e15f63aed873ce0f52d3c2313'
            '564da0ed433d616754b3107f36ae3e8a62e5232815d51a4d9d5ce670f4e63075'
            '0b7a546ee6913c49519c10c293ac530ff381641a8a465fa2e184d6dbe0fb784d'
            '15355f12077d5751500bfb1a427ed37df12a7abdddc9f979ccd44751ff7a2c01'
            '3522166c3ca75316a172b7cc4fe12bba9367e30fed16df8193ede2e236dca8c5'
            '60935b226794933e881973746d892eb6fb7b7d596bf6cf9ff3c4f2da56240a9b'
            'ebc1cc4b588db5f466f5a65b5abd4b33823fc7f91f91f5dd5e78d46f4bf67194'
            'b7556d40a7382ce1208823dbe633e42e323c8068c6de88246807253ac9dbc0a3'
            '4a02f0cfabd5b2f5e1abed767ba4aa6884425cc680173fc7461e7c8c276ea8b0'
            'a59b8785271f040cf2b2432fb50b007b71cb0153a7fc870f7320d6950c39f359'
            'ffd063f3fe9351028c0ead687918f95c29d6042d21e0a2eb343e110315c9ea96'
            '9ad7f930cde7fd9827eec7f08feb4304e85cf41f53155d4072f120cece6c2ea4'
            'fc023d22307ce5c86e66202b625a9fb14b3bf899ac9f6c6f95f5f56b7e0f2574'
            'fb9ea9a9e61f95bb984f2267561ccd77c29a7f29adad2ac0b0e2bd2ded1ba08a'
            '239ecb0e44f8ea029a02b445a693d0b47db35a9e1c46d9fd0c8b2c57c90165d0'
            '928f7a40f6bd62a9f1340148f4ab9bf4ea311619c9b5e79492f15174ac82b14f'
            '89a368f0652d857d38402d6f3c5cded3c1757230ab7abe01df850a7bf8359119'
            'b2b03c9aaf02ef2fc4cd96a9e4a877f629d5eb3ad14b8bef638bc9a89442a34a'
            '8c09be4d85e29f433a96c349e308ee0fc44173405659597d6f36e8c6955e05ff'
            '5f359dae10e80599f26483879b879d7a6808520d4a56c98ee0879373a6339619'
            '05c439ece388418dac05f5b7a61999e02f7de1364d4751eceb99d11efa62f100'
            'b0386716278a3a26bec8c778d313460541a8ca3719637a60bea734acf20f36db'
            'da13009001bb6b7a47ac1351b017c2c37320b9a3290f222d3d82b583b630d49a'
            '6f2d34239940cac02ff98ee59ad9409024e897a4aa753382fe713a5e38f0d0e8'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '9e950d9f0bf7f0b52de6744de0922583b4b32281e87f0488c2d1cfc533665aa5'
            '6125206b56f365874ba812038dbcd4271f8a73235ab4d211c42b7fd2d636bbc8'
            '65c3e8971b0de23b74f206643dc043e9250ac085de61986b73f27a2172ee4dc9'
            '6ae7ae01b3c23f8bf7657a59427aac6f3216e041ebdb983b82c002a949bdb071'
            'b4019ad80144359654e27ec52413b7b6d19cfb9e92e99c1e573a77fad95432d7'
            'dabae27ddc8cafec0fcc1e4a5460f543e7be0c3dedd2c30fda329d8517e286a2'
            'ee9abeed726ec427207ca9fbb999cb2dd511440f39aa4a25260d3c11a166bc74'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            '7a6c373f8694e540f5a767b315670ccef5526baa41f5427f02db2e4bf261765c'
            'c967ef4e18421ca05e66858c6faff1e89ba68a5769555ff896bba824db9c1a2e'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            'be05ebb53b7468e246aac2a22d1ce748c25e2e0cc5d0227e16272a00827092ff'
            '491c843c8d3a1ce935d835ea1b20687e8537c1eb888cb9d53ddd7f5c4844ab5f'
            'cf96ae84ef29434dd20b0f2daca6013373dd6e47c87cde3aa03abce0500a9f03'
            '7df2a26df1b8e69c58692295443e18de9f19bc0107bd5911beed53157a592ad3'
            '5aa43c529c57c85fab7c3b5b4742190c9ed31364c82c561285ae42371437033b'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            '8f8a34ab4f5b926ede42c686f90a7fcdf9e5956cb2fd6d06158cf2fdb0c69a22'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            'aeed970f57904ef9f3b2feee5c50699bd6266b094d10ce53d4bc73a3c82df84a'
            'f2ad931b56c8ac5e9b69a149aa0383ee738de0936b072b77b67fe57a88834b62'
            '4b60993f806163589f46dde162fe6750fcaafcdc72dde611002a05d50aaa63b4'
            'c3db1069a0f69cb2b6cacaaa5a43333799e69a07282b53c5f45383e086833258'
            '66004b44318ad7e4329d65b08320136ee8a9f074b7b001107c52377493d28cc0'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '488513b955f90b0f965be248631fedab0f27714c49632eb58389c2ff18815199'
            '0ea0dc558d6906339f4228c82f41ece7befd2c122617c176e64a6953a7470a8e'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            '00d5076c4d326efc38df2c34e0748ef8941420b32de498d668ddf4b7392b9f8b'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '2c21c74e00540f211bb57b33e8644f8ab2ec511b7b905b432acc163d898cca34'
            'c2eb3aee5d91aa9d80d651d5bc26ae729e9a5bdd2f62985ca394cebac5b8174f'
            'bb19e0319273e64c3eda91786d1bb1c6038cc90e1380c56abcb96a62e29d46ee'
            'e284fdce7f2d24dbaca505954636457f1f99f9b1a243cbe42f0998b3a6a2c8bb'
            'bd6325744640ea931f28552aab098102954f8aaabf27477f7e1256491fe15d68'
            '162041dfe2f23301701cd7f8fe2f97d2103d28380bdaf2cf521291cb4d43e7b2'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            '23eeb3adf584ee67b22e145f9e2e6f1ffb16e12bfef43b9f7bbbcd8dcb7dd8bd'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            '373fa9a68a59fa75922b7c7b14fad0a35703d638e2877d9be31f2d2bc908fb01'
            'ae2c189d21dcd056116ee1c3d54b5ae3874e5ac0cc2086c137625b618334cbb1'
            '7101212454ccddf53d69525cf105f0fd6795fd9b1fd948f8c96ac73ce512c41d'
            'fe2f23319ca61ecb2fac8e586ad71fe36ba340fd4f5c4d0372d0e119d5c264e0'
            '080009891e90088f91c9a4fae711fa2bf56599719480e17b108047089798e16e'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            'cf14b8dbbde77c5a844eb06b1869c40342ea41bf1bff8b112ab388729a92f3e0'
            'cb8390c0d03bea1724a2f0c822b46331ff2fd5eac5bbe216f5d229c2c859ee75'
            '867f9d88a2146f54979508a670f28f681c729dd144956941066a422714fbd8c7'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            '7b81837265657fa3404c93b2de8d5735265dfecc52ec9e5a3157ef4a14cfdba1'
            '0ad5855df9985226a0dac1dabce7eac5bb02fd8e3ef01816931969fa118d9413'
            '9f978082cb3c37055d199dd8937a56c5114fa26807c1cbdd8b80d62f4ce0388c'
            '00baa1fb188900d89fa3b7a736e1fb93c2fc8c1a49b6038741311525991d35ae'
            '6291c7fb4d0b96939ce276cc046ba9ea8e84ed6ce98e68c5e11ef8bf07ea7b51'
            '25bc4bf11c958537b4e725542fae58fc1ec00800306cdd70f3c5f94e1a5180df'
            'f2aba031573fc4929d2bd9d03e4b18c4385f399fa0b605eca35898567ebdf7b4'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            '7a213d279ebb40cb7d53f637f9c5f86bed396788c1d7db736846cb7275eb5477'
            '34f643fd7cf56634ef1fe040568ebc42329cb8645c98933087a98136468ab671'
            'af96173677a5d2e66a60c0aca3d53e108ead7d4d2007b4ef38b7173131d91447'
            '4f3c44366b5d694d88fff949acf94e850301cb102a9a34598ea0006ac7d70e50'
            '632d427e50354b5208a34f14e5751d504656159bdcfb831f86e4b751b8eadc1d'
            'c306d3aa67897070ed002a1dba2367bf0f74f7c0a03a30da51ef3934aea290a4'
            'bf825a14ee4b31a4db4613d1a631bc9b894499840fd8870d482820e86b6cf9eb'
            '4eebcfc0488456441b8790d08153c9759c2649acbd23d2293d78cf6dd88f76fb'
            '1949d8e6e4cff7a98930047bee675728870c643fffbf9b8da9a3f530ab60e831'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            'b641f9f95d9c7b231fc291ee5c1ef5e1badc727200f6dece4a32b92ca730b3df'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            'b0fd89795b3e4d65c72e78f43246589371f9bff04d5f4db290895d587ad3968f'
            'c3419592b3b900c98f91fc99bed715c8b24b1f5f885a3eeb593e88389868a825'
            '75ffcf38c7e70f83fddceef83e39036beb829d6651ac2bf1fdbfacd330cf3241'
            '45366e8fc511d803ed186476d65bb6234d1e01fddb96b21d5fc10a916f0435bc'
            '4ebe3ffd4fcd7b1057ce72b0439638c43aa8825040be30b11b8b5a5101a06bb0'
            'b07116bf69c635b29f36e097c97445200042b713d5ac8b64a4b95777aa6fc7ee'
            '7a672fca11999768b4d1dfa8fc653d4f030c135e3ce500236ed24a8ffb76e44b'
            'c8ee01adc450e25ad3a17fdcd0de78219227d8bc381428887b20e07e44477f96'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            '236bb182e2cf594f8315a843c47460fc480787d2c74993968bddf406fa2e7008'
            '83bb992554ac84e59a2bf9c2cfe8b45cbfe7f4aea5bfc971c68bc9e6b3746fa6'
            '96e0c213f740604e2bf09019b0ddb4b00d3ee11185a80c9412bb07ace4e7d59f'
            '0f18fde832017387600b5ee2ec6a0ae82125c82b97c0f717772f3cd5dfdcd57b'
            '6eee88bed9a6741d96f3244c43d6409bfb84604b24cf495eb8f9e6bebf98e854'
            '06d87f99b7754bbe01a477bef9f78fda5087ed53917bf86751936b1b7a0ee99e'
            '75a1495b086b3e92cef942a68a6bafbf165d4a704ac39f9ad9cc8a732a14ce39'
            '3460319abd86d357c409bb62cd64a5dddc11d7161249a080d142f00a6d576af3'
            '19012a64e94fe4520638997d9135bb93f4bcb43fc5266642d9e3fbc2c5372a7b'
            '82b30e51ea2bee9d325c74517e42ceba2969a2f3b7580ab6cc68df778f7c0ad5'
            '087eaa129ac44b8268ed162e3a64c0159249b8b83412e760ab5c23141691c780'
            '0fad74d05a770f8211e8bdbc81a62914d528f1c6e9e94e7f18a5ed17c8d786d8'
            '8ee0bade4127e082dc1ae86f0068aa32ea0fbce26069ed2d9dbdef324e1bb980'
            '90ebdcba3ae5996e34f409049b704907739bb68f5eb416d5ef3a8abbbac4b059'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '1a51c51f2edfe8330e18ec3febc7fc835502e840c993dec2de6f06ac9138f666'
            '91ef8477f7d670d88f4d8bdeca47aa3b661f6a359fe8ac973bcdf2315affdcda'
            '847edfdffb47af22efcd536ea1e1080e7db94655c4badcc2e827bd73c148c45e'
            'bfa5eb10b0dd2957a89a99b26d25cec72d8f137b9d7dab992c4da6eaf506c262'
            '0c9106a2bef658f02b2312d081faad6ba8a72bbb5b4ee1cae7d0a95e4ef53f8f'
            '0ea6a535e827f911ce8360c0a7e6243872a98cbe8b2eeaf7cc31ed0f2e8e8e20'
            '910bc5d9e7523ccd09506bafe3fac586db5106d8cc72d77e8457fdf8b43c225e'
            '1bb64fb94b22311046998faee06cbd7565265e5d8f1842d6925710437b0e3129'
            '5d472d5395430fb75d7e47c3c87348694473e5956254ea7a9c01e724fd52aec6'
            '29b4951a683e57a229c4e27852b3f639d44b3b2addff106546f242437d3e061c'
            '4dfc3a5c54acbdafd4c7ab2826756ac2e69521350ab7f8b80b7ad374ce7ac84f'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            '13f7e8cd1d8e824e36ab1efc955fe8d4386d61a5785334c23c6d2534d83516ea'
            'e68c96ec8dd006c2e39ba9c9178b3db0cd1ae29f71e224d3e121fff30c61e22a'
            '8d57734ca958bacdc41b6c485de983a99e396d4c6a4545fcb1ab94bcb0cb8dbb'
            '29a741ec7a010fbbe50cd19193acc01af51a6a4256fe1a638328107bf1867184'
            'd672246ba0ed6e7699bd3effd6949d22f4dd42ba74bb2ac0064b7e03d6322877'
            'b48490fbcdad8becc160f2dab2ee4a0f67327f1e9d9ddbd96e44150175c68ca9'
            '0b95ed21612b4f02e65643f2029d8ce5710f49dbe8b229350bbe643167a4b83b'
            '9bd1e05f5128b4715c2d354a6895839d01aae4fc9f56b9d0411afc87fb46daf4'
            '3ae63a893b5b585823f04b5a2e604d3df4c7c6e311f5da5b5d5af92a1fd00465'
            '812f67ab2c4269b101df3af90a452867398a668b46c4997cbbde4fffe6c5cbfa'
            '0cfde248f53224091fe0267ac78d84b751fa1281fcafdd0878af57b85b0e348e'
            'f7f5d15365443cbd8137445c3aedf8ccd31c3402f72c0fa7c16e7bf1c7977139'
            'f8627f5f3a7c119807afc9dc66ce7cb350f905fd1db7fb6b0077552974a07515'
            'ac3f025aa27fec77b24b443df3a69750dc9bb070a40af5180d031b81e66e328c'
            '383ef84c932577093c239feb7d00f61af647720ef0607e0ccecda576d7529164'
            '0a7ed0c582fe5052af854675b065a5f1b3440b66906343359abee5214c316e2f'
            'c78207d508b9c3314395d294324285fb4a2d8c4e3250818b0558b8491f8f56ac'
            'da0cf693fd872a927776670eed4a53f31cfcf9a02e38d01573caead33dfa83b9'
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
  # Switch back to regular Rust package on Chromium 142
  rustup toolchain install 1.89.0

  sed -i "s|@ELECTRON@|${pkgname}|" electron-launcher.sh

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

  # Upstream fixes

  # Fixes from Gentoo
  patch -Np1 -i ../chromium-138-nodejs-version-check.patch

  # Fixes from NixOS
  patch -Np1 -i ../chromium-138-rust-1.86-mismatched_lifetime_syntaxes.patch
  patch -Np1 -i ../chromium-140.0.7339.41-rust.patch

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Increase _FORTIFY_SOURCE level to match Arch's default flags
  patch -Np1 -i ../increase-fortify-level.patch

  # Fixes for building with libstdc++ instead of libc++
  # patch -Np1 -i ../chromium-patches-*/chromium-140-compiler.patch

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -sfn /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  mkdir -p third_party/jdk/current/bin
  ln -sfn /usr/bin/java third_party/jdk/current/bin/
  ln -sfn /usr/bin/clang-format buildtools/linux64

  # Electron specific fixes
  patch -Np1 -i "${srcdir}/jinja-python-3.10.patch" -d "third_party/electron_node/tools/inspector_protocol/jinja2"
  patch -Np1 -i "${srcdir}/use-system-libraries-in-node.patch"

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
    'fatal_linker_warnings=false'
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
  ln -sr -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    "${pkgdir}"/usr/lib/${pkgname}/{LICENSE,LICENSES.chromium.html}     

  install -Dm755 "${srcdir}/electron-launcher.sh" \
    "${pkgdir}/usr/bin/${pkgname}"

  # Install icon file
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}
