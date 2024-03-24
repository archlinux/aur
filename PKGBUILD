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
# Merge Requests List: ('579' '1441' '3304' '3373')
_merge_requests_to_use=('1441' '3304' '3373')

## Disable building the DOCS package (Enabled if not set)
# Remember to unset this variable when producing .SRCINFO
: "${_disable_docs:=""}"

## Enable the `check()` operation (Disabled if not set)
: "${_enable_check:=""}"


### IMPORTANT: Do no edit below this line unless you know what you're doing!

_pkgname=mutter
pkgbase=mutter-performance
if [ -n "$_disable_docs" ]; then
  pkgname=mutter-performance
else
  pkgname=(mutter-performance mutter-performance-docs)
fi
epoch=1
pkgver=46.0
pkgrel=1
pkgdesc="A window manager for GNOME | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
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
_commit=c4753689e3413cd9332d885dd0297b3b7d9ba9ca  # tags/46.0^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        'mr1441.patch'
        'mr3304.patch'
        'mr3373.patch')
b2sums=('04a14854c8ec2668a340b241102b7b2ebbc0387a9771a5bd2c2366419ee08e7ebb308f2288f4a64b9d08053e1897eb514a46802584d1590f8bcebde4a613afaa'
        'f183956d0d632dcedbc8577ab73e66cee8806ab901723fc93861787ef19f491b32dd7986ca3df86f73a7e77270ce74c948ab7467cd91f9211858514ca310bb06'
        'f53c0a7cf5fe400e83379be5e3694dba0668e0917b5bf29c485cef802660e38176ab856118a030ddc87bd49b75d0dd6f9e0d8f32d2b2ef27ebb1737f8914bf21'
        '71f10db4ebe04a787940c7048131eac67cffd3ec8e415cfc961b8041b881f272650581e9df273e2a8da23a50ec9151c790dc2d5ecc0309ab2847a22f8c922c9c')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
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
  cd $_pkgname

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
  pick_mr '3304' 'mr3304.patch' 'patch'

  # Title: kms/crtc: Increase default deadline evasion to 1000 microseconds
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3373
  # Type: 3
  # Status: 2
  # Comment: This fix cursor stutter.
  pick_mr '3373' 'mr3373.patch' 'patch'

  # Title: Draft: Dynamic triple/double buffering (v4)
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
  # Type: 1
  # Status: 2 & 3
  # Comment: Help GPU frequencies to scale up but not currently working on Wayland.
  pick_mr '1441' 'mr1441.patch' 'patch'

}

build() {
  local meson_options=(
    -D egl_device=true
    -D wayland_eglstream=true
    -D installed_tests=false
    -D libdisplay_info=enabled
    -D docs=$(if ! [ -n "$_disable_docs" ]; then echo "true"; else echo "false"; fi)
    -D tests=$(if [ -n "$_enable_check" ]; then echo "true"; else echo "false"; fi)
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $_pkgname build "${meson_options[@]}"
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
    # mutter:core+mutter/stacking / fullscreen-maximize
    ## https://gitlab.gnome.org/GNOME/mutter/-/issues/3343
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

package_mutter-performance() {
  provides=(mutter libmutter-14.so)
  conflicts=(mutter)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  if ! [ -n "$_disable_docs" ]; then
    _pick docs "$pkgdir"/usr/share/mutter-*/doc
  fi
}

if ! [ -n "$_disable_docs" ]; then
  package_mutter-performance-docs() {
    provides=(mutter-docs)
    conflicts=(mutter-docs)
    pkgdesc+=" (documentation)"
    depends=()

    mv docs/* "$pkgdir"
  }
fi
