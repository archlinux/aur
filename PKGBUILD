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
# Merge Requests List: ('579' '1441' '2941' 'revert-2878-partially' 'prio')
_merge_requests_to_use=('1441' 'revert-2878-partially' 'prio')

## Disable building the DOCS package (Enabled if not set)
# Remember to unset this variable when producing .SRCINFO
: "${_disable_docs:=""}"

## Enable the `check()` operation (Disabled if not set)
: "${_enable_check:=""}"


### IMPORTANT: Do no edit below this line unless you know what you're doing!

pkgbase=mutter-performance
if [ -n "$_disable_docs" ]; then
  pkgname=mutter-performance
else
  pkgname=(mutter-performance mutter-performance-docs)
fi
epoch=1
pkgver=44.2
pkgrel=2
pkgdesc="A window manager for GNOME | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64 aarch64)
license=(GPL)
depends=(
  colord
  dconf
  gnome-desktop-4
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  iio-sensor-proxy
  lcms2
  libcanberra
  libgudev
  libinput
  libsm
  libsysprof-capture
  libxkbcommon-x11
  libxkbfile
  pipewire
  startup-notification
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
  checkdepends=(xorg-server-xvfb pipewire-session-manager python-dbusmock zenity)
fi
_commit=e7ed2bf85700a2ff33b69826f6f0fff6e2f28e69  # tags/44.2^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        '0001-tests-cogl-test-framebuffer-get-bits-should-fail-on-.patch'
        'mr1441.patch'
        'mr2941.patch'
        'prio.patch')
sha256sums=('SKIP'
            '3321a1b16de808469333231096074e4caaca8563e0a138344246c9301dfac3b9'
            '3621acfed945773de4e107d4b077d8ff2b31eb4adc52d956ee6cc6bb245bac04'
            '395072af4b44baa2831031fb3c85ef1fa999f6de66ab5c09082432c369e37b2d'
            'cca15ee32b5b4d942960672ab37403b2ccf5d249711fc321b333c3936d9ab897')

pkgver() {
  cd $pkgname
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
  cd $pkgname

  git reset --hard
  git cherry-pick --abort || true

  # Unbreak tests with Mesa 23.1
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/2848
  git apply -3 ../0001-tests-cogl-test-framebuffer-get-bits-should-fail-on-.patch

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

  # Title: Revert "Prevent newly focused windows to steal focus from Shell (Take 3)" partially
  # Type: 3
  # Comment: See https://gitlab.gnome.org/GNOME/mutter/-/issues/2690
  #          Cannot be used with !2941
  pick_mr 'revert-2878-partially' 3ac82a58c51a5c8db6b49e89a1232f99c79644cc 'revert'

  # Title: Try unparenting client windows when fullscreen again
  # Author: Jonas Ådahl <jadahl@gmail.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/2941
  # Type: 3
  # Status: 2 & 3
  # Comment: Avoid bugs like #2678 (closed) when we try to avoid blits in the X server for fullscreen windows.
  #          Cannot be used with 'revert-2878-partially'
  pick_mr '2941' 'mr2941.patch' 'patch'

  # Title: Draft: Dynamic triple/double buffering (v4)
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
  # Type: 1
  # Status: 2 & 3
  # Comment: Help GPU frequencies to scale up but not currently working on Wayland.
  pick_mr '1441' 'mr1441.patch' 'patch'

  # Title: [REVERT] backends/native: Use rtkit to get realtime priority
  # Author: Carlos Garnacho <carlosg@gnome.org>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/2060
  # Type: 1
  # Status: 4
  # Comment: Reverting it to get rt-scheduler working with mr1441.
  pick_mr 'prio' 'prio.patch' 'patch'

}

build() {
  local meson_options=(
    -D egl_device=true
    -D wayland_eglstream=true
    -D installed_tests=false
    -D docs=$(if ! [ -n "$_disable_docs" ]; then echo "true"; else echo "false"; fi)
    -D tests=$(if [ -n "$_enable_check" ]; then echo "true"; else echo "false"; fi)
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

_check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR
  local _pipewire_session_manager=$(pacman -Qq pipewire-session-manager)

  pipewire &
  _p1=$!

  $_pipewire_session_manager &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  meson test -C build --print-errorlogs -t 3
)

if [ -n "$_enable_check" ]; then
  check() {
    echo "Tests may be broken with certain setups. Use with caution!"
    dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
      bash -c "$(declare -f _check); _check"
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
  provides=(mutter libmutter-12.so)
  conflicts=(mutter)
  groups=(gnome)
  install=mutter.install

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
