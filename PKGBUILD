# Maintainer: Martin Alstrup <martin@rcz.dk>
pkgname=triforce-oot
pkgver=0.6.0
pkgrel=2
pkgdesc="Triforce build tools"
arch=('x86_64')
url="https://triforceproject.com"
license=('GPL-3.0-or-later')
depends=(
  # nx2/make_game.py and the compile
  'python' 'python-lz4' 'python-numpy' 'python-capstone' 'python-unicorn' 'python-zstandard'
  'clang' 'lld' 'glslang'
  'vulkan-headers' 'spirv-headers'
  # what the built game links (FFmpeg, for the movies) and loads (SDL3, Vulkan)
  'ffmpeg' 'sdl3' 'vulkan-icd-loader'
  'hicolor-icon-theme'
)
makedepends=('git' 'imagemagick')
# (nx2/prompt_requirements.txt: without them the game still builds, with the Switch's button prompts)
optdepends=('python-pillow: PC controller and keyboard button prompts, drawn at build time'
            'python-fonttools: PC controller and keyboard button prompts, drawn at build time'
            'libnotify: desktop notifications while the game updates from the menu entry'
            'zenity: error dialogs when started from the menu entry')
install=triforce-oot.install
# (VulkanMemoryAllocator is in no Arch repository: its one header comes along, at the version upstream's AppImage uses,
# scripts/linux/deps.sh VMA)
_vma=3.3.0
source=("triforce::git+https://git.triforceproject.com/triforce/source.git#tag=v${pkgver}"
        "VulkanMemoryAllocator-${_vma}.tar.gz::https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/archive/refs/tags/v${_vma}.tar.gz"
        'triforce-oot'
        'triforce-oot.desktop')
sha256sums=('51469c806703506842800e5f123355db2712f4b58ded21ca2dd9c56c220fcf35'
            'c4f6bbe6b5a45c2eb610ca9d231158e313086d5b1a40c9922cb42b597419b14e'
            '77140ae7e5ba3a598f6b3a9be69326a34184d3ae35c85ed263ad3fd4066df0ba'
            '4f37d03357611b1774964bca33950e7f1aa2f99604c9c226196b71fc60dc3a6e')

prepare() {
  cd "$srcdir/triforce"
  # v0.6.0: host/nvn_native.c creates its unnamed held-submits event with CreateEventW, which the Linux Win32 shim
  # (host/posix/windows.h) does not have, so the game's link fails ("undefined symbol: CreateEventW"). Unnamed, the A
  # call makes the same event.
  sed -i 's/hold_event = CreateEventW(NULL, FALSE, FALSE, NULL);/hold_event = CreateEventA(NULL, FALSE, FALSE, NULL);/' host/nvn_native.c
  ! grep -rq 'CreateEventW' host gpu
}

build() {
  cd "$srcdir/triforce"
  # The two native helpers a build otherwise makes beside their sources the first time, which it cannot do in a
  # read-only /usr: the AArch64 -> C translator (with its .sha1 stamp) and the ZBIC decompressor. As upstream's AppImage
  # makes them before packing (scripts/linux/appimage.sh), with upstream's own build code.
  python -I third_party/a64-kit/lift/build_emit.py
  python -I -c 'import sys; sys.path.insert(0, "nx2"); import zbic; zbic._build()'
  test -f third_party/a64-kit/lift/liba64emit.so -a -f third_party/a64-kit/lift/liba64emit.so.sha1 -a -f third_party/zbic/zbic.so

  # (the icon: the crest centred in a 256 px square, as launcher/build.ps1 makes it)
  magick assets/triforce.png -resize 256x256 -background none -gravity center -extent 256x256 "$srcdir/triforce-oot.png"
}

package() {
  # The tools, read-only: what a build of the game reads (the AppImage's list in scripts/linux/appimage.sh, plus the
  # Vulkan back end's third-party sources, which the AppImage does not need since it carries that back end built). Not:
  # tests, docs, the launcher, the Windows Setup and builder.
  cd "$srcdir/triforce"
  local tools="$pkgdir/usr/lib/triforce-oot"
  install -d "$tools/builder" "$tools/gpu" "$tools/third_party"
  cp -a nx2 host scripts assets LICENSE readme.md "$tools/"
  cp -a builder/linux "$tools/builder/"
  cp -a gpu/render gpu/vk gpu/compat gpu/third_party "$tools/gpu/"
  cp -a third_party/{a64-kit,zbic,zstd,opus,kenney_input,smaa,imgui,fonts,fidelityfx,fidelityfx-sdk,renodx,sdl2} "$tools/third_party/"
  # The VERSION file a release's tools carry. nx2/version.py names the build from it (there is no git history here), and
  # nx2/make_game.py writes it into the game folder's triforce_version.txt, which triforce-oot compares to know the game
  # is behind these tools.
  printf 'v%s\n' "$pkgver" > "$tools/VERSION"
  python -m compileall -q -s "$pkgdir" -p / "$tools/nx2" "$tools/third_party" >/dev/null || true
  # (HOOKSHOT_VMA_HEADERS, set by triforce-oot)
  install -Dm644 "$srcdir/VulkanMemoryAllocator-${_vma}/include/vk_mem_alloc.h" "$tools/vma/include/vk_mem_alloc.h"
  install -Dm644 "$srcdir/VulkanMemoryAllocator-${_vma}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/VulkanMemoryAllocator-LICENSE.txt"

  install -Dm755 "$srcdir/triforce-oot" "$pkgdir/usr/bin/triforce-oot"
  install -Dm644 "$srcdir/triforce-oot.desktop" "$pkgdir/usr/share/applications/triforce-oot.desktop"
  install -Dm644 "$srcdir/triforce-oot.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/triforce-oot.png"
}
