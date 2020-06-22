# Maintainer: Saren Arterius <saren@wtako.net>
# Maintainer: Térence Clastres <t.clastres@gmail.com>

# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>


### MERGE REQUESTS SELECTION

# available MR: ('429' '493' '579' '983' '798' '1003' ' 1267')
_merge_requests_to_use=('1124' '1003' '1267') # safe pick

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgname=mutter-performance
pkgver=3.36.3+6+g44a335812
pkgrel=1
pkgdesc="A window manager for GNOME | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire xorg-server-xwayland)
makedepends=(gobject-introspection git egl-wayland meson xorg-server sysprof)
checkdepends=(xorg-server-xvfb)
provides=(mutter mutter-781835-workaround libmutter-6.so)
conflicts=(mutter)
replaces=(mutter-781835-workaround)
groups=(gnome)
install=mutter.install
_commit=44a3358125317dbe2151cf0ac70ec2c382236881 # tags/3.36.3^6
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        "fix_clutter_actor_set_allocation_spam.patch")
sha256sums=('SKIP'
            '9b2a5c4ab0e8c5e9a54fddc7461a85455055b175af9a7c89b0e16f30a939fa42')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
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
        echo "Patching with $2..."
        patch -Np1 -i ../"$2"
      else
        echo "ERROR: wrong argument given: $2"
      fi
      break
    fi
  done
}

prepare() {
  cd $pkgname

  ### Adding and fetching remotes providing the selected merge-requests
  ### Only needed when there is no MR opened

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




  # Title: Resource scale computation optimizations
  # URL: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/493
  # Type: 1
  # Status: 3
  # Comment: Not picked by default because breaks the overview on Wayland. https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/493#note_549833
  pick_mr '493'

  # Title: clutter/stage: Update input devices right after doing a relayout
  # URL: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/429
  # Type: 1
  # Status: 1
  pick_mr '429'

  # Title: backends: Do not reload keymap on new keyboard notifications
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/579
  # Type: 1
  # Status: 4
  # Comment: Was reverted: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/833
  #          If you use stenography software or play hardcore rhythm games like Lunatic Rave 2/osumania, use it.
  pick_mr '579' ce86f90efbaa51522ba14c5b4cad933c2106de42 'revert'

  # Title: clutter/text: Check if attributes are equal before applying
  # URL: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/983
  # Type: 1
  # Status: 1
  # Comment:
  # pick_mr '983'

  # Title: Wayland surface fullscreen unredirect
  # URL: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/798
  # Type: 2
  # Status: 4
  # Comment:
  pick_mr '798'

  # Title: background: Limit mipmap levels to avoid loss of visible detail
  # URL: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1003
  # Type: 3
  # Status: 4
  # Comment:
  pick_mr '1003'

  # Title: clutter/stage: Use an own flag to prevent relayout reentry in the stage
  # URL: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1266
  # Type: 3
  # Status: 2
  # Comment:
  pick_mr '1267' 'fix_clutter_actor_set_allocation_spam.patch' 'patch'
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D xwayland_initfd=disabled \
    -D installed_tests=false

  meson compile -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  # Stacking test flaky
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
    meson test -C build --print-errorlogs || :
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
