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
# Merge Requests List: ()
_merge_requests_to_use=()

## Disable building the DOCS package (Enabled if not set)
# Remember to unset this variable when producing .SRCINFO
: "${_disable_docs:=""}"

## Enable the `check()` operation (Disabled if not set)
: "${_enable_check:=""}"

### IMPORTANT: Do no edit below this line unless you know what you're doing

_pkgname=gnome-shell
pkgbase=gnome-shell-performance
if [ -n "$_disable_docs" ]; then
  pkgname=gnome-shell-performance
else
  pkgname=(gnome-shell-performance gnome-shell-performance-docs)
fi
pkgver=46.2
pkgrel=3
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
_commit=568152c22247efbb66cd13c15a638bf2d36bfadb  # tags/46.2^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "build-Add-explicit-dependency-on-Xfixes.patch"
  "shell-tray-icon-Trigger-a-relayout-when-the-underneath-xe.patch"
  "shell-tray-icon-Use-available-space-when-that-s-defined.patch"
  "tray-na-xembed-Destroy-socket-window-when-ending-the-embe.patch"
  "tray-na-xembed-Use-XShape-to-remove-input-on-socket-windo.patch"
)
sha256sums=('51bfde603207878ba74aa79e003c23307d46ff310a11d04c3f0386cae4ca4132'
            'SKIP'
            '512e3116ae9eea5b9d36092cd05074da86d37c911144f3d66df95da0d2d60353'
            'a3eda616996980f6f27c58c6b0d9c0d51094e7ad9c52f809a2a7f8eac9a2fbd9'
            '612dcb05347295893771396c8cfb993ec66871f04b9b6b93e188369cb12bdf2c'
            'fcfec78b92f027e73958cc3e4b740d38db719b8185c79b040571a297d42056b1'
            '9c51c48b3b7c6e5851630eb74289ab7897abca9226a89075a8b225fda2bda255')
b2sums=('dbc32a609c1ee2f59ce777f2af4a541b376d5e53bded7d4b6ddfa0a913db503fc429fa0f9b8c8068b9e00382383e669ea6cbf553caa2348666cdc33bee8ad4ad'
        'SKIP'
        'bcd22b41f9ed65db461bab3460954b15345c3f72fb4da99cae702627d69bef25c8689464cb3ac37ef23b38ea90b18cf2486a947aa9f8dae4f69915367ee3db16'
        'f8e7d2e5e7717b8610d53393dab97e0af181d8eed3d95988357347f57864e88f5339ce67f22ccef86d30d19c8a03b02e5938bc23c23db37f41e67482a133c3b4'
        'd13b586f9be8e4088f8cefa3c63e4e1143f8b7206a8c05fc4646dbdf2e931260da531ad2d2393c47e85e7a6f64dd76b36ea9884ce16246246bf116c657f90163'
        'f054d5dd341c45ed2accf06f3755096fb1e96aca04106fcda725115eee8e7c8dfc5b27e4ecd93df020524988a9559a25a052b2fa16d7ec48c178a4329ab7932a'
        'be45ea9d9c793ed9ba7f7cdbdaefc13868619db0502d73ba1ed3a3f2dd8b40d72c42facbce9598245fc802ad042e785a4515b6ea04015104eec88a0035cf8129')

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

  # https://github.com/ubuntu/gnome-shell-extension-appindicator/issues/439
  # https://bugs.launchpad.net/ubuntu/+source/gnome-shell-extension-appindicator/+bug/2012388
  msg2 "Patching with the shell tray icon patches..."
  patch -Np1 -i ../build-Add-explicit-dependency-on-Xfixes.patch
  patch -Np1 -i ../shell-tray-icon-Trigger-a-relayout-when-the-underneath-xe.patch
  patch -Np1 -i ../shell-tray-icon-Use-available-space-when-that-s-defined.patch
  patch -Np1 -i ../tray-na-xembed-Destroy-socket-window-when-ending-the-embe.patch
  patch -Np1 -i ../tray-na-xembed-Use-XShape-to-remove-input-on-socket-windo.patch

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
  local meson_options=(
    -D gtk_doc=true
    -D tests=$(if [ -n "$_enable_check" ]; then echo "true"; else echo "false"; fi)
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

_check() (
  export NO_AT_BRIDGE=1 GTK_A11Y=none
  export XDG_RUNTIME_DIR="$PWD/rdir"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  meson test -C build --no-rebuild --print-errorlogs -t 2
)

# Tests FAIL and or TIMEOUT at random
# gnome-shell:shell / fittsy; / headlessStart; / basic; / closeWithActiveWindows
if [ -n "$_enable_check" ]; then
  check() {
    dbus-run-session -- xvfb-run -s '-nolisten local +iglx -noreset' \
      bash -c "$(declare -f _check); _check" || :
  }
fi

package_gnome-shell-performance() {
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

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

if ! [ -n "$_disable_docs" ]; then
  package_gnome-shell-performance-docs() {
    pkgdesc+=" (API documentation)"
    provides=(gnome-shell-docs)
    conflicts=(gnome-shell-docs)
    depends=()

    mv doc/* "$pkgdir"
  }
fi
