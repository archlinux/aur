# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-performance
pkgver=3.32.2+10+g2483b6038
pkgrel=2
pkgdesc="Next generation desktop shell | Attempt to improve the performance by non-upstreamed patches"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gnome-settings-daemon
         gnome-themes-extra gsettings-desktop-schemas libcanberra-pulse libcroco libgdm libsecret
         mutter-performance nm-connection-editor unzip gstreamer libibus libcap-ng)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell gnome-shell=$pkgver)
conflicts=(gnome-shell)
install="$pkgname.install"
_commit=2483b603869009f7294c00e8a5bdb778eb948b6d # tags/3.32.2^10
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
         https://gitlab.gnome.org/GNOME/gnome-shell/uploads/4a083c80c81eeb0dd1be64e0e24b5c17/nvidia-background-workaround.patch)
sha256sums=('SKIP'
            'SKIP'
            '505c90290e5a867692f55d3209a22755bcffb997e7cac59e49b1a78c976d5af9')
pkgver() {
  cd $pkgname

  git describe --tags | sed "s/-/+/g"
}

prepare() {
  cd $pkgname

  ### Adding and fetching remotes providing the selected merge-requests

  git remote add verde https://gitlab.gnome.org/verdre/gnome-shell.git || true
  git fetch verde


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

  # https://gitlab.gnome.org/GNOME/gnome-shell/issues/1084
  #patch -Np1 -i ../nvidia-background-workaround.patch


  # Title: Fixes and performance improvements to the extension system
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/96
  # Type: 1
  # Status: 2
  # Comment:
  git cherry-pick -n 39f10eaa^..6e704ee1

  # Title: Refine the app menu a bit
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/406
  # Type: 2
  # Status: 4
  # Comment:
  git cherry-pick -n ffaca005^..56a36165

  # Title: iconGrid: Hide children outside allocation loop
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/566
  # Type: 1
  # Status: 4
  # Comment:
  git cherry-pick -n 520cea93

  # Title: appDisp allocation cycle fix
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/581
  # Type: 3
  # Status: 4
  # Comment:
  git cherry-pick -n c1c45f95

  # Title: iconGrid: Fix animation glitch
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/582
  # Type: 3
  # Status: 4
  # Comment:
  git cherry-pick -n b4797956

  # Title: Mild performance improvements on style changes
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/524
  # Type: 1
  # Status: 4
  # Comment: Use only the first commit as the other one causes issues and is reverted
  git cherry-pick -n fb04dafb

  # Title: st: Only emit ::style-changed on actual changes
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/505
  # Type: 1
  # Status: 4
  # Comment: Restore this reverted commit to 3.32 as !505 fixes its introduced style glitches
  git cherry-pick -n f74c07b9

  # Title: st: Consider non-background properties for ::style-changed
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/595
  # Type: 3
  # Status: 4
  # Comment: Fixes style glitches introduced by !505
  git cherry-pick -n 7359e431^..be40de5a

  # Title: Fix the calculation of max number of results in the grid search
  # URL: https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/110
  # Type: 3
  # Status: 4
  # Comment:
  git cherry-pick -n a7852705^..2d908e80

  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson $pkgname build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  # https://bugs.archlinux.org/task/37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}
