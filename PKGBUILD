# Patched package:
# Maintainer: Térence Clastres <t.clastres@gmail.com>
# Co-maintainer: Saren Arterius <saren@wtako.net>
# Co-maintainer: Mingi Sung <FiestaLake@protonmail.com>
# Contributor: Joakim Soderlund <joakim.soderlund@gmail.com>

# Official package:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>


### PACKAGE OPTIONS
## MERGE REQUESTS SELECTION
# Merge Requests List: ('579' '1441' '1880' '2702' '2763')
_merge_requests_to_use=('1441' '1880' '2702' '2763')

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
pkgver=43.2+r3+g97dd7fb10
pkgrel=1
pkgdesc="A window manager for GNOME | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification libsm gnome-desktop libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire xorg-xwayland graphene
         libxkbfile libsysprof-capture lcms2 colord)
makedepends=(gobject-introspection git egl-wayland meson xorg-server
             wayland-protocols sysprof gi-docgen)
if [ -n "$_enable_check" ]; then
  checkdepends=(xorg-server-xvfb pipewire-session-manager python-dbusmock zenity)
fi
_commit=97dd7fb106ea2ea2e6a1d61a2693a6ae76359688  # tags/43.2^3
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        'mr1441.patch'
        'mr1880.patch'
        'mr2702.patch'
        'mr2763.patch')
sha256sums=('SKIP'
            'd7a014965cbb90892ccbe65d0de49ddce50191dbd7521467d7f11c2f4825045c'
            '20a90016dab0de9fb8e9cd7b38644e41d2006796f332b7a2d7c92bdf71bc3a4a'
            '1b0647ab0d39db3b334e86c39dbb81b80030339c8d1a9cd43ff88003e966dec2'
            '3cb32c36ca0de989713459d91359e81bba7ff9cafea612b5e6294cc4daac8108')

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

  # build: Replace deprecated/custom meson functions
  pick_mr '2702' 'mr2702.patch' 'patch'

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

  # Title: Backports for 43.3
  # Author: Robert Mader <robert.mader@posteo.de>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/2763
  # Type: 1
  # Status: 2 & 3
  pick_mr '2763' 'mr2763.patch' 'patch'

  # Title: Draft: Dynamic triple/double buffering (v4)
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
  # Type: 1
  # Status: 2 & 3
  # Comment: Help GPU frequencies to scale up but not currently working on Wayland.
  #          (Thanks @JockeTF in AUR for the patch backported to gnome-41 before.)
  pick_mr '1441' 'mr1441.patch' 'patch'

  # Title: wayland/surface: Avoid using buffers with unfinished client work, sub-surface fixes
  # Author: Michel Dänzer <mdaenzer@redhat.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880
  # Type: 1
  # Status: 4
  # Comment: Introduce transactions consisting of state changes for Wayland surfaces.
  #          Fixes: #1162
  pick_mr '1880' 'mr1880.patch' 'patch'

}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false \
    -D docs=$(if ! [ -n "$_disable_docs" ]; then echo "true"; else echo "false"; fi) \
    -D tests=$(if [ -n "$_enable_check" ]; then echo "true"; else echo "false"; fi)

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
  provides=(mutter libmutter-11.so)
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
