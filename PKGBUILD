# Beta package:
# Maintainer: Eduard Tolosa (edu4rdshl)

# Patched package:
# Maintainer: Térence Clastres <t.clastres@gmail.com>
# Co-maintainer: Saren Arterius <saren@wtako.net>
# Co-maintainer: Mingi Sung <fiestalake@disroot.org>

# Official package:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>


### PACKAGE OPTIONS
## MERGE REQUESTS SELECTION
# Merge Requests List: ('579' '1441' '3304' '3327' '3373')
_merge_requests_to_use=('1441' '3304' '3327' '3373')

## Disable building the DOCS package (Enabled if not set)
# Remember to unset this variable when producing .SRCINFO
: "${_disable_docs:=""}"

## Enable the `check()` operation (Disabled if not set)
: "${_enable_check:=""}"


### IMPORTANT: Do no edit below this line unless you know what you're doing!

pkgbase=mutter-performance-beta
if [ -n "$_disable_docs" ]; then
  pkgname=mutter-performance-beta
else
  pkgname=(mutter-performance-beta mutter-performance-beta-docs)
fi
pkgver=46beta
pkgrel=1
pkgdesc="A window manager for GNOME - beta version | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64 aarch64)
license=(GPL)
depends=(
  at-spi2-core
  cairo
  colord
  dconf
  fontconfig
  fribidi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  gtk4
  harfbuzz
  iio-sensor-proxy
  lcms2
  libcanberra
  libcolord
  libdisplay-info
  libdrm
  libei
  libglvnd
  libgudev
  libice
  libinput
  libpipewire
  libsm
  libsysprof-capture
  libwacom
  libx11
  libxau
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  mesa
  pango
  pipewire
  pixman
  python
  startup-notification
  systemd-libs
  wayland
  xorg-xwayland
)
makedepends=(
  egl-wayland
  gi-docgen
  git
  gobject-introspection
  gtk3
  meson
  sysprof
  wayland-protocols
  xorg-server
  xorg-server-xvfb
)
if [ -n "$_enable_check" ]; then
  checkdepends=(gnome-session xorg-server-xvfb pipewire-session-manager python-dbusmock zenity)
fi
_commit=f8a257e104cf2055bccc3d1c9342d3c705fe8f3b  # tags/46.beta
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        '1441.patch'
        '3304.patch'
        '3327.patch'
        '3373.patch')
sha256sums=('SKIP'
            'b31854ad45ce257d99cd208d9af8a429ad408f18eed24337039316f44048dfa5'
            '3308241b53f15477fff4a92cc0a97eef643867965e9054f86d1e038d3d52cc1d'
            'da62bbdf094381460784b5d95d1c06236c6f3e2f0aa16611719030b531f4d2f5'
            '5cccd4b9e09b22dc5ecd6273c39a1639a80ea23b0356484ee0de9f2231453567')

