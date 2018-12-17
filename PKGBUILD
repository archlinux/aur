# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Patch origin: https://gist.github.com/DeadMetaler/12622bf9415c1100f2d436ffbd6778c6

pkgname=mutter-781835-workaround
_pkgname=mutter
pkgver=3.30.2+7
pkgrel=2
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
        https://gitlab.gnome.org/vanvugt/mutter/commit/fc02b040f3b750b0513f812813351c09795950f6.patch
        https://gitlab.gnome.org/GNOME/mutter/merge_requests/347.patch
        startup-notification.patch
        revert.patch)
sha256sums=('SKIP'
            'dffa2ca19281b9fa5a81bf80bd46a8eae78325c7e1f8b2a25c33945aa7cc0903'
            '1343ed3c21ca7ab4f179b864eae4b915b910406c3eb8259399973c29822f751c'
            '00d5e77c94e83e1987cc443ed7c47303aa33367ce912b2f665bcd34f88890a17'
            '2d2e305e0a6cca087bb8164f81bdc0ae7a5ca8e9c13c81d7fd5252eb3563fc09')

prepare() {
  cd $_pkgname

  ## Unmerged performance bits
  # Commented multiline comment start, remove the # below to disable the patches
  # : '

  git remote add vanvugt https://gitlab.gnome.org/vanvugt/mutter.git || true
  git fetch vanvugt

  # clutter: Deliver events sooner when possible
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/168/commits
  # may cause stutter when using mouse with high polling rate
  git cherry-pick 7782ed6e

  # clutter: Fix offscreen-effect painting of clones
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/117/commits
  git cherry-pick 5c123a76 || true
  echo 'm' | git mergetool
  git commit -m 'nicer'

  # Sync to the hardware refresh rate, not just 60.00Hz [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/171/commits
  git cherry-pick d20697ff
  git cherry-pick 1b310980

  # Geometric (GPU-less) picking
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/189
  git apply -3 ../347.patch
  git add -A && git commit -m "347"

  # clutter-actor: Add detail to captured-event signal [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/283/commits
  git cherry-pick c2404d16

  # clutter-stage-cogl: Reduce output latency and reduce missed frames too [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/281/commits
  git cherry-pick 8234efc0
  git cherry-pick d2fbb9ff

  # '
  # Commented multiline comment end, remove the # above if disabling the patches

  # Revert offending commit, recommended to comment out the line below if not using NVIDIA
  patch -Np1 -i ../revert.patch

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/216
  git apply -3 ../fc02b040f3b750b0513f812813351c09795950f6.patch

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
