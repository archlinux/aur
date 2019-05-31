# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Patch origin: https://gist.github.com/DeadMetaler/12622bf9415c1100f2d436ffbd6778c6


pkgname=mutter-781835-workaround
pkgver=3.32.2+5+g13a1624c1
pkgrel=1
pkgdesc="A window manager for GNOME. This package reverts a commit which may causes performance problems for nvidia driver users. Some performance patches also included."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire xorg-server-xwayland gnome-shell)
makedepends=(gobject-introspection git egl-wayland meson xorg-server)
checkdepends=(xorg-server-xvfb)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
_commit=13a1624c1050c91cd4d8a298f7a10fafe56fe9e5 # tags/3.32.2^5
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        0001-wayland-output-Report-unscaled-size-even-in-logical-.patch
        216.patch)
sha256sums=('SKIP'
            '842162bf8cec5d69fdb80c85fd152ddd3db6a9179d11d6f81d486f79814838c0'
            'ed4f3cf738a3cffdf8a6e1a352bf24d74078c3b26fb9262c5746e0d95b9df756')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  ## Unmerged performance bits
  # Commented multiline comment start, remove the # below to disable the patches
  # : '

  git remote add vanvugt https://gitlab.gnome.org/vanvugt/mutter.git || true
  git fetch vanvugt

  # Geometric (OpenGL-less) picking
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/189
  git cherry-pick -n bfdf54fa

  # clutter/stage-cogl: Don't skip over the next frame
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/520
  git cherry-pick -n 45244852

  # Consolidate all frame throttling into clutter-stage-cogl
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/363
  h_first=$(git log --oneline --all | grep "clutter/stage-cogl: Remove magic numbers" | tail -n 1 | awk '{print $1}') # Sorry guys
  h_last=$(git log --oneline --all | grep 'clutter/master-clock: Remove fallback throttles' | tail -n 1 | awk '{print $1}') # Sorry guys
  echo "Found $h_first^$h_last for MR363"
  git cherry-pick -n $h_first^..$h_last

  # clutter/stage-cogl: Reschedule update on present
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/281
  git cherry-pick -n 4faeb127

  # clutter: Deliver events sooner when possible
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/168
  # still has issues with 1000Hz mice
  # git cherry-pick -n ae8fc614

  # Resource scale computation optimizations
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/493
  git cherry-pick -n 3aa449af^..1017ce44

  # Add experimental key for RT scheduling
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/460
  git cherry-pick -n dae2c1d4

  # cogl: Enable EGL_IMG_context_priority
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/454
  git cherry-pick -n 3f29b478^..7df86fb2

  # WIP: renderer-native: Accept frames without ever blocking
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/73
  # does not compile yet
  # git cherry-pick -n 35ec0eaf^..202530c9

  # Honour `CLUTTER_ACTOR_NO_LAYOUT` more efficiently [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/575
  h_first=$(git log --oneline --all | grep "clutter/stage: Add an API for shallow relayouts" | tail -n 1 | awk '{print $1}') # Sorry guys
  h_last=$(git log --oneline --all | grep 'clutter/actor: Use the new shallow relayout API' | tail -n 1 | awk '{print $1}') # Sorry guys
  echo "Found $h_first^$h_last for MR575"
  git cherry-pick -n $h_first^..$h_last

  # backends: Do not reload keymap on new keyboard notifications
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/579
  git cherry-pick -n b01edc22

  # cogl: Remove GLX "threaded swap wait" used on Nvidia [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/602
  git cherry-pick -n 88ee2f51

  # '
  # Commented multiline comment end, remove the # above if disabling the patches

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1534089
  patch -Np1 -i ../0001-wayland-output-Report-unscaled-size-even-in-logical-.patch
}

build() {
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false
  ninja -C build
}

: ' not working atm
check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  dbus-run-session xvfb-run -s '+iglx -noreset' meson test -C build
)
'

package() {
  DESTDIR="$pkgdir" meson install -C build
}
