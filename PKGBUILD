# Maintainer: Rownix <rownix101@gmail.com>
# Upstream: https://github.com/Ebony-Vinyl/EAC-Desktop (MIT)
#
# This package repackages the upstream Debian build; nothing is compiled here.
#
# Three upstream quirks are encoded below on purpose:
#
#  1. Linux artifacts are published only for *some* releases. Recent tags
#     (v6.0.x) are Windows-only, so "latest release" is not a valid signal --
#     the updater scans every release and picks the newest one that actually
#     ships an amd64 .deb.
#  2. The release tag is not always "v${pkgver}": upstream has used
#     v4.4.0-linux, v5.3.1-linux, ... . The exact tag is tracked in _tag and
#     the exact asset name in _debname.
#  3. The payload must keep its original paths. See package() below.
#
# scripts/update-pkgbuild.py maintains pkgver/pkgrel/_tag/_debname/sha256sums.

pkgname=deepseek-harness-eac-bin
pkgver=5.3.6
pkgrel=3
pkgdesc='DeepSeek Harness EAC - desktop workbench for DSH plugins (upstream Debian build)'
arch=('x86_64')
url='https://github.com/Ebony-Vinyl/EAC-Desktop'
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
)
optdepends=(
  'libnotify: desktop notifications'
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
)
provides=('deepseek-harness-eac')
conflicts=('deepseek-harness-eac')
# Prebuilt binaries: never strip them, and do not emit a debug package.
options=('!strip' '!debug')

_tag='v5.3.6'
_debname='Deepseek.Harness.EAC_5.3.6_amd64.deb'
source=("${_debname}::${url}/releases/download/${_tag}/${_debname}")
sha256sums=('05acc5e789d1a3919d56bfc21f1b7f97b764f9be48d5fd39a76108606605a2fc')
# Unpack the .deb ourselves in package(); letting makepkg do it would scatter
# debian-binary/control.tar.gz/data.tar.gz loose in $srcdir.
noextract=("${_debname}")

# Unpack a .deb (an ar(1) archive) and print the path of its data member.
# bsdtar ships with libarchive in base, so dpkg is not needed on Arch.
# --no-same-owner is required: the archive records Debian's builder uid/gid,
# which cannot be applied inside makepkg's fakeroot.
_unpack_deb() {
  local dest=$1 member
  rm -rf "$dest"
  mkdir -p "$dest"
  bsdtar -xf "${_debname}" -C "$dest" --no-same-owner || return 1
  member=$(find "$dest" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)
  [[ -n $member ]] || { error 'no data.tar.* member found inside the .deb'; return 1; }
  printf '%s\n' "$member"
}

check() {
  cd "$srcdir"

  local data_tar listing
  data_tar=$(_unpack_deb "$srcdir/.check-deb") || return 1
  listing=$(mktemp)
  bsdtar -tf "$data_tar" > "$listing" || return 1

  # Everything the Tauri shell and its Node sidecar need at boot. If upstream
  # renames or drops any of these, the package must not be published blindly.
  local required=(
    'usr/bin/dsh-eac-shell'
    'usr/lib/Deepseek Harness EAC/sidecar/server.js'
    'usr/lib/Deepseek Harness EAC/dsh-desktop/package.json'
    'usr/lib/Deepseek Harness EAC/dsh-desktop/bundle-manifest.json'
    'usr/lib/Deepseek Harness EAC/dsh-desktop/vendor/node/node'
    'usr/lib/Deepseek Harness EAC/dsh-desktop/vendor/npm/bin/npm-cli.js'
    'usr/share/applications/Deepseek Harness EAC.desktop'
    'usr/share/icons/hicolor/900x900/apps/dsh-eac-shell.png'
  )
  local path
  for path in "${required[@]}"; do
    # tar listings may or may not carry a leading "./".
    if ! grep -qxF -e "$path" -e "./$path" "$listing"; then
      error "upstream .deb is missing a required path: $path"
      rm -f "$listing"
      return 1
    fi
  done

  # The Debian control metadata must still describe an amd64 package.
  local control_dir="$srcdir/.check-deb/control"
  local control_tar="$srcdir/.check-deb/control.tar.gz"
  if [[ -f $control_tar ]]; then
    mkdir -p "$control_dir"
    if bsdtar -xf "$control_tar" -C "$control_dir" --no-same-owner 2>/dev/null \
       && [[ -f $control_dir/control ]]; then
      if ! grep -qx 'Architecture: amd64' "$control_dir/control"; then
        error 'upstream .deb no longer targets amd64'
        rm -f "$listing"
        return 1
      fi
    fi
  fi

  rm -f "$listing"
  msg 'payload layout verified'
}

package() {
  cd "$srcdir"

  local data_tar
  data_tar=$(_unpack_deb "$srcdir/.build-deb") || return 1
  bsdtar -xf "$data_tar" -C "$pkgdir" --no-same-owner

  # Keep the upstream layout byte-for-byte -- do not "clean up" the paths.
  # The Tauri shell resolves its resources relative to the real executable and
  # additionally probes /usr/lib/<productName>; relocating the payload makes the
  # Node sidecar spawn with wrong paths ("ignoring invalid resource directory"
  # then "sidecar exited") and the app fails at boot. For the same reason
  # nothing may be pruned from dsh-desktop/: bundle-integrity.js compares
  # per-package file counts against bundle-manifest.json at startup and reports
  # a damaged bundle when files go missing.
  chmod 755 "$pkgdir/usr/bin/dsh-eac-shell"
  chmod 755 "$pkgdir/usr/lib/Deepseek Harness EAC/dsh-desktop/vendor/node/node"

  # Upstream ships an empty Categories=, which leaves the app in the "Other"
  # menu (or nowhere) on most desktops. Nothing validates this file at runtime,
  # so it is safe to correct.
  local desktop="$pkgdir/usr/share/applications/Deepseek Harness EAC.desktop"
  sed -i 's/^Categories=.*/Categories=Development;/' "$desktop"
  grep -q '^StartupNotify=' "$desktop" || sed -i '/^StartupWMClass=/i StartupNotify=true' "$desktop"
}