pkgver() {
  cd $pkgname
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

pick_mr() {
  for mr in "${_merge_requests_to_use[@]}"; do
    if [ "$1" = "$mr" ]; then
      if [ "$2" = "merge" ] || [ -z "$2" ]; then
        echo "Downloading then Merging $1..."
        curl -O "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/$mr.diff"
        git apply "$mr.diff"
      elif [ "$3" = "revert" ]; then
        echo "Reverting $1..."
        git revert "$2" --no-commit
      elif [ "$3" = "patch" ]; then
    if [ -e ../"$2" ]; then
          echo "Patching with $2..."
          patch -Np1 -i ../"$2"
        else
          echo "Downloading $mr as $2 then patching..."
          curl -O "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/$mr.diff" -o "$2"
          patch -Np1 -i "$2"
        fi
      else
        echo "ERROR: wrong argument given: $2"
      fi
      break
    fi
  done
}

prepare() {
  cd $pkgname

  git reset --hard
  git cherry-pick --abort || true
  git clean -fd

  #git remote add vanvugt https://gitlab.gnome.org/vanvugt/mutter.git || true
  #git remote add verdre https://gitlab.gnome.org/verdre/mutter.git || true
  #git remote add 3v1no https://gitlab.gnome.org/3v1n0/mutter.git || true

  #git fetch vanvugt
  #git fetch verdre
  #git fetch 3v1no

  ### Merge Requests

  # Merge Request Prototype
  # Title:
  # Author:
  # URL:
  # Type:
  # Status:
  # Comment:
  # git cherry-pick -n first_commit^..last_commit
  #
  # Possible Type:
  #   1. Improvement: Makes an already existing feature behave better, more efficiently/reliably.
  #   2. Feature: Adds a new functionality.
  #   3. Fix: Regression/bug fix only available in master (not backported).
  #   4. Cleanup: Code styling improvement, function deprecation, rearrangement...
  #
  # Possible Status:
  #   1. Needs rebase: Conflicts with master branch.
  #   2. Needs review: Mutter maintainers needs to review the new/updated MR and provide feedback.
  #   3. Needs changes: MR needs to be adjusted based on maintainers feedback.
  #   4. Merged: MR approved and it changes commited to master.
  #
  # Generally, a MR status oscillate between 2 and 3 and then becomes 4.

  # Title: backends: Do not reload keymap on new keyboard notifications
  # Author: Carlos Garnacho <carlosg@gnome.org>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/579
  # Type: 1
  # Status: 4
  # Comment: Was reverted: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/833
  #          If you use stenography software or play hardcore rhythm games like Lunatic Rave 2/osumania, use it.
  pick_mr '579' ce86f90efbaa51522ba14c5b4cad933c2106de42 'revert'

  # Title: Nvidia secondary GPU copy acceleration
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3304
  # Type: 3
  # Status: 2
  # Comment: This fixes three issues that were preventing GPU copies on the Nvidia proprietary driver.
  pick_mr '3304' '3304.patch' 'patch'

  # Title: backends/native: Fix the issue where KMS thread fails to acquire realtime on boot
  # Author: Agustín Dall'Alba <gnome@dallalba.com.ar>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3327
  # Type: 3
  # Status: 2
  # Comment: Remove G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START to fix the issue where KMS thread
  #          fails to acquire realtime priority on boot when the shell starts before the rtkit daemon.
  pick_mr '3327' '3327.patch' 'patch'

  # Title: kms/crtc: Increase default deadline evasion to 1000 microseconds
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3373
  # Type: 3
  # Status: 2
  # Comment: This fix cursor stutter.
  pick_mr '3373' '3373.patch' 'patch'

  # Title: Draft: Dynamic triple/double buffering (v4)
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
  # Type: 1
  # Status: 2 & 3
  # Comment: Help GPU frequencies to scale up but not currently working on Wayland.
  pick_mr '1441' '1441.patch' 'patch'

}

build() {
  local meson_options=(
    -D egl_device=true
    -D wayland_eglstream=true
    -D installed_tests=false
    -D libdisplay_info=true
    -D docs=$(if ! [ -n "$_disable_docs" ]; then echo "true"; else echo "false"; fi)
    -D tests=$(if [ -n "$_enable_check" ]; then echo "true"; else echo "false"; fi)
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}


if [ -n "$_enable_check" ]; then
  check() {
    mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
    glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
    export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR
    export NO_AT_BRIDGE=1 GTK_A11Y=none
    export MUTTER_DEBUG_DUMMY_MODE_SPECS="800x600@10.0"
    local _pipewire_session_manager=$(pacman -Qq pipewire-session-manager)

    echo "Tests may be broken with certain setups. Use with caution!"
    # Tests fail:
    # mutter:cogl+cogl/conform / cogl-test-offscreen-texture-formats-gles2
    xvfb-run -s '-nolisten local +iglx -noreset' \
      ${pkgbase}/src/tests/meta-dbus-runner.py --launch=pipewire --launch=${_pipewire_session_manager} \
      meson test -C build --no-suite 'mutter/kvm' --no-rebuild \
    --print-errorlogs --timeout-multiplier 10 --setup plain ||:

  }
fi

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_mutter-performance-beta() {
  provides=(mutter libmutter-14.so)
  conflicts=(mutter mutter-performance)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  if ! [ -n "$_disable_docs" ]; then
    _pick docs "$pkgdir"/usr/share/mutter-*/doc
  fi
}

if ! [ -n "$_disable_docs" ]; then
  package_mutter-performance-beta-docs() {
    provides=(mutter-docs)
    conflicts=(mutter-docs)
    pkgdesc+=" (documentation)"
    depends=()

    mv docs/* "$pkgdir"
  }
fi

