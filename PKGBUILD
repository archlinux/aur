# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# Credits:
#   Inferno (QEMU fork with Apple t8030 / iPhone 11 support): ChefKiss and
#     contributors, https://github.com/ChefKissInc/Inferno (GPL-3.0 / AGPL-3.0)
#     Unofficial build: the ChefKiss artwork and name are removed as their
#     branding notice (ui/icons/CKBrandingNotice.md) requires.
#   QEMU: the QEMU project, https://www.qemu.org
#   mlib: Patrick Pelissier, https://github.com/P-p-H-d/mlib (BSD-2-Clause)
#   Patches, launcher and packaging:
#     https://github.com/eugenesflanagin-spec/ios-emu-linux (MIT)
# No Apple firmware, keys or images are included or downloaded by this package.

pkgname=qemu-apple-t8030-git
_pkg=qemu-apple-t8030
_src=t8030-src
pkgver=1.0.0rc1.r125695.gcc4302a991
pkgrel=1
pkgdesc="QEMU fork with Apple t8030 (iPhone 11 / A13) guest support, based on ChefKissInc/Inferno (unofficial build, no firmware included)"
arch=('x86_64')
url="https://github.com/ChefKissInc/Inferno"
# Upstream: GPL-3.0 for the QEMU-derived code, AGPL-3.0 for the fork's own code
# (see LICENSE); launcher scripts in this package: MIT.
license=('GPL-3.0-only' 'AGPL-3.0-only' 'MIT')
depends=('alsa-lib' 'bzip2' 'cairo' 'dtc' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnutls'
         'gtk3' 'keyutils' 'libaio' 'libcap-ng' 'libepoxy' 'libgcc' 'libjpeg-turbo'
         'libpipewire' 'libpng' 'libpulse' 'libsasl' 'libseccomp' 'libslirp'
         'liburing' 'libusb' 'libx11' 'libxkbcommon' 'mesa' 'ncurses' 'nettle'
         'pixman' 'sdl2' 'sdl2_image' 'systemd-libs' 'vte3' 'zlib' 'zstd'
         'libtasn1' 'libatomic' 'gmp' 'hicolor-icon-theme' 'bash' 'python')
makedepends=('git' 'meson' 'ninja' 'lzfse')
optdepends=('kdotool: centre the window on the primary monitor (KDE Plasma)'
            'plasma-workspace: kscreen-doctor, for finding the primary monitor'
            'imagemagick: qemu-apple-t8030-set-boot-splash'
            'kdialog: show setup errors when started from the menu')
provides=("$_pkg")
conflicts=("$_pkg")
options=('!lto' '!debug')
source=("$_src::git+https://github.com/ChefKissInc/Inferno.git#branch=master"
        'mlib::git+https://github.com/P-p-H-d/mlib.git'
        'keycodemapdb::git+https://gitlab.com/qemu-project/keycodemapdb.git'
        '0001-mt-spi-middle-click-home.patch'
        '0002-boot-splash-env-override.patch'
        'boot-splash.png'
        'qemu-apple-t8030'
        'qemu-apple-t8030-set-boot-splash'
        'qemu-apple-t8030.desktop'
        'qemu-apple-t8030.svg'
        'vm-args.example.sh'
        'README.md'
        'LICENSE.MIT')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '8a469e2889789e401ea13656f95323e089069dfc073bc26ce0f8f57f0eab623a'
            '9625d6d2a696a87aa08c9342f624291d29b437e30b8c466819744d985ada1832'
            'df876dcce5a82082063d42c4da59b47f3645f2db87e675c8dac506f935b579fc'
            'd3baaedf3f7be7e9bef5bf5f4f1e8b2f49ed7fe0b39a0bd84e591c983b82e6b8'
            'ece23571c47042fe41266f7a8daebd340e6e5b404b903d4a143324e361822847'
            '77fe357013895fab4c593c220cbcddc19c53fc8cff6ec49f4e1f5fea553589ec'
            'a3aa500e5f9f7a0b46651fc23ac3f0b2567ce1c35865302e5ec67540913e6130'
            'f7f548e0d5f6077c616ba95a9339526473825f118e15e560786c4d761f73b142'
            '723965a296689872cc9bb308d6334312af1bcfac07ce7414aafc38bad1442a75'
            '3c44a18225aa372bf686cdce8bf44615916a8450af76a409485726cf81037211')

