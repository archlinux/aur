# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# Credits:
#   xnu-qemu-arm64 (iOS 12.1 XNU on QEMU, iPhone 6s Plus n66): Aleph Security
#     (Jonathan Afek and contributors),
#     https://github.com/alephsecurity/xnu-qemu-arm64 (GPL-2.0)
#   QEMU: the QEMU project, https://www.qemu.org
#   Linux-host patch, launchers and packaging:
#     https://github.com/eugenesflanagin-spec/ios-emu-linux (patch GPL-2.0-or-later, scripts MIT)
# No Apple firmware is included or downloaded by this package.

pkgname=xnu-qemu-arm64-git
_pkgname=xnu-qemu-arm64
pkgver=4.2.0.r73552.g2694993
pkgrel=1
pkgdesc="Aleph Security's QEMU fork that boots the iOS 12.1 XNU kernel (iPhone 6s Plus) to a root shell, with Linux-host fixes"
arch=('x86_64')
url="https://github.com/alephsecurity/xnu-qemu-arm64"
license=('GPL-2.0-only' 'MIT')
depends=('bash' 'glibc' 'glib2' 'gtk3' 'cairo' 'gdk-pixbuf2' 'libx11' 'pixman'
         'dtc' 'zlib' 'libgcc' 'libstdc++' 'libatomic')
makedepends=('git' 'gcc' 'python' 'pkgconf' 'flex' 'bison')
optdepends=('hfsprogs: repair hfs.sec before each boot (fsck.hfsplus)'
            'sshpass: password login for xnu-qemu-ios-ssh'
            'openssh: SSH into the guest with xnu-qemu-ios-ssh')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto' '!debug')
# Docs and the tcp-tunnel source come from this release of ios-emu-linux
_extras_tag=v1.0
source=("$_pkgname::git+https://github.com/alephsecurity/xnu-qemu-arm64.git"
        "keycodemapdb::git+https://gitlab.com/qemu-project/keycodemapdb.git"
        "berkeley-softfloat-3::git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git"
        "berkeley-testfloat-3::git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git"
        "ios-emu-linux::git+https://github.com/eugenesflanagin-spec/ios-emu-linux.git#tag=$_extras_tag"
        '0001-n66-32bpp-xnu-ramfb-linux-host-guest-services.patch'
        'xnu-qemu-ios'
        'xnu-qemu-ios-console'
        'xnu-qemu-ios-ssh'
        'xnu-qemu-ios.desktop'
        'README.Arch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c17621c9c91f0d278535884020e18b27bad5b7fbce54b4c137cdfd7aba72d1d5'
            '93fdf9b81e3e893fc017014885cd067ec38d2b26ee6e6891c8b400768d9bc143'
            'd9ecba4bc413506306752aabe279669759a974adba6d9d2087c4405b26fa0a65'
            'e124ad16de3d1faf921f13d5d828019ea8201c3b44c6ca207cb11543dbed5832'
            '0b9763adc3b01dd7c026cfedcde060304368d4cbe1ef0cf761a86ad968e3ebb1'
            'cc0d161f17480c2bbc64b81b0137aba4ec0b3a63a459e62afbc2b924703ac6f0')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.g%s" "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  # configure insists on these submodules when .git exists; point them at local clones
  git submodule init ui/keycodemapdb tests/fp/berkeley-softfloat-3 tests/fp/berkeley-testfloat-3
  git config submodule.ui/keycodemapdb.url "$srcdir/keycodemapdb"
  git config submodule.tests/fp/berkeley-softfloat-3.url "$srcdir/berkeley-softfloat-3"
  git config submodule.tests/fp/berkeley-testfloat-3.url "$srcdir/berkeley-testfloat-3"
  git -c protocol.file.allow=always submodule update \
    ui/keycodemapdb tests/fp/berkeley-softfloat-3 tests/fp/berkeley-testfloat-3

  # 32bpp xnu-ramfb (correct colours) + Linux-host guest-services ABI fixes
  # (Darwin<->Linux sockaddr/fcntl/errno translation) so Aleph's tcp-tunnel works.
  patch -Np1 -i "$srcdir/0001-n66-32bpp-xnu-ramfb-linux-host-guest-services.patch"
}

