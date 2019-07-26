# Maintainer: Saren Arterius <saren@wtako.net>
# Maintainer: Térence Clastres <t.clastres@gmail.com>

# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-performance
pkgver=3.32.2+43+gb7f158811
pkgrel=3
pkgdesc="A window manager for GNOME | Attempts to improve performances with non-upstreamed merge-requests and frequent stable branch resync"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire xorg-server-xwayland gnome-shell)
makedepends=(gobject-introspection git egl-wayland meson xorg-server)
checkdepends=(xorg-server-xvfb)
options=(debug !strip)
provides=(mutter mutter-781835-workaround)
conflicts=(mutter)
replaces=(mutter-781835-workaround)
groups=(gnome)
_commit=b7f158811934d8e4d9dd0be28ad8e1746ceac46c # tags/3.32.2^43
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  ### Adding and fetching remotes providing the selected merge-requests

  git remote add vanvugt https://gitlab.gnome.org/vanvugt/mutter.git || true
  git fetch vanvugt


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



  # Title: Various Clutter cleanups
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/666
  # Type: 4
  # Status: 4
  # Comment: Needed so !189 doesn't conflict
  git cherry-pick -n 5bd85ef7^..b0b1ff36

  # Title: Minor clutter stage cleanup
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/616
  # Type: 4
  # Status: 4
  # Comment: Needed so !661 doesn't conflict
  git cherry-pick -n 4064d9a7^..3073acc3

  # Title: Geometric (OpenGL-less) picking
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/189
  # Type: 1
  # Status: 2
  # Comment:
  git cherry-pick -n 9499bc21^..ce0e5db7

  # Title: clutter/stage-cogl: Don't skip over the next frame
  # URL : https://gitlab.gnome.org/GNOME/mutter/merge_requests/520
  # Type: 1
  # Status: 4
  # Comment:
  git cherry-pick -n 45244852

  # Title: Consolidate all frame throttling into clutter-stage-cogl
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/363
  # Type: 1
  # Status: 4
  # Comment:
  git cherry-pick -n 912a9ecf^..1dbf25af

  # Title: clutter/stage-cogl: Reschedule update on present
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/281
  # Type: 1
  # Status: 4
  # Comment:
  git cherry-pick -n 4faeb127

  # Title: clutter/stage: Process input events out of phase with redraws [performance]
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/661
  # Type: 1
  # Status: 2
  # Comment: Replaces !168
  git cherry-pick -n 3f6191bc^..c8d45c2a

  # Title: Resource scale computation optimizations
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/493
  # Type: 1
  # Status: 3
  # Comment: Disabled because breaks the overview on Wayland. https://gitlab.gnome.org/GNOME/mutter/merge_requests/493#note_549833
  # git cherry-pick -n 3aa449af^..1017ce44

  # Title: clutter: Defer actor allocations till shown
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/677
  # Type: 1
  # Status: 4
  # Comment:
  git cherry-pick -n 0eab73dc

  # Title: Honour `CLUTTER_ACTOR_NO_LAYOUT` more efficiently
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/575
  # Type: 1
  # Status: 2
  # Comment: Saren found a way to fetch hash based on commit name. It's controversial but might be interesting to create a function to call for each MR to not have to update the hash at each rebase.
  h_first=$(git log --oneline --all | grep "clutter/stage: Add an API for shallow relayouts" | tail -n 1 | awk '{print $1}') # Sorry guys
  h_last=$(git log --oneline --all | grep 'clutter/actor: Use the new shallow relayout API' | tail -n 1 | awk '{print $1}') # Sorry guys
  echo "Found $h_first^$h_last for MR575"
  git cherry-pick -n $h_first^..$h_last

  # Title: cogl: Remove GLX "threaded swap wait" used on Nvidia
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/602
  # Type: 1
  # Status: 2
  # Comment:
  git cherry-pick -n -Xtheirs df38ad3c

  # Title: compositor: Don't emit size-changed when only position changes
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/568
  # Type: 1
  # Status: 4
  # Comment:
  git cherry-pick -n 01e20a6b

  # Title: cogl: Enable EGL_IMG_context_priority
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/454
  # Type: 1
  # Status: 4
  # Comment:
  git cherry-pick -n 3f29b478^..7df86fb2

  # Title: Add experimental key for RT scheduling
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/460
  # Type: 1
  # Status: 4
  # Comment: Only works in Wayland
  git cherry-pick -n dae2c1d4

  # Title: backends: Do not reload keymap on new keyboard notifications
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/579
  # Type: 1
  # Status: 4
  # Comment: Disabled by default because it has issues when using multiple layouts
  # git cherry-pick -n b01edc22

  # Title: Fix background texture corruption when resuming from suspend on Nvidia
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/600
  # Type: 2
  # Status: 4
  # Comment:
  git cherry-pick -n a5265365

  # Title: WIP: renderer-native: Accept frames without ever blocking
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/73
  # Type: 1
  # Status: 1
  # Comment: Might be replaced: https://gitlab.gnome.org/GNOME/mutter/merge_requests/73#note_544784
  # git cherry-pick -n 35ec0eaf^..202530c9

  # Title: clutter: Force an allocation on clone source if necessary
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/693
  # Type: 3
  # Status: 4
  # Comment: Sometimes produces artefacts in the application grid: https://gitlab.gnome.org/GNOME/mutter/merge_requests/693#note_566491
  #git cherry-pick -n 08a3cbfc

  # Title: core: Only trigger MetaWorkspace::window-* on toplevel window types
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/701
  # Type: 1
  # Status: 2
  # Comment:
  git cherry-pick -n d7f799bf

  # Title: Make MetaCullable implementations more thorough wrt painted areas
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/698
  # Type: 1
  # Status: 2
  # Comment:
  git cherry-pick -n c98d57f2^..53eca1c4

  # Title: clutter-stage-cogl: Use regions
  # URL: https://gitlab.gnome.org/GNOME/mutter/merge_requests/692
  # Type: 1
  # Status: 1
  # Comment:
  #git cherry-pick -n f2694e72^..d0edf91c

}

build() {
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
