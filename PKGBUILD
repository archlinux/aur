# Maintainer: Verytwiztidone <nathan.c.cook@gmail.com>
#
# ─────────────────────────────────────────────────────────────────────────────
# WHY THIS PACKAGE BUNDLES ITS DEPENDENCIES (please read before reporting it)
# ─────────────────────────────────────────────────────────────────────────────
# Pathfynder's Atlas ships a private, self-contained runtime under
# /usr/lib/pathfynder-atlas instead of depending on the system copies of
# PostgreSQL, pgvector, onnxruntime, ripgrep, fd, rclone, unison and 7-Zip. This
# is a deliberate design decision, not laziness, and it is consistent across the
# .deb/.rpm builds too. The reasons:
#
#   * PostgreSQL + pgvector: Atlas runs its OWN per-user cluster (a systemd --user
#     service, its own data dir + socket). A PostgreSQL *major* upgrade rewrites
#     the on-disk format; if Atlas used the system server, a routine `pacman -Syu`
#     that bumps postgresql would leave the private cluster unable to start until
#     the user ran pg_upgrade by hand. Pinning our own server makes the cluster
#     immune to that. It is compiled minimal (no icu/readline/zlib/…) and reads
#     the SYSTEM tzdata, so it is small and touches nothing the system owns.
#   * onnxruntime: the semantic indexer links a specific, indexer-validated build
#     with protobuf + abseil baked in. Distro onnxruntime (when present at all)
#     routinely mismatches those, breaking inference at runtime.
#   * ripgrep / fd / rclone / unison / 7-Zip: resolved by ABSOLUTE path from
#     /usr/lib/pathfynder-atlas — they are NOT on $PATH and cannot shadow, be
#     shadowed by, or conflict with your system copies. Bundling guarantees every
#     optional feature (search, sync, archives) works with nothing else to install
#     — the target users often have zero terminal literacy.
#
# The bundled tools are private; nothing here installs into /usr/bin except the
# app's own binaries. If a genuine problem arises from bundling, it's a real bug —
# please report it. "It bundles things" by itself is the intended design.
# ─────────────────────────────────────────────────────────────────────────────
pkgname=pathfynder-atlas
pkgver=1.1.0
pkgrel=1
# Vendored, self-contained onnxruntime (protobuf + abseil statically inside).
# Bundled so the semantic indexer never mismatches a distro's protobuf/abseil.
_ortver=1.20.1
# Bundled PostgreSQL + pgvector, compiled minimal (no icu/readline/…) so the
# private cluster is version-locked to Atlas and portable across every distro —
# a system Postgres upgrade can never orphan it.
_pgver=18.4
_pgvectorver=0.8.4
# Unison — the Tier-2 two-way sync backend (local ↔ local reconcile). Bundled
# static so it's self-contained; the engine finds it at /usr/lib/pathfynder-atlas.
_unisonver=2.54.0
# Self-contained helper tools — bundled so EVERY optional feature works with
# nothing to install: rclone (cloud/SMB/SFTP mounts + cloud two-way sync),
# ripgrep (content search), fd (filename search), 7-Zip (zip/7z archives).
_rclonever=1.68.2
_rgver=14.1.1
_fdver=10.2.0
_7zver=2409
# Bundled document tools for semantic search INSIDE documents: poppler
# (pdftotext extracts text-layer PDFs; pdftoppm renders scanned pages) + tesseract
# + leptonica (OCR of scanned/garbled PDFs). Built MINIMAL from source (no
# curl/nss/gpgme/qt) + relocatable, so there's no crypto/network surface and
# nothing to install — see packaging/build-doctools.sh.
_popplerver=26.06.0
_leptonicaver=1.87.0
_tesseractver=5.5.2
# freetype + fontconfig + tiff + openjpeg are built from source too (poppler 26
# needs newer than some distros ship, e.g. EL9), so the SAME bundle builds on
# every channel and is truly host-independent. See packaging/build-doctools.sh.
_freetypever=2.13.3
_fontconfigver=2.15.0
_tiffver=4.7.0
_openjpegver=2.5.2
pkgdesc="Native Linux file explorer with semantic search inside documents (PDF + OCR), image previews, and two-way sync"
arch=('x86_64')
url="https://cooksdns.com/pathfynder-atlas"
license=('LicenseRef-PASL-1.0')
depends=('gtk3' 'gdk-pixbuf2' 'systemd-libs' 'hicolor-icon-theme')
# Everything Atlas uses is bundled (see the _rclone/_rg/_fd/_7z sources) — no
# optional runtime deps. xdg-desktop-portal is a desktop framework, not a tool to
# install, so it's only a soft suggestion for the file-picker integration.
optdepends=(
  'xdg-desktop-portal: use Atlas as the file picker for browser/app uploads'
)
# ninja + autotools + gperf build the doctools. freetype/fontconfig/tiff/openjpeg
# are built FROM SOURCE (poppler 26 wants newer than some distros ship); the
# remaining image codecs are linked from these -dev packages and their runtime
# .so bundled (jpeg, png, lcms2, zlib, webp, giflib, expat, brotli).
makedepends=('rust' 'cargo' 'cmake' 'ninja' 'clang' 'flutter' 'git' 'pkgconf' 'patchelf'
             'bison' 'flex' 'autoconf' 'automake' 'libtool' 'gperf' 'python'
             'libjpeg-turbo' 'libpng' 'lcms2' 'zlib' 'libwebp' 'giflib' 'expat' 'brotli')
