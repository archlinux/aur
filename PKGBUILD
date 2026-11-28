# Maintainer: sx <132211241+sxdot@users.noreply.github.com>

pkgname=sbx-pc-bin
pkgver=0.6.1
pkgrel=2
pkgdesc='Shutoko Battle X PC port (upstream Linux Vulkan build)'
arch=('x86_64')
url='https://github.com/ludusregard/SBX-PC'
license=('LicenseRef-No-License-Declared')
depends=(
  'bash' 'coreutils' 'util-linux' 'glibc>=2.38' 'libgcc' 'libstdc++'
  'libx11' 'libxcb' 'wayland' 'vulkan-icd-loader' 'vulkan-driver'
  'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxss' 'libxtst'
)
makedepends=('patchelf')
optdepends=(
  'alsa-lib: ALSA audio backend'
  'libpulse: PulseAudio or PipeWire PulseAudio compatibility backend'
  'libpipewire: native PipeWire audio backend'
  'python: optional custom-music metadata generator'
  'xorg-xwayland: X11 support on Wayland desktops'
)
options=('!strip' '!debug')
source=(
  "${url}/releases/download/v${pkgver}/sbx-v${pkgver}-linux-amd64-vulkan.tar.gz"
  "${url}/releases/download/v${pkgver}/sbx-v${pkgver}-assets.zip"
)
sha256sums=(
  '94592a7d2a13a53d75f4f2896049da4b9e1c554cf975d79c36e290c63c0b004a'
  '240b49123530e1f856fa99aeb853b11db3735ed3fe7be3babefabf8e2933df87'
)

package() {
  local appdir="$pkgdir/usr/lib/sbx-pc"
  install -Dm755 -t "$appdir" sbx run.sh librexruntimerd.so libTracyClientrd.so
  # The launcher puts sbx in the user's data directory. Resolve its private
  # libraries from the package, and remove the runtime's upstream build path.
  patchelf --set-rpath /usr/lib/sbx-pc "$appdir/sbx"
  patchelf --set-rpath '$ORIGIN' "$appdir/librexruntimerd.so"

  install -d "$appdir/assets"
  cp -R -- assets/PATCH_DATA assets/ADDON_DATA "$appdir/assets/"
  chmod -R u=rwX,go=rX "$appdir/assets"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  printf '%s\n' 'No project-wide license was declared in the SBX-PC v0.6.1 release or tagged repository.' \
    > "$pkgdir/usr/share/licenses/$pkgname/UPSTREAM-LICENSE-NOTICE"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/sbx-pc" <<'LAUNCHER'
#!/usr/bin/bash
set -euo pipefail

appdir=/usr/lib/sbx-pc
data_home=${XDG_DATA_HOME:-"$HOME/.local/share"}
if [[ $data_home != /* ]]; then
  data_home=$HOME/.local/share
fi
userdir=$data_home/sbx-pc
assets=$userdir/assets

umask 077
mkdir -p -- "$assets"
if [[ ! -f $assets/default.xex || ! -r $assets/default.xex ||
      ! -d $assets/DATA || ! -r $assets/DATA || ! -x $assets/DATA ]]; then
  printf 'SBX-PC needs the extracted Japanese Xbox 360 game files.\nPlace default.xex and DATA/ in:\n  %s\n' "$assets" >&2
  exit 1
fi

# The guest filesystem needs real directories for patch files it opens.
# Serialize initialization so a second launch cannot see a partial copy.
(
  flock -x 9
  for name in PATCH_DATA ADDON_DATA; do
    source_dir=$appdir/assets/$name
    destination=$assets/$name

    if [[ -d $destination && ! -L $destination ]]; then
      continue
    fi

    if [[ -L $destination && $(readlink -- "$destination") == "$source_dir" ]]; then
      replace_link=true
    elif [[ -e $destination || -L $destination ]]; then
      printf 'SBX-PC needs a real asset directory at %s\n' "$destination" >&2
      exit 1
    else
      replace_link=false
    fi

    staging=$(mktemp -d -- "$assets/.$name.XXXXXXXX")
    trap 'rm -rf -- "$staging"' EXIT
    cp -R -- "$source_dir" "$staging/"
    if "$replace_link"; then
      # Only remove a link installed by the earlier launcher.
      unlink -- "$destination"
    fi
    mv -T -- "$staging/$name" "$destination"
    rmdir -- "$staging"
    trap - EXIT
  done
) 9>"$userdir/.assets.lock"

# The executable's real location determines where SBX reads and writes data.
# Replace the private copy atomically so updates also work while SBX is open.
if [[ -L $userdir/sbx || ! -x $userdir/sbx ]] ||
   ! cmp -s -- "$appdir/sbx" "$userdir/sbx"; then
  temp=$(mktemp -- "$userdir/.sbx.XXXXXXXX")
  trap 'rm -f -- "$temp"' EXIT
  install -m700 -- "$appdir/sbx" "$temp"
  mv -fT -- "$temp" "$userdir/sbx"
  trap - EXIT
fi

cd -- "$userdir"
exec ./sbx --user_data_root="$userdir/user" "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/sbx-pc"
}
