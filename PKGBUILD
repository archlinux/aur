# Mantainer: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: T. Jameson Little <t.jameson.little at gmail dot com>
# Contributor: Usagi Ito <usagi@WonderRabbitProject.net>
# Contributor: siasia <http://pastebin.com/qsBEmNCw>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=dart-system
_pkgname=dart
pkgver=2.19.0
pkgrel=2
pkgdesc='The dart programming language SDK (Bug https://bugs.archlinux.org/task/77107)'
arch=('x86_64')
url='https://www.dartlang.org/'
depends=()
license=('BSD')
makedepends=('setconf' 'clang' 'gn' 'ninja' 'dart' 'python')
source=(".gclient"
        "DEPS"
        "git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "git+https://dart.googlesource.com/sdk.git#tag=$pkgver")
sha512sums=('23d1fc8ab529a5a12894aed5ccfc2d511d02f3a484bd7ed634a69e0f52b22b4f8ac071bfe3c161f8b93e6cc8af932726dc76d05c96154ab5f5dde65ad55b78cf'
            'd6f5304be2d3ac6019369782850fe55839294761c85d244285c9cdbbff1f153824f9ca6accb7ee0214c2766b4b70a0977767c8b54475758c167226605fb86060'
            'SKIP'
            'SKIP')
provides=("dart" "dart-sdk")
conflicts=("dart" "dart-sdk")

prepare() {
  cd $srcdir
  sed -i "s|'error'|'debug'|g" depot_tools/gclient_scm.py
  export PATH="${srcdir}/depot_tools:$PATH" DEPOT_TOOLS_UPDATE=0
  cp DEPS sdk/
  echo "If it fails on next command, try to uncomment the next line on the PKGBUILD, forcing re-fetch and re-build everything"
  #rm -rf $srcdir/sdk/*
  python depot_tools/gclient.py sync --no-history -nDv
}

build() {
  cd $srcdir/sdk/
  mkdir -p out
  if [ -f toolchain.ninja ]; then
    rm out/toolchain.ninja
  fi

  # ------
  # Credits: Lauren N. Liberda <lauren@selfisekai.rocks> on Alpine Linux

  # shut up on clang
  mkdir -p buildtools/linux-x64/clang/.versions
  echo '{"instance_id":"system"}' > buildtools/linux-x64/clang/.versions/clang.cipd_version

  # bind bootstrapped interpreter
  mkdir -p tools/sdks/dart-sdk/bin/
  ln -sf /usr/bin/dart tools/sdks/dart-sdk/bin/dart
  ln -sf /usr/bin/dart2js tools/sdks/dart-sdk/bin/dart2js
  # ------

  git checkout HEAD -- build/toolchain/linux/BUILD.gn
  sed -i 's|prefix = rebased_clang_dir|prefix= ""|g' build/toolchain/linux/BUILD.gn # use system clang
  sed -i 's|}/|}|g' build/toolchain/linux/BUILD.gn # use system clang
  sed -i 's|rebase|#|g' build/toolchain/linux/BUILD.gn

  dart tools/generate_package_config.dart
  python tools/generate_sdk_version_file.py

  /usr/bin/gn gen -qv out --args='target_os = "linux"
                        host_cpu = "x64"
                        target_cpu = "x64"
                        dart_target_arch = "x64"
                        dart_use_compressed_pointers = true
                        dart_use_crashpad = false
                        dart_snapshot_kind = "app-jit"
                        dart_debug_optimization_level= "2"
                        dart_use_fallback_root_certificates = true
                        dart_use_compressed_pointers = true
                        dart_use_tcmalloc = true
                        dart_use_mallinfo2 = true
                        is_debug = false
                        is_release = false
                        is_product = true
                        dart_debug = false
                        dart_runtime_mode = "release"
                        exclude_kernel_service = false
                        is_clang = true
                        dart_vm_code_coverage = false
                        is_asan = false
                        is_lsan = false
                        is_msan = false
                        is_tsan = false
                        is_ubsan = false
                        is_qemu = false
                        dart_platform_sdk = false
                        dart_use_debian_sysroot = false
                        verify_sdk_hash = false'

  sed -i 's|ldflags}|ldflags} -fuse-ld=lld|g' out/toolchain.ninja # use system ldd
  ninja create_sdk -v -C out
}

package() {
  # cd to directory
  cd $srcdir/sdk/out/

  # Create directories
  install -d "$pkgdir"{"/opt/$_pkgname-sdk",/usr/{bin,"share/doc/$_pkgname"}}

  # Package the files
  cp -a "$_pkgname-sdk/"* "$pkgdir/opt/$_pkgname-sdk/"

  # Set up symbolic links for the executables
  for f in dart dartaotruntime; do
    ln -s "/opt/$_pkgname-sdk/bin/$f" "$pkgdir/usr/bin/$f"
  done

  # Package documentation
  install -Dm644 "$pkgdir/opt/$_pkgname-sdk/README" -t "$pkgdir/usr/share/doc/$_pkgname"

  # BSD License
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
