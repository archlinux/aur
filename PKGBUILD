# Patched package:
# Maintainer: Saren Arterius <saren@wtako.net>
# Co-maintainer: Térence Clastres <t.clastres@gmail.com>
# Co-maintainer: Mingi Sung <sungmg@saltyming.net>

# Official package:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com


### PACKAGE OPTIONS
## MERGE REQUESTS SELECTION
# Merge Requests List: ()
_merge_requests_to_use=()


### IMPORTANT: Do no edit below this line unless you know what you're doing

_pkgname=gnome-shell
pkgname=gnome-shell-performance-unstable
pkgver=47.3
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64 aarch64)
license=(GPL)
depends=(
  accountsservice
  gcr-4
  gjs
  gnome-autoar
  gnome-session
  gnome-settings-daemon
  gsettings-desktop-schemas
  gtk4
  libadwaita
  libcanberra-pulse
  libgdm
  libgweather-4
  libibus
  libnma-gtk4
  libsecret
  libsoup3
  mutter
  unzip
  upower
)
makedepends=(
  asciidoc
  bash-completion
  evolution-data-server
  gi-docgen
  git
  glib2-devel
  gnome-control-center
  gobject-introspection
  meson
  python-docutils
  sassc
)
_commit=19ac7e2b08454dc4faf3130c2e9977065db70a26  # tags/47.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=5f9768a2eac29c1ed56f1fbb449a77a3523683b6"
)
sha256sums=('091c3358094a02b62efdba02852e8cc3929bedf94fcd8fa7ba6e7eac624e6a5a'
            '587319b45ff7d989635aed0c3bd9ef834d6e53ae46788cb6ba083d42d7e63855')
b2sums=('22b681e936f231f254fe701a7c9f499031235615afbe401403a9960e7b912838e590ec3f04226a9a7e89173c3d14487234cfe091e743340f54428150a44d189d'
        'e31ae379039dfc345e8032f7b9803a59ded075fc52457ba1553276d3031e7025d9304a7f2167a01be2d54c5e121bae00a2824a9c5ccbf926865d0b24520bb053')

pkgver() {
  cd $_pkgname
  git describe --tags --abbrev=9 | sed -r 's/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/\./g'
}

pick_mr() {
  for mr in "${_merge_requests_to_use[@]}"; do
    if [ "$1" = "$mr" ]; then
      if [ "$2" = "merge" ] || [ -z "$2" ]; then
        msg2 "Downloading then Merging $1..."
        curl -O "https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/$mr.diff"
        git apply "$mr.diff"
      elif [ "$3" = "revert" ]; then
        msg2 "Reverting $1..."
        git revert "$2" --no-commit
      elif [ "$3" = "patch" ]; then
        if [ -e ../"$2" ]; then
          msg2 "Patching with $2..."
          patch -Np1 -i ../"$2"
        else
          msg2 "Downloading $mr as $2 then patching..."
          curl -O "https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/$mr.diff" -o "$2"
          patch -Np1 -i "$2"
        fi
      else
        msg2 "ERROR: wrong argument given: $2"
      fi
      break
    fi
  done
}

prepare() {
  # Inject gvc
  ln -s libgnome-volume-control gvc

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

}

build() {
  local meson_options=(
    -D gtk_doc=false
    -D tests=false
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # Inject gvc
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

package() {
  depends+=(libmutter-15.so)
  optdepends=(
    'evolution-data-server: Evolution calendar integration'
    'gnome-bluetooth-3.0: Bluetooth support'
    'gnome-control-center: System settings'
    'gnome-disk-utility: Mount with keyfiles'
    'gst-plugin-pipewire: Screen recording'
    'gst-plugins-good: Screen recording'
    'power-profiles-daemon: Power profile switching'
    'python-gobject: gnome-shell-test-tool performance tester'
    'python-simplejson: gnome-shell-test-tool performance tester'
    'switcheroo-control: Multi-GPU support'
  )
  provides=(gnome-shell gnome-shell=$pkgver gnome-shell=$epoch:$pkgver)
  conflicts=(gnome-shell)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"
}

