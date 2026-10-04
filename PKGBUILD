# Maintainer: Ingmar Steen <iksteen at gmail dot com>
#
# Kahawai, linked against kahawai-gstreamer in /opt rather than Arch's
# GStreamer. The binary carries a DT_RPATH to /opt/kahawai-gstreamer/lib —
# RPATH, not RUNPATH, so LD_LIBRARY_PATH cannot swap a library in — and
# check() fails the build if it does not. Why GStreamer lives apart at all:
# the header of the kahawai-gstreamer PKGBUILD,
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=kahawai-gstreamer

pkgname=kahawai
_tag=0.0.21-rc.2
# The stamped commit the release was built from, which `kahawai --version`
# and a satellite's hello report. From the release notes.
_commit=7b998b295f7ab081cf6b059d82e69dd5bb83a1c8
pkgver=${_tag/-rc./rc}
pkgrel=1
# The GStreamer this release's patch set was built for. Exact: kahawai and
# the plugins it loads must agree on one GStreamer.
_gst=1.28.7
_gst_prefix=/opt/kahawai-gstreamer
pkgdesc="Self-hosted media streaming: hub, mediahost and transcoder in one binary"
arch=(x86_64 aarch64)
url="https://kahawai.net/"
license=(MIT)
# Checked against what the binary links: see check().
depends=("kahawai-gstreamer=$_gst" glib2 glibc leptonica libass libgcc tesseract)
makedepends=(cargo clang cmake nodejs npm protobuf)
optdepends=(
  'tesseract-data-eng: OCR of English bitmap subtitles (one tesseract-data-* per language)'
)
# makepkg's lto puts -flto=auto in CFLAGS, so the C that build scripts
# compile (sqlx's bundled SQLite among it) becomes GCC IR that rustc's
# links never resolve: sqlx-macros fails to load on undefined sqlite3_*.
# Cargo's own LTO is the release profile's business, not this option's.
options=(!lto)
backup=(etc/kahawai/kahawai.toml)
install=kahawai.install
source=("https://github.com/iksteen/kahawai/releases/download/v$_tag/kahawai-$_tag-source.tar.gz"
        kahawai.toml
        kahawai.sysusers
        kahawai.tmpfiles
        kahawai.service
        kahawai-hub.service
        kahawai-mediahost.service
        kahawai-transcoder.service)
sha256sums=('664f0aa523f673da1944773a49728be70ca5b95dcebe5f7364cffb3b002daf1c'
            'd865db520499a83a564a1dd7ff586db8944de0d4015056f69e224359c0b190db'
            'defd1b5741b7bc13ad1c66c368daf1e93075a8e940cd7810bc642aa0e385ff23'
            '73baebedb951be68563bf9ccfd8ec3c7203caf5080cead15069d8ebc6bbc76e6'
            '6ea1a723653b50c6eeb67fcce7cc38d9c90756c8d4511552d218bb97949a8951'
            'de92775ec61be7b739c20fc4ef54cbe3ce607acccd0027c18a1ca46765f2ad25'
            '1c1b767937e23bd432e6fc05d5cd89af6de3f8a4899ef6f5dc119e20fa542dd9'
            '5131609360e7ec2050604336b9716096b04143bf5fe8459821e53016070102c8')

die() { error "$*"; exit 1; }

prepare() {
  cd "kahawai-$_tag"
  npm ci --prefix web
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "kahawai-$_tag"

  # Headers and link flags from the /opt GStreamer only; with Arch's on the
  # search path too, which one answered would depend on order.
  export PKG_CONFIG_PATH="$_gst_prefix/lib/pkgconfig"
  # --disable-new-dtags: DT_RPATH. A plain -rpath writes DT_RUNPATH on Arch,
  # and the loader consults LD_LIBRARY_PATH before that.
  # The remap keeps build-script output paths (panic locations) from
  # carrying $srcdir into the binary.
  export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Wl,--disable-new-dtags -C link-arg=-Wl,-rpath,$_gst_prefix/lib --remap-path-prefix=$srcdir=/build"

  # Generated web assets are never committed; build them from the lockfile
  # before rust-embed bakes them in, as the release does.
  npm run --prefix web build
  KAHAWAI_SKIP_WEB_BUILD=1 KAHAWAI_REQUIRE_WEB=1 KAHAWAI_BUILD="v$_tag@$_commit" \
    cargo build --frozen --release --bin kahawai
}

