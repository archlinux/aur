# Maintainer: zapret-gui maintainers
pkgname=zapret-gui
pkgver=1.0.0
pkgrel=8
pkgdesc="GUI for zapret DPI bypass with Linux NFQUEUE/nftables runtime"
arch=("x86_64")
url="https://github.com/Mechtaatel/zapret-gui"
license=("GPL3")
install=zapret-gui.install
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
depends=(
  "python"
  "python-pyqt6"
  "python-pyqt6-fluent-widgets"
  "python-psutil"
  "python-requests"
  "python-urllib3"
  "python-pysocks"
  "python-cryptography"
  "python-aiohttp"
  "python-websockets"
  "python-qtawesome"
  "python-httpx"
  "qt6-svg"
  "nftables"
  "polkit"
  "luajit"
  "libnetfilter_queue"
  "libnfnetlink"
  "libmnl"
  "zlib"
  "libcap"
)
makedepends=(
  "base-devel"
  "git"
)
optdepends=(
  "sudo: fallback elevation if pkexec is unavailable"
)
source=(
  "zapret-gui::git+https://github.com/Mechtaatel/zapret-gui.git"
  "zapret2::git+https://github.com/bol-van/zapret2.git"
  "zapret::git+https://github.com/bol-van/zapret.git"
  "zapret-win-bundle::git+https://github.com/bol-van/zapret-win-bundle.git"
)
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")

build() {
  cd "$srcdir/zapret2/nfq2"
  make nfqws2

  cd "$srcdir/zapret/nfq"
  make nfqws
}

