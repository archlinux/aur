# Patched package:
# Maintainer: Térence Clastres <t.clastres@gmail.com>
# Co-maintainer: Saren Arterius <saren@wtako.net>
# Co-maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Joakim Soderlund <joakim.soderlund@gmail.com>

# Official package:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>


### MERGE REQUESTS SELECTION

# Merge Requests List: ('579' '1441' '1241')
_merge_requests_to_use=('1441')

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgname=mutter-performance
pkgver=41.2+21+g73435807c
pkgrel=1
pkgdesc="A window manager for GNOME | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile libsysprof-capture)
makedepends=(gobject-introspection git egl-wayland meson xorg-server
             wayland-protocols sysprof)
checkdepends=(xorg-server-xvfb wireplumber python-dbusmock)
provides=(mutter mutter-781835-workaround libmutter-9.so)
conflicts=(mutter)
replaces=(mutter-781835-workaround)
groups=(gnome)
_commit=73435807c7253833bfcf31df62eb15f413e1b911  # tags/41.2^21
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        'mr1441.patch')
sha256sums=('SKIP'
            'f98d3aa2eb5aa9f766ec0bfbed6b168b765fcfff493d34512db993de2bf109fb')

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
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/579
  # Type: 1
  # Status: 4
  # Comment: Was reverted: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/833
  #          If you use stenography software or play hardcore rhythm games like Lunatic Rave 2/osumania, use it.
  pick_mr '579' ce86f90efbaa51522ba14c5b4cad933c2106de42 'revert'


  # Title: WIP: clutter-frame-clock: Triple buffering support (v4)
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
  # Type: 1
  # Status: 3
  # Comment: Help GPU frequencies to scale up but not currently working on Wayland
  #          Thanks @JockeTF in AUR for a quick patch.
  pick_mr '1441' '../mr1441.patch' 'patch'


  # Title: WIP: clutter/frame-clock: Allow update dispatch while presentation is pending
  # URL:  https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1241
  # Type: 1
  # Status: 3
  # Comment: Helps cursor movement under load on Wayland
  pick_mr '1241'


}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false
  meson compile -C build
}

_check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  pipewire &
  _p1=$!

  wireplumber &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  meson test -C build --print-errorlogs
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