install="$pkgname.install"
# Pin the source to an immutable release tag (not a floating branch) so a rebuild
# always produces the reviewed, released code. Bump _rel_tag + pkgver together.
_rel_tag="v1.1.0"
source=(
  # Public, unauthenticated mirror (Caddy dumb-HTTP; auto-synced from the Gitea
  # repo). Anyone can build this — the Gitea instance itself stays sign-in-walled.
  "$pkgname::git+https://cooksdns.com/pathfynder-atlas.git#tag=$_rel_tag"
  "onnxruntime-linux-x64-$_ortver.tgz::https://github.com/microsoft/onnxruntime/releases/download/v$_ortver/onnxruntime-linux-x64-$_ortver.tgz"
  "postgresql-$_pgver.tar.bz2::https://ftp.postgresql.org/pub/source/v$_pgver/postgresql-$_pgver.tar.bz2"
  "pgvector-$_pgvectorver.tar.gz::https://github.com/pgvector/pgvector/archive/refs/tags/v$_pgvectorver.tar.gz"
  "unison-$_unisonver.tar.gz::https://github.com/bcpierce00/unison/releases/download/v$_unisonver/unison-$_unisonver-ubuntu-22.04-${CARCH}-static.tar.gz"
  "rclone-$_rclonever.zip::https://downloads.rclone.org/v$_rclonever/rclone-v$_rclonever-linux-amd64.zip"
  "ripgrep-$_rgver.tar.gz::https://github.com/BurntSushi/ripgrep/releases/download/$_rgver/ripgrep-$_rgver-${CARCH}-unknown-linux-musl.tar.gz"
  "fd-$_fdver.tar.gz::https://github.com/sharkdp/fd/releases/download/v$_fdver/fd-v$_fdver-${CARCH}-unknown-linux-musl.tar.gz"
  "7z-$_7zver.tar.xz::https://github.com/ip7z/7zip/releases/download/24.09/7z$_7zver-linux-x64.tar.xz"
  # Document tools + their image stack (built minimal by packaging/build-doctools.sh).
  "freetype-$_freetypever.tar.xz::https://download.savannah.gnu.org/releases/freetype/freetype-$_freetypever.tar.xz"
  "fontconfig-$_fontconfigver.tar.xz::https://www.freedesktop.org/software/fontconfig/release/fontconfig-$_fontconfigver.tar.xz"
  "tiff-$_tiffver.tar.gz::https://download.osgeo.org/libtiff/tiff-$_tiffver.tar.gz"
  "openjpeg-$_openjpegver.tar.gz::https://github.com/uclouvain/openjpeg/archive/refs/tags/v$_openjpegver.tar.gz"
  "poppler-$_popplerver.tar.xz::https://poppler.freedesktop.org/poppler-$_popplerver.tar.xz"
  "leptonica-$_leptonicaver.tar.gz::https://github.com/DanBloomberg/leptonica/releases/download/$_leptonicaver/leptonica-$_leptonicaver.tar.gz"
  "tesseract-$_tesseractver.tar.gz::https://github.com/tesseract-ocr/tesseract/archive/refs/tags/$_tesseractver.tar.gz"
  "eng.traineddata::https://github.com/tesseract-ocr/tessdata_fast/raw/main/eng.traineddata"
)
sha256sums=(
  'SKIP'
  '67db4dc1561f1e3fd42e619575c82c601ef89849afc7ea85a003abbac1a1a105'
  '81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74e3a7ab8e64436094'
  '08575cd4a9d612d36dca821aa53e82c014aba8ef34c4c12d6ef6bff9f1093ef2'
  'd279dff18682c909d3ddb0b280ab151229b4798b9399b1d227084da424337d24'
  '0e6fa18051e67fc600d803a2dcb10ddedb092247fc6eee61be97f64ec080a13c'
  '4cf9f2741e6c465ffdb7c26f38056a59e2a2544b51f7cc128ef28337eeae4d8e'
  'd9bfa25ec28624545c222992e1b00673b7c9ca5eb15393c40369f10b28f9c932'
  '914c7e20ad5ef8e4d3cf08620ff8894b28fe11b7eb99809d6930870fbe48a281'
  '0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289'
  '63a0658d0e06e0fa886106452b58ef04f21f58202ea02a94c39de0d3335d7c0e'
  '67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976'
  '90e3896fed910c376aaf79cdd98bdfdaf98c6472efd8e1debf0a854938cbda6a'
  '4cb4e5a3dc8cb5eec751c8a23c8ba19f61f96dedc0cd07d2aee6b0c8e2cf6ba4'
  'c73363397f96eb1295602bf44d708a994ad42046c791bf03ea0505d829bdb6a7'
  '6235ea0dae45ea137f59c09320406f5888383741924d98855bd2ce0d16b54f21'
  '7d4322bd2a7749724879683fc3912cb542f19906c83bcc1a52132556427170b2'
)

