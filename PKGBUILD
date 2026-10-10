# Maintainer: TJ Griffiths <teej.d.man@gmail.com>
# trdc: remote desktop client with a built-in AI copilot — connection tabs,
# connection sidebar, and an AI panel that can see the remote screen and
# (with per-action approval) drive its mouse and keyboard.
#
# Ships its own patched guacamole-server: guacd is built into a private tree
# at /usr/lib/trdc. It is NOT a system service — trdc spawns it on 127.0.0.1
# at startup and reaps it on exit. The FreeRDP channel-plugin patch
# (patches/plugin_dir.patch from the trdc source tree) lets guacd load its
# channel plugins from that private tree, so no root install is involved.
pkgname=trdc
pkgver=0.1.1
pkgrel=1
pkgdesc="Remote desktop client with a built-in AI copilot (RDP/VNC/SSH via a private guacd sidecar)"
arch=('x86_64')
url="https://github.com/Teejer/trdc"
license=('GPL-2.0-or-later')
depends=('cairo' 'ffmpeg' 'fontconfig' 'freerdp' 'gcc-libs' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk3' 'libjpeg-turbo' 'libpng' 'libssh2' 'libsoup3'
         'libvncserver' 'libwebp' 'libx11' 'openssl' 'pango'
         'pixman' 'util-linux-libs' 'webkit2gtk-4.1')
makedepends=('autoconf' 'automake' 'cargo' 'libtool' 'npm' 'pkgconf' 'rust')
options=('!debug')
_gsrvver=1.6.0
source=("https://github.com/Teejer/trdc/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/apache/guacamole-server/archive/refs/tags/${_gsrvver}.tar.gz")
sha256sums=('22d15ed3d452a366dc4003118112e3d715481c6276ac8edf93c08bb850de73b2'
            '913b05d19beabed4a3066e6e2be3078783048f55c7a9d2e3a012897a8766c245')

prepare() {
  cd "guacamole-server-${_gsrvver}"
  # Load FreeRDP channel plugins (clipboard/formatting) from the private
  # tree via GUAC_RDP_PLUGIN_DIR instead of the compiled-in /usr/lib/freerdp3.
  patch -Np1 -i "../trdc-${pkgver}/patches/plugin_dir.patch"
}

build() {
  cd "guacamole-server-${_gsrvver}"
  # Arch's default flags trip guacamole-server's -Werror on current headers.
  export CFLAGS="$CFLAGS -Wno-error" CXXFLAGS="$CXXFLAGS -Wno-error"
  # guacamole-server's configure injects "-Werror" *after* the user CFLAGS
  # for its FreeRDP feature probes, but before $CPPFLAGS — so the override
  # has to live in CPPFLAGS (last -W[e]-error wins), or the FREERDP_HAS_
  # CONTEXT probe fails on deprecation warnings and the RDP plugin then
  # compiles against the wrong struct layout.
  export CPPFLAGS="$CPPFLAGS -Wno-error -Wno-deprecated-declarations"
  # The release tarball has no ./bootstrap (git-only); regenerate the
  # autotools bits ourselves. automake --add-missing supplies compile/,
  # depcomp and missing, which configure requires but the tarball lacks.
  autoreconf -fiv
  automake --add-missing --copy --foreign
  ./configure --prefix=/usr/lib/trdc \
    --with-init-dir=/tmp/guacd-init \
    --with-freerdp-plugin-dir=/usr/lib/trdc/lib/freerdp3
  make

  cd "../trdc-${pkgver}"
  npm ci --no-audit --no-fund
  npm run build          # tauri's build.rs embeds ../dist at compile time

  # ring (rustls crypto) builds hand-written asm through cc-rs, which
  # inherits CFLAGS. Arch's default "-flto=auto" makes cc-rs LTO the C
  # objects but not the .S files, so the asm symbols vanish and linking
  # fails with "undefined symbol: ring_core_*". Strip LTO for the Rust
  # build only (our Rust crate still gets Rust's own LTO via Cargo.toml).
  cd src-tauri
  # -flto=auto breaks ring's asm (see above). --remap-path-prefix cleans
  # panic-location strings. The residual "contains reference to $srcdir"
  # warning comes from tauri-build baking the workspace path into an asset
  # string literal at macro expansion time (not remappable); it is
  # cosmetic and each builder's binary embeds their own path.
  env CFLAGS="${CFLAGS/-flto=auto/}" CXXFLAGS="${CXXFLAGS/-flto=auto/}" \
    RUSTFLAGS="--remap-path-prefix=$srcdir=build --remap-path-prefix=$HOME/.cargo=cargo" \
    cargo build --release --locked
}

package() {
  # Private guacd tree: /usr/lib/trdc/{guacd,lib,lib/freerdp3}. trdc locates
  # it relative to /usr/bin/trdc (candidate ../lib/trdc/guacd) and sets
  # LD_LIBRARY_PATH/GUAC_RDP_PLUGIN_DIR for it (see src-tauri/src/guacd.rs).
  cd "guacamole-server-${_gsrvver}"
  make DESTDIR="$pkgdir" install
  # trdc only needs the guacd daemon + its protocol plugins. Drop the
  # dev/system cruft: headers, pkg-config, docs, the (unused, since we never
  # install guacd as a service) init script, and the guacenc/guaclog offline
  # tools.
  rm -rf "$pkgdir/usr/lib/trdc/include" \
         "$pkgdir/usr/lib/trdc/share" \
         "$pkgdir/usr/lib/trdc/bin" \
         "$pkgdir/usr/lib/trdc/lib/pkgconfig" \
         "$pkgdir/tmp"
  find "$pkgdir/usr/lib/trdc/lib" -name '*.la' -delete
  find "$pkgdir/usr/lib/trdc/lib" -name '*.a' -delete
  rm -f "$pkgdir/usr/lib/trdc/lib/libguac.so"   # development symlink
  install -Dm755 "$pkgdir/usr/lib/trdc/sbin/guacd" "$pkgdir/usr/lib/trdc/guacd"
  rm -rf "$pkgdir/usr/lib/trdc/sbin"

  cd "$srcdir/trdc-${pkgver}"
  install -Dm755 src-tauri/target/release/trdc "$pkgdir/usr/bin/trdc"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/trdc.png"
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/trdc.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=trdc
GenericName=Remote desktop client
Comment=Remote desktop client with a built-in AI copilot
Exec=trdc %u
Terminal=false
Categories=Network;RemoteAccess;
Keywords=rdp;vnc;ssh;remote;desktop;ai;
Icon=trdc
EOF
}