build() {
  # This 2019/2020 tree only builds cleanly with GCC (not clang/AOCC).
  export CC=gcc CXX=g++ HOST_CC=gcc
  # keep Homebrew/Linuxbrew libraries out of the link
  PATH="$(printf '%s' "$PATH" | tr ':' '\n' | grep -v linuxbrew | paste -sd:)"
  export PATH
  # QEMU 4.2 sets its own _FORTIFY_SOURCE level
  CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}"
  CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=3/}"
  LDFLAGS+=" -Wl,-z,relro,-z,now -Wl,--as-needed"
  export CFLAGS CPPFLAGS LDFLAGS

  mkdir -p build
  cd build
  "../$_pkgname/configure" \
    --prefix="/opt/$_pkgname" \
    --target-list=aarch64-softmmu \
    --cc=gcc --cxx=g++ --host-cc=gcc \
    --python=/usr/bin/python3 \
    --extra-cflags="$CFLAGS" \
    --extra-ldflags="$LDFLAGS" \
    --enable-gtk \
    --audio-drv-list= \
    --disable-werror --disable-docs --disable-tools --disable-guest-agent \
    --disable-capstone --disable-slirp --disable-pie \
    --disable-vnc --disable-spice --disable-smartcard --disable-libusb --disable-usb-redir \
    --disable-sdl --disable-opengl --disable-virglrenderer --disable-vte \
    --disable-gnutls --disable-gcrypt --disable-nettle --disable-auth-pam \
    --disable-curl --disable-libssh --disable-libnfs --disable-libiscsi \
    --disable-glusterfs --disable-rbd --disable-xen --disable-bluez \
    --disable-linux-aio --disable-libpmem --disable-rdma --disable-vde \
    --disable-seccomp --disable-brlapi --disable-lzo --disable-snappy --disable-bzip2 \
    --disable-lzfse --disable-numa --disable-libxml2 --disable-cap-ng --disable-mpath \
    --disable-tpm --disable-vhost-user --disable-curses --disable-virtfs
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # Only the iPhone machine is needed: drop the generic QEMU helpers, menu entry/icons
  # and the prebuilt firmware blobs for other machines (none are used by n66).
  local _opt="$pkgdir/opt/$_pkgname"
  find "$_opt/bin" -mindepth 1 ! -name qemu-system-aarch64 -delete
  rm -rf "$_opt/libexec" "$_opt/include" "$_opt/share/applications" "$_opt/share/icons" "$_opt/share/qemu/firmware"
  find "$_opt/share/qemu" -maxdepth 1 -type f ! -name trace-events-all -delete

  cd "$srcdir"
  install -Dm755 xnu-qemu-ios xnu-qemu-ios-console xnu-qemu-ios-ssh -t "$pkgdir/usr/bin/"
  install -Dm644 xnu-qemu-ios.desktop "$pkgdir/usr/share/applications/xnu-qemu-ios.desktop"

  # docs: Linux notes for the guide + the SDK-free tcp-tunnel cross-build (source only)
  local _doc="$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README.Arch "$_doc/README.Arch"
  install -Dm644 ios-emu-linux/ios12-xnu-qemu/README.md "$_doc/README.md"
  install -Dm644 "$srcdir/$_pkgname/README.md" "$_doc/README.upstream.md"
  install -Dm644 0001-n66-32bpp-xnu-ramfb-linux-host-guest-services.patch -t "$_doc/patches/"
  cp -r --no-preserve=ownership ios-emu-linux/ios12-xnu-qemu/tunnel-linux "$_doc/"
  chmod -R u=rwX,go=rX "$_doc/tunnel-linux"
  chmod 755 "$_doc/tunnel-linux/build.sh"

  install -Dm644 "$srcdir/$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ios-emu-linux/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
}
