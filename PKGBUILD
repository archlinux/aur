# Patched package:
# Maintainer: Térence Clastres <t.clastres@gmail.com>
# Co-maintainer: Saren Arterius <saren@wtako.net>
# Co-maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Joakim Soderlund <joakim.soderlund@gmail.com>

# Official package:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>


### PACKAGE OPTIONS

## MERGE REQUESTS SELECTION
# Merge Requests List: ('579' '1154' '1441' '1877')
_merge_requests_to_use=('1441' '1877')

## Disable building a DOCS package
# Remember to unset this variable when producing .SRCINFO
: "${_disable_docs:=""}"

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=mutter-performance
if [ -n "$_disable_docs" ]; then
  pkgname=mutter-performance
else
  pkgname=(mutter-performance mutter-performance-docs)
fi
pkgver=42.2+r11+gcd52c57bc
pkgrel=4
pkgdesc="A window manager for GNOME | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile libsysprof-capture)
makedepends=(gobject-introspection git egl-wayland meson xorg-server
             wayland-protocols sysprof gi-docgen)
checkdepends=(xorg-server-xvfb pipewire-session-manager python-dbusmock)
_commit=cd52c57bc65a25363a25ee575b0c9d1d4e471ba8  # tags/42.2^11
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        'mr1154.patch'
        'mr1441.patch'
        'mr1877.patch')
sha256sums=('SKIP'
            '9b3ddccc50adc57b4d8f3bd2236680c1409e5c72dd4e7722ae4d83428eec95e8'
            'c8e8e05f3b5ccf2faeeda45231bc12e4fff516c1e27f9d7a880a71eb00e5b0fa'
            '5284e17ac5cc129ecd21a0726d8159d44abc2e0da5dbcf195f2f05aab8e06120')

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

  # Title: backend/native: Add support for variable refresh rate
  # Author: Dor Askayo <dor.askayo@gmail.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1154
  # Type: 2
  # Status: 2 & 3
  # Comment: Add the logic required to detect monitors that are capable of VRR and
  #          the ability to activate it using KMS properties.
  #          Currently, it does not work with mr1441, so be aware of that.
  #          Check the vrr-support-42 branch of @doraskayo's repo below for gnome-control-center
  #          to be used with this MR:
  #          https://gitlab.gnome.org/doraskayo/gnome-control-center/-/commits/vrr-support-42
  pick_mr '1154' 'mr1154.patch' 'patch'

  # Title: WIP: clutter-frame-clock: Triple buffering support (v4)
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
  # Type: 1
  # Status: 2 & 3
  # Comment: Help GPU frequencies to scale up but not currently working on Wayland.
  #          Thanks @JockeTF in AUR for the patch backported to gnome-41 base.
  pick_mr '1441' 'mr1441.patch' 'patch'

  # Title: compositor: Use native GL mipmapping instead of MetaTextureTower
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1877
  # Type: 3
  # Status: 2 & 3
  # Comment: Fix #849 (Window previews in the overview are not mipmapped on HiDPI)
  pick_mr '1877' 'mr1877.patch' 'patch'

}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  if [ -n "$_disable_docs" ]; then
    arch-meson $pkgname build \
      -D egl_device=true \
      -D wayland_eglstream=true \
      -D docs=false \
      -D installed_tests=false
  else
    arch-meson $pkgname build \
      -D egl_device=true \
      -D wayland_eglstream=true \
      -D docs=true \
      -D installed_tests=false
  fi

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

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

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
  provides=(mutter libmutter-10.so)
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