check() {
  local bin="kahawai-$_tag/target/release/kahawai" dyn

  dyn=$(readelf -d "$bin")
  grep -q '(RUNPATH)' <<<"$dyn" && die "kahawai has a DT_RUNPATH"
  grep -q "(RPATH).*\[$_gst_prefix/lib\]" <<<"$dyn" ||
    die "kahawai has no DT_RPATH to $_gst_prefix/lib"

  # Every libgst* it needs resolves into /opt, and nothing it needs comes
  # from Arch's GStreamer.
  local needed resolved bad=0
  while read -r needed resolved; do
    case $needed in
      libgst*) [[ $resolved = "$_gst_prefix/lib/"* ]] || { echo "  $needed => $resolved" >&2; bad=1; } ;;
    esac
  done < <(ldd "$bin" | awk '/=>/{print $1, $3}')
  (( ! bad )) || die "GStreamer libraries resolve outside $_gst_prefix"

  # depends matches the packages owning what the binary links directly.
  local derived declared
  derived=$(readelf -d "$bin" | sed -n 's/.*(NEEDED).*\[\(.*\)\]/\1/p' |
    while read -r needed; do ldd "$bin" | awk -v n="$needed" '$1 == n {print $3}'; done |
    xargs pacman -Qqo | sort -u)
  declared=$(printf '%s\n' "${depends[@]%%[<>=]*}" | sort -u)
  if [[ $derived != "$declared" ]]; then
    diff <(echo "$declared") <(echo "$derived") | sed -n 's/^[<>]/  &/p' >&2
    die "depends does not match what kahawai links (< declared, > derived)"
  fi

  # The shipped config must be one kahawai ACCEPTS: deny_unknown_fields
  # makes a key that drifted out of the config struct a startup failure in
  # a service nobody is watching. doctor loads the config before anything
  # else, so its complaints tell the two apart; whether this machine passes
  # doctor is not the question. The commented collection examples are
  # checked the same way, uncommented.
  local cfg out
  sed -E 's/^# (\[\[mediahost\.collections\]\]|name = |media_type = |roots = )/\1/' \
    "$srcdir/kahawai.toml" > "$srcdir/kahawai-examples.toml"
  for cfg in "$srcdir/kahawai.toml" "$srcdir/kahawai-examples.toml"; do
    out=$(XDG_CACHE_HOME="$srcdir/check-cache" "$bin" --config "$cfg" doctor 2>&1) || true
    if grep -qiE 'unknown field|missing field|parse error|unsupported media_type|invalid type' <<<"$out"; then
      echo "$out" >&2
      die "kahawai rejects ${cfg##*/}"
    fi
  done
  grep -q '^\[\[mediahost\.collections\]\]' "$srcdir/kahawai-examples.toml" ||
    die "the collection examples were not found to check"
}

package() {
  cd "kahawai-$_tag"
  install -Dm755 target/release/kahawai "$pkgdir/usr/bin/kahawai"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir"
  install -Dm644 kahawai.toml "$pkgdir/etc/kahawai/kahawai.toml"
  install -Dm644 kahawai.sysusers "$pkgdir/usr/lib/sysusers.d/kahawai.conf"
  install -Dm644 kahawai.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kahawai.conf"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" \
    kahawai.service kahawai-hub.service kahawai-mediahost.service \
    kahawai-transcoder.service
}
