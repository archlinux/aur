# Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
# for details. All rights reserved. Use of this source code is governed by a
# BSD-style license that can be found in the LICENSE file.

# IMPORTANT:
# Before adding or updating dependencies, please review the documentation here:
# https://github.com/dart-lang/sdk/wiki/Adding-and-Updating-Dependencies
#
# Packages can be rolled to the latest version with `tools/manage_deps.dart`.
# There is some lag time between a commit landing in github and reaching the
# google hosted clones.
#
# For example
#
#     dart tools/manage_deps.dart bump third_party/pkg/dart_style

allowed_hosts = [
  'boringssl.googlesource.com',
  'chrome-infra-packages.appspot.com',
  'chromium.googlesource.com',
  'dart.googlesource.com',
  'dart-internal.googlesource.com',
  'fuchsia.googlesource.com',
]

vars = {
  # The dart_root is the root of our sdk checkout. This is normally
  # simply sdk, but if using special gclient specs it can be different.
  "dart_root": "sdk",

  # We use mirrors of all github repos to guarantee reproducibility and
  # consistency between what users see and what the bots see.
  # We need the mirrors to not have 100+ bots pulling github constantly.
  # We mirror our github repos on Dart's git servers.
  # DO NOT use this var if you don't see a mirror here:
  #   https://dart.googlesource.com/
  "dart_git": "https://dart.googlesource.com/",
  "dart_internal_git": "https://dart-internal.googlesource.com",
  # If the repo you want to use is at github.com/dart-lang, but not at
  # dart.googlesource.com, please file an issue
  # on github and add the label 'area-infrastructure'.
  # When the repo is mirrored, you can add it to this DEPS file.

  # Chromium git
  "chromium_git": "https://chromium.googlesource.com",
  "fuchsia_git": "https://fuchsia.googlesource.com",

  # Checkout extra javascript engines for testing or benchmarking.
  # d8, the V8 shell, is always checked out.
  "d8_tag": "version:10.9.192",

  "gperftools_revision": "bf8b714bf5075d0a6f2f28504b43095e2b1e11c5",

  # Revisions of /third_party/* dependencies.
  # Note that putting an EOL comment after a dependency below will prevent the
  # 'tools/rev_sdk_deps.dart' tool from attempting to rev to a newer revision.

  "args_rev": "da037acc018a8dd267d109eb634454490b7ff759",
  "async_rev": "c59c7c51cc2a1b1fc49a2d853d413bd3a92126e9",
  "bazel_worker_rev": "9f21e1de12d1f7e7450e70b314c81631526c22d0",
  "benchmark_harness_rev": "ee7a253fe11922791379d3849310f0cbcb199d8a",
  "boolean_selector_rev": "5082b3debf97421c071be957063763d98412b2e2",
  "boringssl_gen_rev": "ced85ef0a00bbca77ce5a91261a5f2ae61b1e62f",
  "boringssl_rev": "87f316d7748268eb56f2dc147bd593254ae93198",
  "browser-compat-data_tag": "ac8cae697014da1ff7124fba33b0b4245cc6cd1b", # v1.0.22
  "browser_launcher_rev": "5fa0bd6cddc33785f43c920576fc03dcee1c3caa",
  "characters_rev": "4ffccb88a98c026f3351671479c85a886451dc33",
  "chrome_rev": "19997",
  "cli_util_rev": "edcf1c357dfc92f760ea0f1bbdb94f9b72d26b71",
  "clock_rev": "8a8231fa7912d84c7e99236b7800cfbef5ea7ae5",
  "collection_rev": "efd709fc1760a595f8575f4137a1847de1b49d76",
  "convert_rev": "4feeb10d2f26d22eab461469da0739a57d001edf",
  "crypto_rev": "bf0c33b42eb7e5991ee98429318884695e576c2b",
  "csslib_rev": "34203c09f073ed8267f5d6e333daddb02e6ff609",

  # Prefer to use hashes of binaryen that have been reviewed & rolled into g3.
  "binaryen_rev" : "ec53f4b2d5b0d52ae703c5b696ecf052ad5fffbb",

  # Note: Updates to dart_style have to be coordinated with the infrastructure
  # team so that the internal formatter `tools/sdks/dart-sdk/bin/dart format`
  # matches the version here. Please follow this process to make updates:
  #
  # * Create a commit that updates the version here to the desired version and
  #   adds any appropriate CHANGELOG text.
  # * Send that to eng-prod to review. They will update the checked-in SDK
  #   and land the review.
  #
  # For more details, see https://github.com/dart-lang/sdk/issues/30164.
  "dart_style_rev": "f79a9828ad07e50d6e8352ac154cc16eb4d78d5c", # manually rev'd

  "dartdoc_rev": "1f4221632777d21a7c0d0a0266fe6a495f5170ce",
  "devtools_rev": "c7a81f64dabb4b9f2cae0cf2c9411ef8bb805191",
  "ffi_rev": "17a8142da8114a065e03200467c7657b5368a86d",
  "file_rev": "b768f79dcd104a5feabafab47101c4355b71cd8f",
  "fixnum_rev": "bca3816daf641397f7b5ab9cf865a6d10d30c625",
  "glob_rev": "7f97bf5be6bfe8c90a92283e4c590dba2a676083",
  "html_rev": "28fb8b97acf471bedcfa4eaf38899a0f65d5e30d",
  "http_multi_server_rev": "e31c6988e3869fb4019429254604066338f86095",
  "http_parser_rev": "c73967535ce31120e218120f70ef98cc22688c82",
  "http_rev": "047d6ed015d397be169a7fb892d75141d9bfd58f",
  "icu_rev": "81d656878ec611cb0b42d52c82e9dae93920d9ba",
  "intl_rev": "a127902594a964f2090239fb454adadf7c1a77ef",
  "jinja2_rev": "2222b31554f03e62600cd7e383376a7c187967a1",
  "json_rpc_2_rev": "16fed53fbebd38edf170f58c1da1de2a325b2b98",
  "linter_rev": "7fe671cdadb52139295bae0abf62c014369af93a", # 1.31.0
  "lints_rev": "16bdefe1df529262a6596f79e91003ddbdbd3890",
  "logging_rev": "f322480fb9d9e83e677c08db6d09067059f7ff74",
  "markdown_rev": "ee3f4e976efcfed87c6ec78364bc2dd3c6e717b9",
  "markupsafe_rev": "8f45f5cfa0009d2a70589bcda0349b8cb2b72783",
  "matcher_rev": "15d4af21002ae9adee952110192a3face96307c7",
  "mime_rev": "c0c4c47a3d7bf696f1aa1959fb83d598baadb33c",
  "mockito_rev": "347d3e4cc64752b2ff7b5d35fe5cd1b281b17413",
  "package_config_rev": "abb4aec904ab8c739b6dcec516d44f56d96c8115",
  "path_rev": "12ce876fdd8873128671acfec54c8ad88da361fa",
  "ply_rev": "604b32590ffad5cbb82e4afef1d305512d06ae93",
  "pool_rev": "1ea5b031cfda37786d305292cb8104dffb45d9ae",
  "protobuf_rev": "c181573c330ff0337db0bab5501deda3a42ba028",
  "pub_rev": "21aa23f148a428ae4dd97a27ecc70b08c1328089", # manually rev'd
  "pub_semver_rev": "17231113f98c80285881cc4452863bcfd085d1a8",
  "root_certificates_rev": "692f6d6488af68e0121317a9c2c9eb393eb0ee50",
  "shelf_rev": "1c2104737973715426035c11ba840c7f23d8f186",
  "source_map_stack_trace_rev": "8d8078fcc81c8f7936805cd277198493e0b7fc62",
  "source_maps_rev": "b031e2cdbef5675ab9a92025202d323a5e7cc526",
  "source_span_rev": "d1d47e550b6f77ed9b4907339a8a5e430b9ca314",
  "sse_rev": "8d018dd606f1f8a957c51de16159d532ce664569",
  "stack_trace_rev": "dce00134f6558086e8963e37d0b1ba0830862c01",
  "stream_channel_rev": "914304769d036867b993bd7f9c111145f1ca4ab0",
  "string_scanner_rev": "4a5cbc5c1127151ea507cc9da797b829857607e8",
  "sync_http_rev": "f5c1f18f579752112870fa2f1860470d28c6f605",
  "term_glyph_rev": "822cd5b3418615c6db715a796c2c9ba9acb63b0d",
  "test_descriptor_rev": "13dbc20e9d5c354b670353220c3ab95642ae228c",
  "test_process_rev": "1774aa7a94ebbc60924a7f7174adb02e84458c25",
  "test_reflective_loader_rev": "52b6753852661787208e003f9716b079026c7ac7",
  "test_rev": "b25dac9936c2ea9605b54a3418e0c956937da48f",
  "typed_data_rev": "1e838b8ec85699b5b99e793d004ae315e72fcbc0",
  "usage_rev": "fee1d9d9c295362f6edebfeebb9f8187711c55ab",
  "vector_math_rev": "1eee95b15e5d35cf519514cc253037b19705fb7a",
  "watcher_rev": "32591071a83f632478e702f67e29de6e54428ce9",
  "web_components_rev": "8f57dac273412a7172c8ade6f361b407e2e4ed02",
  "web_socket_channel_rev": "1b0561cfec8ff7e9465896eb340ea3c382b59393",
  "WebCore_rev": "bcb10901266c884e7b3740abc597ab95373ab55c",
  "webdev_rev": "637b406f325669507b5c1048c19a7c0083c1bd6e",
  "webdriver_rev": "336dd3d1208d0b390ac437a785a78760ca7cac7d",
  "webkit_inspection_protocol_rev": "ddb624cd85954dd384056cc253a8fc2b9da5364d",
  "yaml_edit_rev": "299f74594ff9fda412c1da5c0b5d5231d0c6fc42",
  "yaml_rev": "f6992752da8883a4bd9b036063371dca552848cc",
  "zlib_rev": "27c2f474b71d0d20764f86f60ef8b00da1a16cda",

  # Emscripten is used in dart2wasm tests.
  "download_emscripten": False,
  "emsdk_rev": "e41b8c68a248da5f18ebd03bd0420953945d52ff",
  "emsdk_ver": "3.1.3",

  # Pinned browser versions used by the testing infrastructure. These are not
  # meant to be downloaded by users for local testing.
  "chrome_tag": "101.0.4951.41",
}

