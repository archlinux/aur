# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Patch origin: https://gist.github.com/DeadMetaler/12622bf9415c1100f2d436ffbd6778c6

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Revert offending commit, recommanded to disable if not using NVIDIA
_revert=1


pkgname=mutter-781835-workaround
_pkgname=mutter
pkgver=3.30.2+7
pkgrel=14
pkgdesc="A window manager for GNOME. This package reverts a commit which may causes performance problems for nvidia driver users. Some performance patches also included."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire gnome-shell)
makedepends=(intltool gobject-introspection git egl-wayland)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
_commit=bcd6103c44ff74ebffd1737b8e0f3a952b83bd54  # tags/3.30.2^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
         216.patch 318.patch 365.patch
        https://gitlab.gnome.org/GNOME/mutter/merge_requests/347.patch
        startup-notification.patch
        revert.patch)
sha256sums=('SKIP'
            '1ae59343f3f5838babdfe1400962bb315d8b49189deb05bb516966b922cd26a5'
            'd4dcffa9c407e60e321670caaa44dcd6e2bfda7221d73ec4145a985c825a43b3'
            'a0c86a5770e34973e074dd542dd1c4abb3b7e45b7a429a8aa6a7d1e73df39796'
            '1343ed3c21ca7ab4f179b864eae4b915b910406c3eb8259399973c29822f751c'
            '00d5e77c94e83e1987cc443ed7c47303aa33367ce912b2f665bcd34f88890a17'
            '2d2e305e0a6cca087bb8164f81bdc0ae7a5ca8e9c13c81d7fd5252eb3563fc09')

prepare() {
  cd $_pkgname

  ## Unmerged performance bits
  # Commented multiline comment start, remove the # below to disable the patches
  # : '

  # workaround to automatically  resolve conflicts with git mergetool
  git config user.email "you@example.com"
  git config user.name "Your Name"

  git remote add vanvugt https://gitlab.gnome.org/vanvugt/mutter.git || true
  git fetch vanvugt

  # clutter: Deliver events sooner when possible
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/168
  # Disabled as may cause stutter when using mouse with high polling rate
  # git cherry-pick cd280c30

  # clutter: Fix offscreen-effect painting of clones
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/117/commits
  git cherry-pick 9a466f28

  # Geometric (GPU-less) picking
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/189
  git apply -3 ../347.patch
  git add -A && git commit -m "347"

  # clutter-actor: Add detail to captured-event signal [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/283
  git cherry-pick 4a9a0d62

  # clutter-stage-cogl: Reduce output latency and reduce missed frames too [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/281/commits
  git cherry-pick f5f3c00c^..785212cc

  # Consolidate all frame throttling into clutter-stage-cogl [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/363
  git cherry-pick b6fae4f8^..0f9393d5 -Xtheirs

  # clutter: Avoid redundant margin changes
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/399
  git cherry-pick e0fd7a6d

  # cursor-renderer-native: Floor the cursor position instead of rounding
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/353/commits
  git cherry-pick 8d514095

  # Avoid some parent actor relayouts/redraws
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/202
  git cherry-pick 9a843857^..ffaec917

  # Unassorted performance fixes
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/195
  git cherry-pick a7df4594..1d73533f

  # '
  # Commented multiline comment end, remove the # above if disabling the patches

  # Revert offending commit
  if [ -n "$_revert" ]; then
    patch -Np1 -i ../revert.patch
  fi

  # cogl-winsys-glx: Fix frame notification race/leak [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/216
  git apply -3 ../216.patch

  #Sync to the hardware refresh rate, not just 60.00Hz [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/318
  git apply -3 ../318.patch

  # clutter-stage: Don't emit "after-paint" when picking [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/365
  git apply -3 ../365.patch

  # https://bugs.archlinux.org/task/51940
  # As of 2018-05-08: Still needed, according to fmuellner
  git apply -3 ../startup-notification.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum \
      --enable-gtk-doc --enable-egl-device --enable-remote-desktop

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i {.,cogl,clutter}/libtool

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