pkgver() {
  cd "$_src"
  local _v
  _v=$(sed -E 's/^[^-]*-([^_]*)_.*/\1/' VERSION)
  printf "%s.r%s.g%s" "$_v" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_src"

  # Submodule util/mlib is required; the ROM submodules are not.
  git submodule init util/mlib
  git config submodule.util/mlib.url "$srcdir/mlib"
  git -c protocol.file.allow=always submodule update util/mlib

  # Meson subproject keycodemapdb, at the revision the wrap file pins
  # (configure runs with --disable-download, so nothing is fetched at build time).
  local _rev
  _rev=$(sed -n 's/^revision *= *//p' subprojects/keycodemapdb.wrap)
  git -C "$srcdir/keycodemapdb" checkout -q "$_rev"
  rm -rf subprojects/keycodemapdb
  cp -a "$srcdir/keycodemapdb" subprojects/keycodemapdb

  patch -Np1 -i "$srcdir/0001-mt-spi-middle-click-home.patch"
  patch -Np1 -i "$srcdir/0002-boot-splash-env-override.patch"

  # Branding (ui/icons/CKBrandingNotice.md): unofficial builds must not ship the
  # upstream splash artwork or use the upstream project name.
  install -m644 "$srcdir/boot-splash.png" 'ui/icons/CKQEMUBootSplash_512x512@2x.png'
  sed -i 's/ChefKiss Inferno/QEMU t8030/g' \
    ui/gtk.c ui/sdl2.c ui/vnc.c ui/dbus.c ui/spice-core.c ui/cocoa.m version.rc
  sed -i 's|"ChefKiss Inferno\\n"|"QEMU t8030, unofficial build based on Inferno (github.com/ChefKissInc/Inferno)\\n"|' \
    system/vl.c
  sed -i 's/^ChefKissInferno-/t8030-/' VERSION
  if grep -n 'ChefKiss Inferno\|ChefKissInferno' VERSION system/vl.c ui/*.c ui/*.m version.rc; then
    echo "upstream branding still present in user-visible strings" >&2
    return 1
  fi
}

build() {
  cd "$_src"
  export CC=gcc CXX=g++
  # Keep -Ddebug=true (--enable-debug-info): debug=false adds -DNDEBUG, which
  # compiles out code inside upstream's assert_cmp* macros and breaks restores.
  ./configure \
    --prefix=/opt/$_pkg \
    --target-list=aarch64-softmmu \
    --cc=gcc --cxx=g++ \
    --disable-download \
    --enable-debug-info \
    --with-pkgversion="$pkgname $pkgver" \
    --enable-lzfse --enable-png --enable-zstd --enable-slirp \
    --enable-gtk --enable-sdl --enable-opengl --enable-curses \
    --enable-gnutls --enable-nettle \
    --enable-pa --enable-pipewire --enable-alsa \
    --disable-guest-agent --disable-install-blobs \
    --disable-glusterfs --disable-libiscsi --disable-libnfs --disable-rbd \
    --disable-curl --disable-libssh --disable-blkio --disable-fuse --disable-fuse-lseek \
    --disable-spice --disable-virglrenderer --disable-rutabaga-gfx \
    --disable-vde --disable-rdma --disable-numa --disable-mpath --disable-libpmem \
    --disable-libdaxctl --disable-usb-redir --disable-smartcard --disable-u2f \
    --disable-brlapi --disable-jack --disable-sndio --disable-oss --disable-xen \
    --disable-lzo --disable-snappy --disable-af-xdp --disable-bpf \
    --disable-auth-pam --disable-libdw --disable-valgrind --disable-selinux \
    --disable-werror --disable-qom-cast-debug
  if grep -q -- '-DNDEBUG' build/compile_commands.json; then
    echo "NDEBUG is set; this build would be broken (see comment above)" >&2
    return 1
  fi
  # ninja ignores MAKEFLAGS; pass its -j on
  ninja -C build $(grep -oE -- '-j *[0-9]+' <<<"${MAKEFLAGS:-}" | tr -d ' ')
}

package() {
  cd "$_src"
  DESTDIR="$pkgdir" ninja -C build install
  # upstream's generic QEMU menu entry; this package installs its own
  rm -rf "$pkgdir/opt/$_pkg/share/applications"

  install -Dm755 "$srcdir/qemu-apple-t8030" "$pkgdir/usr/bin/qemu-apple-t8030"
  install -Dm755 "$srcdir/qemu-apple-t8030-set-boot-splash" \
    "$pkgdir/usr/bin/qemu-apple-t8030-set-boot-splash"
  install -Dm644 "$srcdir/qemu-apple-t8030.desktop" \
    "$pkgdir/usr/share/applications/qemu-apple-t8030.desktop"
  install -Dm644 "$srcdir/qemu-apple-t8030.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/qemu-apple-t8030.svg"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$srcdir/README.md" "$srcdir/vm-args.example.sh"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE COPYING COPYING_GPL-3.0 COPYING_AGPL-3.0 ui/icons/CKBrandingNotice.md \
    "$srcdir/LICENSE.MIT"
}
