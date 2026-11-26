# Maintainer: kvm404
#
# Auren for Arch (the AUR package "auren"). The source of truth is packaging/arch/ in
# https://github.com/kvm404/Auren; the release workflow sets pkgver and the checksum and pushes it to
# the AUR. build-local.sh builds it from a checkout instead.
#
# Auren's Python dependencies aren't all in Arch (ptts isn't packaged, python-mcp is too old), so
# the package carries its own environment in /usr/lib/auren, built with uv from uv.lock against the
# system Python. When Arch moves to a new Python, rebuild it: yay -S --rebuild auren.

pkgname=auren
pkgver=0.1.9
pkgrel=1
pkgdesc='Voice assistant for Omarchy: say what you want, and it uses your desktop'
arch=('x86_64')
url='https://github.com/kvm404/Auren'
license=('MIT')
depends=('python' 'hyprland' 'quickshell' 'pipewire' 'pipewire-audio' 'wireplumber' 'grim' 'wtype'
         'wl-clipboard' 'libnotify' 'gum')
makedepends=('uv')
optdepends=('claude-code: the main brain (Claude Code)'
            'openai-codex: the backup brain (Codex)'
            'libsecret: keep the AssemblyAI key in the keyring'
            'yay: update Auren from its bar panel')
install=auren.install
options=('!strip' '!debug')        # the wheels' libraries come as they were built
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29586d6ae7e14674a48ed80599f8d9ddb8787346f40c7c681169378ad9bcc524')
_src="Auren-$pkgver"

build() {
  cd "$_src"
  # copy: the environment must not link into the build's cache, whatever the builder's uv settings
  export UV_PYTHON=/usr/bin/python UV_PYTHON_DOWNLOADS=never UV_CACHE_DIR="$srcdir/uv-cache" UV_NO_CONFIG=1 \
    UV_LINK_MODE=copy
  rm -rf "$srcdir/venv"
  uv venv --quiet --relocatable "$srcdir/venv"
  UV_PROJECT_ENVIRONMENT="$srcdir/venv" uv sync --frozen --no-dev --no-editable
}

check() {
  cd "$_src"
  "$srcdir/venv/bin/python" -I -c 'import auren.cli, auren.daemon, auren.setup, auren.phone_server, ptts, mcp'
}

package() {
  cd "$_src"
  local lib="$pkgdir/usr/lib/auren" share="$pkgdir/usr/share/auren"
  local pyver
  pyver=$(/usr/bin/python -c 'import sys; print("%d.%d" % sys.version_info[:2])')

  # The environment, with bytecode naming the installed paths, not the build ones
  install -d "$pkgdir/usr/lib"
  cp -a "$srcdir/venv" "$lib"
  find "$lib" -name direct_url.json -delete
  find "$lib" -name '__pycache__' -type d -prune -exec rm -rf {} +
  /usr/bin/python -m compileall -q -j0 -s "$pkgdir" -p / "$lib/lib"

  # The commands: Auren's environment, and a clear message once Arch's Python has moved on
  install -d "$pkgdir/usr/bin"
  local cmd module
  for cmd in auren auren-ctl; do
    module=auren.cli
    [[ $cmd == auren-ctl ]] && module=auren.ctl
    cat >"$pkgdir/usr/bin/$cmd" <<EOF
#!/bin/sh
# Auren's own Python environment (/usr/lib/auren), built for Python $pyver.
# Its python is /usr/bin/python, so it runs whatever version that is now.
if [ "\$(readlink -f /usr/bin/python)" != /usr/bin/python$pyver ]; then
  echo "$cmd: Auren was built for Python $pyver, which isn't installed any more: rebuild it with yay -S --rebuild auren" >&2
  exit 1
fi
exec /usr/lib/auren/bin/python -P -m $module "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$cmd"
  done

  # The mascot and the bar plugin (auren setup links them into ~/.local/share/auren)
  install -d "$share"
  cp -r mascot "$share/mascot"
  cp -r omarchy-plugin "$share/bar-plugin"

  # The services, for every user (auren setup enables them). The mascot starts from the user's link to
  # /usr/share/auren/mascot, the path the bar plugin calls it by: qs finds an instance only by the path
  # it was started with. auren setup's drop-in moves it for a custom XDG_DATA_HOME.
  install -d "$pkgdir/usr/lib/systemd/user"
  local unit
  for unit in auren.service auren-mascot.service; do
    sed -e 's#@AUREN@#/usr/bin/auren#g' -e 's#@MASCOT@#%h/.local/share/auren/mascot#g' -e 's#@QS@#/usr/bin/qs#g' \
      -e '/^@ENV@$/d' "systemd/$unit" >"$pkgdir/usr/lib/systemd/user/$unit"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname/docs"
}