build() {
  # Portable across CPUs. A build host may inject -march=native / target-cpu=native
  # (CachyOS does), which SIGILLs on any machine with a narrower instruction set.
  # Pin a broad baseline (x86-64-v2, ~2009+) so ONE package runs everywhere — the
  # same "depend on nothing host-specific" principle behind the bundled libraries.
  export CFLAGS="${CFLAGS//-march=native/-march=x86-64-v2} -mtune=generic"
  export CXXFLAGS="${CXXFLAGS//-march=native/-march=x86-64-v2} -mtune=generic"
  export RUSTFLAGS="${RUSTFLAGS//target-cpu=native/target-cpu=x86-64-v2}"

  cd "$srcdir/$pkgname"

  # 1) Rust read-core (cdylib): dir listing, drives, hybrid search bridge.
  ( cd engine && cargo build --release )

  # 2) C++ mutation daemon (dependency-free) + semantic indexer. The indexer
  #    links the vendored, self-contained onnxruntime (extracted by makepkg into
  #    $srcdir) instead of the distro package — no protobuf/abseil coupling.
  cmake -S daemon -B daemon/build -DCMAKE_BUILD_TYPE=Release \
    -DONNXRUNTIME_ROOT="$srcdir/onnxruntime-linux-x64-$_ortver"
  cmake --build daemon/build

  # 3) Flutter GUI.
  ( cd gui && flutter build linux --release )

  # 4) Bundled PostgreSQL + pgvector for Atlas's private cluster. Compiled minimal
  #    (no icu/readline/zlib/lz4/zstd) so the binaries are ~libc-only and portable,
  #    installed privately so a system Postgres major upgrade can't orphan the
  #    cluster. Relocatable: pg_config resolves paths relative to its own location.
  local _pgprefix="/usr/lib/$pkgname/pgsql"
  ( cd "$srcdir/postgresql-$_pgver"
    # --with-system-tzdata: read the system zoneinfo at runtime instead of
    # installing PostgreSQL's own copy — drops ~2000 files incl. the cross-dir
    # tz hardlinks namcap errors on. tzdata is a core package on every distro, so
    # this doesn't weaken the postgres-version isolation the bundle is here for.
    ./configure --prefix="$_pgprefix" --with-system-tzdata=/usr/share/zoneinfo \
      --without-icu --without-readline --without-zlib --without-lz4 --without-zstd --disable-nls
    make -j"$(nproc)"
    make install DESTDIR="$srcdir/pgstage" )
  # pgvector against the just-built Postgres (OPTFLAGS='' drops pgvector's own
  # -march=native). pg_config is relocatable, so no DESTDIR on install.
  ( cd "$srcdir/pgvector-$_pgvectorver"
    make PG_CONFIG="$srcdir/pgstage$_pgprefix/bin/pg_config" OPTFLAGS=""
    make install PG_CONFIG="$srcdir/pgstage$_pgprefix/bin/pg_config" )

  # 5) Bundled document tools (poppler + leptonica + tesseract), built MINIMAL
  #    and self-contained ($ORIGIN) by the shared recipe. Lets the semantic
  #    indexer read PDFs (pdftotext) and OCR scanned/garbled ones (pdftoppm +
  #    tesseract) with nothing to install. Reads the poppler/leptonica/tesseract
  #    tarballs + eng.traineddata makepkg fetched into $srcdir.
  FT_VER="$_freetypever" FC_VER="$_fontconfigver" TIFF_VER="$_tiffver" OPENJP_VER="$_openjpegver" \
  POPPLER_VER="$_popplerver" LEPT_VER="$_leptonicaver" TESS_VER="$_tesseractver" \
    bash packaging/build-doctools.sh "$srcdir" "$srcdir/doctools-out"
}