deps = {
  Var("dart_root") + "/third_party/d8": {
      "packages": [{
          "package": "dart/d8",
          "version": Var("d8_tag"),
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/devtools": {
      "packages": [{
          "package": "dart/third_party/flutter/devtools",
          "version": "git_revision:" + Var("devtools_rev"),
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/markupsafe":
      Var("chromium_git") + "/chromium/src/third_party/markupsafe.git" +
      "@" + Var("markupsafe_rev"),
  Var("dart_root") + "/third_party/babel": {
      "packages": [{
          "package": "dart/third_party/babel",
          "version": "version:7.4.5",
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/zlib":
      Var("chromium_git") + "/chromium/src/third_party/zlib.git" +
      "@" + Var("zlib_rev"),

  Var("dart_root") + "/third_party/boringssl":
      Var("dart_git") + "boringssl_gen.git" + "@" + Var("boringssl_gen_rev"),
  Var("dart_root") + "/third_party/boringssl/src":
      "https://boringssl.googlesource.com/boringssl.git" +
      "@" + Var("boringssl_rev"),

  Var("dart_root") + "/third_party/binaryen/src" :
      Var("chromium_git") + "/external/github.com/WebAssembly/binaryen.git" +
      "@" + Var("binaryen_rev"),

  Var("dart_root") + "/third_party/gsutil": {
      "packages": [{
          "package": "infra/3pp/tools/gsutil",
          "version": "version:2@5.5",
      }],
      "dep_type": "cipd",
  },

  Var("dart_root") + "/third_party/root_certificates":
      Var("dart_git") + "root_certificates.git" +
      "@" + Var("root_certificates_rev"),

  Var("dart_root") + "/third_party/emsdk":
      Var("dart_git") + "external/github.com/emscripten-core/emsdk.git" +
      "@" + Var("emsdk_rev"),

  Var("dart_root") + "/third_party/jinja2":
      Var("chromium_git") + "/chromium/src/third_party/jinja2.git" +
      "@" + Var("jinja2_rev"),

  Var("dart_root") + "/third_party/ply":
      Var("chromium_git") + "/chromium/src/third_party/ply.git" +
      "@" + Var("ply_rev"),

  Var("dart_root") + "/third_party/icu":
      Var("chromium_git") + "/chromium/deps/icu.git" +
      "@" + Var("icu_rev"),

  Var("dart_root") + "/third_party/WebCore":
      Var("dart_git") + "webcore.git" + "@" + Var("WebCore_rev"),

  Var("dart_root") + "/third_party/mdn/browser-compat-data/src":
      Var('chromium_git') + '/external/github.com/mdn/browser-compat-data' +
      "@" + Var("browser-compat-data_tag"),

  Var("dart_root") + "/third_party/tcmalloc/gperftools":
      Var('chromium_git') + '/external/github.com/gperftools/gperftools.git' +
      "@" + Var("gperftools_revision"),

  Var("dart_root") + "/third_party/pkg/args":
      Var("dart_git") + "args.git" + "@" + Var("args_rev"),
  Var("dart_root") + "/third_party/pkg/async":
      Var("dart_git") + "async.git" + "@" + Var("async_rev"),
  Var("dart_root") + "/third_party/pkg/bazel_worker":
      Var("dart_git") + "bazel_worker.git" + "@" + Var("bazel_worker_rev"),
  Var("dart_root") + "/third_party/pkg/benchmark_harness":
      Var("dart_git") + "benchmark_harness.git" + "@" +
      Var("benchmark_harness_rev"),
  Var("dart_root") + "/third_party/pkg/boolean_selector":
      Var("dart_git") + "boolean_selector.git" +
      "@" + Var("boolean_selector_rev"),
  Var("dart_root") + "/third_party/pkg/browser_launcher":
      Var("dart_git") + "browser_launcher.git" + "@" + Var("browser_launcher_rev"),
  Var("dart_root") + "/third_party/pkg/characters":
      Var("dart_git") + "characters.git" + "@" + Var("characters_rev"),
  Var("dart_root") + "/third_party/pkg/cli_util":
      Var("dart_git") + "cli_util.git" + "@" + Var("cli_util_rev"),
  Var("dart_root") + "/third_party/pkg/clock":
      Var("dart_git") + "clock.git" + "@" + Var("clock_rev"),
  Var("dart_root") + "/third_party/pkg/collection":
      Var("dart_git") + "collection.git" + "@" + Var("collection_rev"),
  Var("dart_root") + "/third_party/pkg/convert":
      Var("dart_git") + "convert.git" + "@" + Var("convert_rev"),
  Var("dart_root") + "/third_party/pkg/crypto":
      Var("dart_git") + "crypto.git" + "@" + Var("crypto_rev"),
  Var("dart_root") + "/third_party/pkg/csslib":
      Var("dart_git") + "csslib.git" + "@" + Var("csslib_rev"),
  Var("dart_root") + "/third_party/pkg/dart_style":
      Var("dart_git") + "dart_style.git" + "@" + Var("dart_style_rev"),
  Var("dart_root") + "/third_party/pkg/dartdoc":
      Var("dart_git") + "dartdoc.git" + "@" + Var("dartdoc_rev"),
  Var("dart_root") + "/third_party/pkg/ffi":
      Var("dart_git") + "ffi.git" + "@" + Var("ffi_rev"),
  Var("dart_root") + "/third_party/pkg/fixnum":
      Var("dart_git") + "fixnum.git" + "@" + Var("fixnum_rev"),
  Var("dart_root") + "/third_party/pkg/file":
      Var("dart_git") + "external/github.com/google/file.dart"
      + "@" + Var("file_rev"),
  Var("dart_root") + "/third_party/pkg/glob":
      Var("dart_git") + "glob.git" + "@" + Var("glob_rev"),
  Var("dart_root") + "/third_party/pkg/html":
      Var("dart_git") + "html.git" + "@" + Var("html_rev"),
  Var("dart_root") + "/third_party/pkg/http":
      Var("dart_git") + "http.git" + "@" + Var("http_rev"),
  Var("dart_root") + "/third_party/pkg/http_multi_server":
      Var("dart_git") + "http_multi_server.git" +
      "@" + Var("http_multi_server_rev"),
  Var("dart_root") + "/third_party/pkg/http_parser":
      Var("dart_git") + "http_parser.git" + "@" + Var("http_parser_rev"),
  Var("dart_root") + "/third_party/pkg/intl":
      Var("dart_git") + "intl.git" + "@" + Var("intl_rev"),
  Var("dart_root") + "/third_party/pkg/json_rpc_2":
      Var("dart_git") + "json_rpc_2.git" + "@" + Var("json_rpc_2_rev"),
  Var("dart_root") + "/third_party/pkg/linter":
      Var("dart_git") + "linter.git" + "@" + Var("linter_rev"),
  Var("dart_root") + "/third_party/pkg/lints":
      Var("dart_git") + "lints.git" + "@" + Var("lints_rev"),
  Var("dart_root") + "/third_party/pkg/logging":
      Var("dart_git") + "logging.git" + "@" + Var("logging_rev"),
  Var("dart_root") + "/third_party/pkg/markdown":
      Var("dart_git") + "markdown.git" + "@" + Var("markdown_rev"),
  Var("dart_root") + "/third_party/pkg/matcher":
      Var("dart_git") + "matcher.git" + "@" + Var("matcher_rev"),
  Var("dart_root") + "/third_party/pkg/mime":
      Var("dart_git") + "mime.git" + "@" + Var("mime_rev"),
  Var("dart_root") + "/third_party/pkg/mockito":
      Var("dart_git") + "mockito.git" + "@" + Var("mockito_rev"),
  Var("dart_root") + "/third_party/pkg/package_config":
      Var("dart_git") + "package_config.git" +
      "@" + Var("package_config_rev"),
  Var("dart_root") + "/third_party/pkg/path":
      Var("dart_git") + "path.git" + "@" + Var("path_rev"),
  Var("dart_root") + "/third_party/pkg/pool":
      Var("dart_git") + "pool.git" + "@" + Var("pool_rev"),
  Var("dart_root") + "/third_party/pkg/protobuf":
       Var("dart_git") + "protobuf.git" + "@" + Var("protobuf_rev"),
  Var("dart_root") + "/third_party/pkg/pub_semver":
      Var("dart_git") + "pub_semver.git" + "@" + Var("pub_semver_rev"),
  Var("dart_root") + "/third_party/pkg/pub":
      Var("dart_git") + "pub.git" + "@" + Var("pub_rev"),
  Var("dart_root") + "/third_party/pkg/shelf":
      Var("dart_git") + "shelf.git" + "@" + Var("shelf_rev"),
  Var("dart_root") + "/third_party/pkg/source_maps":
      Var("dart_git") + "source_maps.git" + "@" + Var("source_maps_rev"),
  Var("dart_root") + "/third_party/pkg/source_span":
      Var("dart_git") + "source_span.git" + "@" + Var("source_span_rev"),
  Var("dart_root") + "/third_party/pkg/source_map_stack_trace":
      Var("dart_git") + "source_map_stack_trace.git" +
      "@" + Var("source_map_stack_trace_rev"),
  Var("dart_root") + "/third_party/pkg/sse":
      Var("dart_git") + "sse.git" + "@" + Var("sse_rev"),
  Var("dart_root") + "/third_party/pkg/stack_trace":
      Var("dart_git") + "stack_trace.git" + "@" + Var("stack_trace_rev"),
  Var("dart_root") + "/third_party/pkg/stream_channel":
      Var("dart_git") + "stream_channel.git" +
      "@" + Var("stream_channel_rev"),
  Var("dart_root") + "/third_party/pkg/string_scanner":
      Var("dart_git") + "string_scanner.git" +
      "@" + Var("string_scanner_rev"),
  Var("dart_root") + "/third_party/pkg/sync_http":
      Var("dart_git") + "sync_http.git" + "@" + Var("sync_http_rev"),
  Var("dart_root") + "/third_party/pkg/term_glyph":
      Var("dart_git") + "term_glyph.git" + "@" + Var("term_glyph_rev"),
  Var("dart_root") + "/third_party/pkg/test":
      Var("dart_git") + "test.git" + "@" + Var("test_rev"),
  Var("dart_root") + "/third_party/pkg/test_descriptor":
      Var("dart_git") + "test_descriptor.git" + "@" + Var("test_descriptor_rev"),
  Var("dart_root") + "/third_party/pkg/test_process":
      Var("dart_git") + "test_process.git" + "@" + Var("test_process_rev"),
  Var("dart_root") + "/third_party/pkg/test_reflective_loader":
      Var("dart_git") + "test_reflective_loader.git" +
      "@" + Var("test_reflective_loader_rev"),
  Var("dart_root") + "/third_party/pkg/typed_data":
      Var("dart_git") + "typed_data.git" + "@" + Var("typed_data_rev"),
  Var("dart_root") + "/third_party/pkg/usage":
      Var("dart_git") + "usage.git" + "@" + Var("usage_rev"),
  Var("dart_root") + "/third_party/pkg/vector_math":
      Var("dart_git") + "external/github.com/google/vector_math.dart.git" +
      "@" + Var("vector_math_rev"),
  Var("dart_root") + "/third_party/pkg/watcher":
      Var("dart_git") + "watcher.git" + "@" + Var("watcher_rev"),
  Var("dart_root") + "/third_party/pkg/web_components":
      Var("dart_git") + "web-components.git" +
      "@" + Var("web_components_rev"),
  Var("dart_root") + "/third_party/pkg/webdev":
      Var("dart_git") + "webdev.git" + "@" + Var("webdev_rev"),
  Var("dart_root") + "/third_party/pkg/webdriver":
      Var("dart_git") + "external/github.com/google/webdriver.dart.git" +
      "@" + Var("webdriver_rev"),
  Var("dart_root") + "/third_party/pkg/webkit_inspection_protocol":
      Var("dart_git") + "external/github.com/google/webkit_inspection_protocol.dart.git" +
      "@" + Var("webkit_inspection_protocol_rev"),

  Var("dart_root") + "/third_party/pkg/web_socket_channel":
      Var("dart_git") + "web_socket_channel.git" +
      "@" + Var("web_socket_channel_rev"),
  Var("dart_root") + "/third_party/pkg/yaml_edit":
      Var("dart_git") + "yaml_edit.git" + "@" + Var("yaml_edit_rev"),
  Var("dart_root") + "/third_party/pkg/yaml":
      Var("dart_git") + "yaml.git" + "@" + Var("yaml_rev"),
  Var("dart_root") + "/third_party/webdriver/chrome": {
    "packages": [
      {
        "package": "dart/third_party/chromedriver/${{platform}}",
        "version": "version:" + Var("chrome_tag"),
      }
    ],
    "condition": "host_cpu == 'x64'",
    "dep_type": "cipd",
  },

}