package() {
  cd "$srcdir/zapret-gui"

  install -dm755 "$pkgdir/usr/lib/zapret-gui"
  cp -a src "$pkgdir/usr/lib/zapret-gui/src"
  rm -rf "$pkgdir/usr/lib/zapret-gui/src/dist"
  # Генерируем build_info.py (gitignored, нет в репозитории)
  cat > "$pkgdir/usr/lib/zapret-gui/src/config/build_info.py" << 'EOF'
CHANNEL='stable'
APP_VERSION='1.0.0'
EOF
  if [[ -d src/lists ]]; then
    cp -a src/lists "$pkgdir/usr/lib/zapret-gui/lists"
  fi
  if [[ -d src/lua ]]; then
    cp -a src/lua "$pkgdir/usr/lib/zapret-gui/lua"
  fi
  if [[ -d src/presets ]]; then
    cp -a src/presets "$pkgdir/usr/lib/zapret-gui/presets"
  fi
  install -dm755 "$pkgdir/usr/lib/zapret-gui/presets/winws2_builtin"
  install -dm755 "$pkgdir/usr/lib/zapret-gui/presets/winws1_builtin"
  install -dm755 "$pkgdir/usr/lib/zapret-gui/presets/winws2"
  install -dm755 "$pkgdir/usr/lib/zapret-gui/presets/winws1"
  if [[ -d src/presets/builtin/winws2 ]]; then
    cp -a src/presets/builtin/winws2/. "$pkgdir/usr/lib/zapret-gui/presets/winws2_builtin/"
  fi
  if [[ -d src/presets/builtin/winws1 ]]; then
    cp -a src/presets/builtin/winws1/. "$pkgdir/usr/lib/zapret-gui/presets/winws1_builtin/"
  fi

  install -dm755 "$pkgdir/usr/lib/zapret-gui/bin"
  find "$srcdir/zapret-win-bundle" -type f -name '*.bin' \
    -exec cp -a {} "$pkgdir/usr/lib/zapret-gui/bin/" \;
  _alias_blob() {
    local target="$1"
    local source="$2"
    if [[ ! -f "$pkgdir/usr/lib/zapret-gui/bin/$source" ]]; then
      echo "ERROR: cannot create blob alias $target -> $source; source missing" >&2
      return 1
    fi
    if [[ ! -f "$pkgdir/usr/lib/zapret-gui/bin/$target" ]]; then
      cp -a "$pkgdir/usr/lib/zapret-gui/bin/$source" \
        "$pkgdir/usr/lib/zapret-gui/bin/$target"
    fi
  }
  for i in $(seq 1 18); do
    _alias_blob "tls_clienthello_${i}.bin" "tls_clienthello_www_google_com.bin"
  done
  _alias_blob "tls_clienthello_2n.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "tls_clienthello_chat_deepseek_com.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "tls_clienthello_gosuslugi_ru.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "tls_clienthello_iana_org.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "tls_clienthello_4pda_to.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "tls_clienthello_max_ru.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "tls_clienthello_sberbank_ru.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "tls_clienthello_vk_com.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "tls_clienthello_vk_com_kyber.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "dtls_clienthello_w3_org.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "http_iana_org.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "syn_packet.bin" "stun.bin"
  _alias_blob "quic_initial_dbankcloud_ru.bin" "quic_initial_www_google_com.bin"
  _alias_blob "quic_initial_vk_com.bin" "quic_initial_www_google_com.bin"
  _alias_blob "quic_vk.bin" "quic_initial_vk_com.bin"
  _alias_blob "quic_test_00.bin" "quic_initial_www_google_com.bin"
  _alias_blob "fake_tls.bin" "tls_clienthello_www_google_com.bin"
  _alias_blob "fake_quic.bin" "quic_initial_www_google_com.bin"
  for i in $(seq 1 8); do
    _alias_blob "fake_tls_${i}.bin" "tls_clienthello_www_google_com.bin"
  done
  for i in $(seq 1 7); do
    _alias_blob "quic_${i}.bin" "quic_initial_www_google_com.bin"
  done
  for i in $(seq 1 3); do
    _alias_blob "fake_quic_${i}.bin" "quic_initial_www_google_com.bin"
  done

  while IFS= read -r ref; do
    name="${ref#@bin/}"
    if [[ ! -f "$pkgdir/usr/lib/zapret-gui/bin/$name" ]]; then
      echo "ERROR: missing runtime blob: bin/$name" >&2
      return 1
    fi
  done < <(
    grep -RhoE '@bin/[A-Za-z0-9_.-]+' \
      "$pkgdir/usr/lib/zapret-gui/lua" \
      "$pkgdir/usr/lib/zapret-gui/presets" \
      | sort -u
  )

  find "$pkgdir/usr/lib/zapret-gui/presets/winws2_builtin" -type f -name '*.txt' -print -quit | grep -q . || {
    echo "ERROR: missing built-in winws2 presets" >&2
    return 1
  }
  find "$pkgdir/usr/lib/zapret-gui/presets/winws1_builtin" -type f -name '*.txt' -print -quit | grep -q . || {
    echo "ERROR: missing built-in winws1 presets" >&2
    return 1
  }

  install -Dm755 "$srcdir/zapret2/nfq2/nfqws2" \
    "$pkgdir/usr/lib/zapret-gui/exe/nfqws2"

  install -Dm755 "$srcdir/zapret/nfq/nfqws" \
    "$pkgdir/usr/lib/zapret-gui/exe/nfqws"

  [[ -x "$pkgdir/usr/lib/zapret-gui/exe/nfqws2" ]] || return 1
  [[ -x "$pkgdir/usr/lib/zapret-gui/exe/nfqws" ]] || return 1

  if cmp -s "$pkgdir/usr/lib/zapret-gui/exe/nfqws" "$pkgdir/usr/lib/zapret-gui/exe/nfqws2"; then
    echo "ERROR: nfqws and nfqws2 must not be the same binary" >&2
    return 1
  fi

  PYTHONPATH="$pkgdir/usr/lib/zapret-gui/src" QT_QPA_PLATFORM=offscreen python - <<'PY'
import qfluentwidgets
import darkdetect
import qframelesswindow
import qtawesome

from pathlib import Path
from core.paths import AppPaths
from settings.mode import ENGINE_WINWS1, ENGINE_WINWS2

paths = AppPaths(user_root=Path("/tmp/zapret-gui-user"), local_root=Path("/usr/lib/zapret-gui"))
assert paths.engine_paths(ENGINE_WINWS2).builtin_presets_dir.name == "winws2_builtin"
assert paths.engine_paths(ENGINE_WINWS1).builtin_presets_dir.name == "winws1_builtin"
PY

  install -Dm755 "$srcdir/zapret-gui/packaging/linux/zapret-gui" \
    "$pkgdir/usr/bin/zapret-gui"
  install -Dm644 "$srcdir/zapret-gui/packaging/linux/zapret-gui.desktop" \
    "$pkgdir/usr/share/applications/zapret-gui.desktop"
}