package() {
  cd "$srcdir/$pkgname"

  # GUI bundle (executable + data/ + lib/) under /usr/lib.
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r gui/build/linux/x64/release/bundle/. "$pkgdir/usr/lib/$pkgname/"
  # Flutter bakes an absolute ephemeral build path into the plugin libs' RUNPATH
  # (leaks the build path + leaves a dead runpath on the target). They sit beside
  # libflutter_linux_gtk.so, so $ORIGIN is the correct, portable runpath.
  for _l in "$pkgdir/usr/lib/$pkgname"/lib/*.so; do patchelf --set-rpath '$ORIGIN' "$_l"; done

  # Rust engine on the system library path (the GUI dlopens it by bare name).
  install -Dm755 engine/target/release/libatlyscore.so \
    "$pkgdir/usr/lib/libatlyscore.so"

  # Daemon (and indexer, if it built) on PATH.
  install -Dm755 daemon/build/atlysd "$pkgdir/usr/bin/atlysd"
  # Narrow privileged helper + its scoped polkit action (the only root escalation).
  install -Dm755 daemon/build/atlys-priv "$pkgdir/usr/bin/atlys-priv"
  install -Dm644 packaging/com.zenith.pathfynder.policy \
    "$pkgdir/usr/share/polkit-1/actions/com.zenith.pathfynder.policy"
  if [ -f daemon/build/atlys-indexer ]; then
    install -Dm755 daemon/build/atlys-indexer "$pkgdir/usr/bin/atlys-indexer"

    # Vendored, self-contained onnxruntime, private to Atlas (found via the
    # indexer's RPATH=/usr/lib/pathfynder-atlas). protobuf + abseil are baked
    # inside, so it never mismatches the distro's copies. providers_shared is
    # what onnxruntime dlopens beside itself for the CPU execution provider.
    _ort="$srcdir/onnxruntime-linux-x64-$_ortver"
    install -Dm755 "$_ort/lib/libonnxruntime.so.$_ortver" \
      "$pkgdir/usr/lib/$pkgname/libonnxruntime.so.$_ortver"
    ln -s "libonnxruntime.so.$_ortver" \
      "$pkgdir/usr/lib/$pkgname/libonnxruntime.so.1"
    install -Dm755 "$_ort/lib/libonnxruntime_providers_shared.so" \
      "$pkgdir/usr/lib/$pkgname/libonnxruntime_providers_shared.so"
  fi

  # Bundled Unison — Tier-2 two-way sync backend, self-contained (static). The
  # engine resolves it at /usr/lib/pathfynder-atlas/unison (see sync2.rs).
  install -Dm755 "$srcdir/unison-$_unisonver-ubuntu-22.04-${CARCH}-static/bin/unison" \
    "$pkgdir/usr/lib/$pkgname/unison"

  # Bundled helper tools so every optional feature is self-contained. The engine
  # (bundled.rs) and daemon resolve them at /usr/lib/pathfynder-atlas.
  install -Dm755 "$srcdir/rclone-v$_rclonever-linux-amd64/rclone" "$pkgdir/usr/lib/$pkgname/rclone"
  install -Dm755 "$srcdir/ripgrep-$_rgver-${CARCH}-unknown-linux-musl/rg" "$pkgdir/usr/lib/$pkgname/rg"
  install -Dm755 "$srcdir/fd-v$_fdver-${CARCH}-unknown-linux-musl/fd" "$pkgdir/usr/lib/$pkgname/fd"
  install -Dm755 "$srcdir/7zz" "$pkgdir/usr/lib/$pkgname/7zz"

  # Bundled PostgreSQL + pgvector — private to Atlas, runs the isolated cluster.
  # Version-locked to Atlas's data dir, so a system Postgres upgrade can't break
  # it, and portable (compiled minimal). Drop dev headers — runtime doesn't need them.
  cp -a "$srcdir/pgstage/usr/lib/$pkgname/pgsql" "$pkgdir/usr/lib/$pkgname/pgsql"
  rm -rf "$pkgdir/usr/lib/$pkgname/pgsql/include"        # dev headers — runtime doesn't need them
  rm -rf "$pkgdir/usr/lib/$pkgname/pgsql/lib/pgxs"       # extension-build infra — unused at runtime
  # pgvector linked against the relocatable staged pg_config, which baked the
  # build-stage path as vector.so's RUNPATH. It only needs libc (found by default),
  # so drop the stray rpath — postgres loads it by absolute $libdir anyway.
  patchelf --remove-rpath "$pkgdir/usr/lib/$pkgname/pgsql/lib/vector.so"

  # FileChooser portal backend: makes Atlas the upload/download file picker.
  if [ -f daemon/build/atlys-portal ]; then
    install -Dm755 daemon/build/atlys-portal "$pkgdir/usr/bin/atlys-portal"
    install -Dm644 packaging/pathfynder.portal \
      "$pkgdir/usr/share/xdg-desktop-portal/portals/pathfynder.portal"
    install -Dm644 packaging/org.freedesktop.impl.portal.desktop.pathfynder.service \
      "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.pathfynder.service"
  fi

  # Semantic-search setup wizard (user runs it once to enable + provision).
  install -Dm755 packaging/pathfynder-atlas-setup.sh \
    "$pkgdir/usr/bin/pathfynder-atlas-setup"

  # systemd USER service for Atlas's private, isolated PostgreSQL instance.
  install -Dm644 packaging/pathfynder-postgres.service \
    "$pkgdir/usr/lib/systemd/user/pathfynder-postgres.service"

  # Launcher, desktop entry, icon.
  install -Dm755 packaging/pathfynder-atlas.sh "$pkgdir/usr/bin/pathfynder-atlas"
  install -Dm644 packaging/pathfynder-atlas.desktop \
    "$pkgdir/usr/share/applications/pathfynder-atlas.desktop"
  # license=('custom') -> ship the license text under /usr/share/licenses.
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 packaging/pathfynder-atlas.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pathfynder-atlas.svg"
  # Also under the Wayland app_id, so docks/taskbars (Quickshell, waybar, …)
  # that resolve a running window's icon by app_id find it.
  install -Dm644 packaging/pathfynder-atlas.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.zenith.pathfynder_atlas.svg"

  # Bundled document tools (poppler + leptonica + tesseract + eng data), private
  # to Atlas under a doctools/ SUBDIR with their own $ORIGIN — deliberately NOT
  # in /usr/lib/pathfynder-atlas directly, so their image libs (libz, libpng, …)
  # can never shadow the copies the indexer's onnxruntime/libpq resolve there.
  # The indexer resolves them via ATLYS_DOCTOOLS_DIR / this path (indexer_main.cpp).
  cp -a "$srcdir/doctools-out/doctools" "$pkgdir/usr/lib/$pkgname/doctools"

  # Semantic-search schema (provision as postgres; see README).
  install -Dm644 docs/schema.sql "$pkgdir/usr/share/$pkgname/schema.sql"
}
