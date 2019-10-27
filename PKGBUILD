# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-performance
_pkgname=gnome-shell
pkgver=3.34.1+7+g750c5acd3
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gnome-settings-daemon
         gnome-themes-extra gsettings-desktop-schemas libcanberra-pulse libcroco libgdm libsecret
         mutter nm-connection-editor unzip gstreamer libibus gnome-autoar)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc asciidoc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell gnome-shell=$pkgver)
conflicts=(gnome-shell)
install=$pkgname.install
_commit=750c5acd30ef724b2398bb9d9178a130b58e046b   # gnome-3-34
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

hash_of() {
  git log --oneline --all | grep "$1" | tail -n 1 | awk '{print $1}'
}

git_cp_by_msg() {
  # Comment: Saren found a way to fetch hash based on commit name. It's controversial but might be interesting to create a function to call for each MR to not have to update the hash at each>
  h_first=$(hash_of "$2")
  if [[ -n "$3" ]]; then
    h_last=$(hash_of "$3")
    echo "Found $h_first^$h_last for $1"
    git cherry-pick -n -Xtheirs $h_first^..$h_last
  else
    echo "Found $h_first for $1"
    git cherry-pick -n -Xtheirs $h_first
  fi
}

prepare() {
  cd $_pkgname

  ### Adding and fetching remotes providing the selected merge-requests

  git cherry-pick --abort || true
  # git remote add verde https://gitlab.gnome.org/verdre/gnome-shell.git || true
  # git fetch verde
  git remote add 3v1n0 https://gitlab.gnome.org/3v1n0/gnome-shell || true
  git fetch 3v1n0

  ### Merge Requests

  # Merge Request Prototype
  # Title:
  # URL:
  # Type:
  # Status:
  # Comment:
  # git cherry-pick -n first_commit^..last_commit
  #
  # Possible Status:
  #   1. Needs rebase: Conflicts with master branch.
  #   2. Needs review: Mutter maintainers needs to review the new/updated MR and provide feedback.
  #   3. Needs changes: MR needs to be adjusted based on maintainers feedback.
  #   4. Merged: MR approved and it changes commited to master.
  #
  # Generally, a MR status oscillate between 2 and 3 and then becomes 4.
  #
  # Possible Type:
  #   1. Improvement: Makes an already existing feature behave better, more efficiently/reliably.
  #   2. Feature: Adds a new functionality.
  #   3. Fix: Regression/bug fix only available in master (not backported).
  #   4. Cleanup: Code styling improvement, function deprecation, rearrangement...

  # Title: St theme: use css instance data
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/536
  # Type: 2
  # Status: 3
  # Comment: Crash fix for st_theme_get_custom_stylesheets
  git_cp_by_msg '!536' 'st-theme: Use CRStyleSheet app_data instead of hash map' 'st-theme: Use glib auto free/ptr features'

  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson $_pkgname build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  # https://bugs.archlinux.org/task/37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}
