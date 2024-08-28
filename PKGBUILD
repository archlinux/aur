# Patched package:
# Maintainer: Saren Arterius <saren@wtako.net>
# Co-maintainer: Térence Clastres <t.clastres@gmail.com>
# Co-maintainer: Mingi Sung <me@saltyming.pe.kr>

# Official package:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com


### PACKAGE OPTIONS
## MERGE REQUESTS SELECTION
# Merge Requests List: ('3252')
_merge_requests_to_use=('3252')


### IMPORTANT: Do no edit below this line unless you know what you're doing

_pkgname=gnome-shell
pkgname=gnome-shell-performance
pkgver=46.4
pkgrel=2
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
  sassc
)
if [ -n "$_enable_check" ]; then
  checkdepends=(
    appstream-glib
    python-dbusmock
    xorg-server-xvfb
  )
fi
_commit=7bbc1f21088b7227a47b93be70e43998972aa925  # tags/46.4^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=5f9768a2eac29c1ed56f1fbb449a77a3523683b6"
  'mr3252.patch'
  'fix-tray-offscreen-xwindows.patch'
)
sha256sums=('97318752d98d1b314993f1f9262afd7b92b04799688e035af3291620b97b924c'
            '587319b45ff7d989635aed0c3bd9ef834d6e53ae46788cb6ba083d42d7e63855'
            '29abd82509db22abb4ce1b3318c9d7bf6cc23ba28d0c222412c273d784eacf1d'
            '065daaadcb037ebe4a449bc82a74d078243ec9a6f82e2c015d6ebcb7d95ee622')
b2sums=('93362c6bc883f60cd8d97a4f6314a93ad86d9c3b82b3dcd43c94d53f932d971166e09561e078db91ef73c2eb4897d3b61e252a2f6c45f8061b2831e4e1b8b437'
        'e31ae379039dfc345e8032f7b9803a59ded075fc52457ba1553276d3031e7025d9304a7f2167a01be2d54c5e121bae00a2824a9c5ccbf926865d0b24520bb053'
        'bacf1db67096ebd3690de2d0a01ee1b0ba1ea3094c7539eff05e398acc230164724b3c872e468ad992409501fb027026bfad35e387be150e4dafd6be81a68841'
        '2d923a01c48b2ea5c25fe10e40cd81e8ed49c0adc0660211b1211529a5b98040dd0ae1a406e6f250b051e7db6d47e00a1ba7e9540cd5aecc466b92ee3d2aed4e')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
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

  # https://github.com/ubuntu/gnome-shell-extension-appindicator/issues/439
  # https://bugs.launchpad.net/ubuntu/+source/gnome-shell-extension-appindicator/+bug/2012388
  msg2 "Applying the shell tray icon patches..."
  patch -Np1 -i ../fix-tray-offscreen-xwindows.patch

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

  # Title: st/theme-node: Forget properties cache on theme changes
  # Author: Daniel van Vugt <daniel.van.vugt@canonical.com>
  # URL:  https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/3252
  # Type: 3
  # Status: 2
  # Comment: Closes:
  #          https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/7339
  #          https://github.com/micheleg/dash-to-dock/issues/2243
  #          https://github.com/micheleg/dash-to-dock/issues/2179
  pick_mr '3252' 'mr3252.patch' 'patch'

}

build() {
  local meson_options=(
    -D gtk_doc=true
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
  depends+=(libmutter-14.so)
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

