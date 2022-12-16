# Patched package:
# Maintainer: Saren Arterius <saren@wtako.net>
# Co-maintainer: Térence Clastres <t.clastres@gmail.com>
# Co-maintainer: Mingi Sung <FiestaLake@protonmail.com>

# Official package:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com


### PACKAGE OPTIONS
## MERGE REQUESTS SELECTION
# Merge Requests List: ()
_merge_requests_to_use=()

## Enable the `check()` operation (Disabled if not set)
: "${_enable_check:=""}"


### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgname=gnome-shell-performance
_pkgname=gnome-shell
pkgver=43.2+3+g5db40c1ea
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr-4 gjs upower gnome-session gtk4
         gnome-settings-daemon gsettings-desktop-schemas libcanberra-pulse
         libgdm libsecret mutter libnma unzip libibus gnome-autoar
         gnome-disk-utility libsoup3 libgweather-4)
makedepends=(gtk-doc gnome-control-center evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
if [ -n "$_enable_check" ]; then
  checkdepends=(xorg-server-xvfb)
fi
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration'
            'gst-plugins-good: Screen recording'
            'gst-plugin-pipewire: Screen recording'
            'gnome-bluetooth-3.0: Bluetooth support')
groups=(gnome)
provides=(gnome-shell gnome-shell=$pkgver gnome-shell=$epoch:$pkgver)
conflicts=(gnome-shell)
_commit=5db40c1ead734a4fa6ba9ecbd475bb2b317f2eb0  # tags/43.2^3
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

pick_mr() {
  for mr in "${_merge_requests_to_use[@]}"; do
    if [ "$1" = "$mr" ]; then
      if [ "$2" = "merge" ] || [ -z "$2" ]; then
        echo "Downloading then Merging $1..."
        curl -O "https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/$mr.diff"
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
          curl -O "https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/$mr.diff" -o "$2"
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

  ### Adding and fetching remotes providing the selected merge-requests
  ### Only needed when there is no MR opened

  git reset --hard
  git cherry-pick --abort || true

  # git remote add verde https://gitlab.gnome.org/verdre/gnome-shell.git || true
  # git fetch verde
  # git remote add 3v1n0 https://gitlab.gnome.org/3v1n0/gnome-shell || true
  # git fetch 3v1n0
  # git remote add vanvugt https://gitlab.gnome.org/vanvugt/gnome-shell.git || true
  # git fetch vanvugt

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

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $_pkgname build \
    -D gtk_doc=true \
    -D tests=$(if [ -n "$_enable_check" ]; then echo "true"; else echo "false"; fi)

  meson compile -C build
}

_check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  meson test -C build --print-errorlogs
)

if [ -n "$_enable_check" ]; then
  check() {
    dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
      bash -c "$(declare -f _check); _check"
  }
fi

package() {
  depends+=(libmutter-11.so)
  meson install -C build --destdir "$pkgdir"
}
