# Maintainer: Sobel <fghfghfghfgh@keemail.me>

_pkgname=muzika
_flatpak_pkgname=com.vixalien.muzika
pkgname=$_pkgname-git
pkgver=r1262.daca260
pkgrel=1
pkgdesc='GTK4/Adwaita Elegant Youtube Music streaming app'
arch=('x86_64')
url=https://github.com/vixalien/muzika
license=(GPL-3.0)
depends=(
  gjs
  gtk4
  libportal-gtk4
  gst-plugin-gtk4
  gst-plugins-good
  gst-plugins-bad

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  #
  # Muzika uses the latest nightly version of Adwaita,
  # so there are two choices: either enable gnome-unstable repo,
  # and install libadwaita and gtk4 from there,
  # or use libadwaita-git, which also requires the gtk4-git to be compiled.
  #
  # To support both of the methods, some additional actions required
  # which cannot be done in PKGBUILD:
  # - The gnome-unstable repo method, this doesn't require you to build anything:
  #   Enable the gnome-unstable repo as it is said in
  #     https://wiki.archlinux.org/title/Official_repositories#gnome-unstable
  #   Move it above the [extra] repo and run
  #     [#] pacman -S libadwaita
  #   Procced with your favourite AUR manager as: yay -S muzika.
  #   While building in clean chroot you also need to manually
  #   enable the repo in $CHROOT/root/etc/pacman.conf
  # - The libadwaita-git method:
  #   Compile and install gtk4-git.
  #   Compile and install libadwaita-git manually with makepkg, look for the patch by me in comments,
  #     as for now it can only be compiled with gtk4-git.
  #   Now you should be able to install muzika with your favourite AUR package manager
  #   You can install gtk4 back if you want so, the muzika doesn't require itself the last version
  #     (however libadwaita-git requires it for compilation)
  #
  # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  libadwaita # >= 1.6 (either libadwaita-git or from the gnome-unstable repo)
)
makedepends=(
  git
  meson
  yarn
  gettext
  blueprint-compiler
)
options=('!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/vixalien/muzika)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_change_yarn_home() {
  export YARN_HOME="$srcdir"/yarn
  export YARN_RC="$YARN_HOME"/.yarnrc

  mkdir -p "$YARN_HOME" &&
    mkdir -p "$YARN_HOME"/link "$YARN_HOME"/cache "$YARN_HOME"/global

  echo "--link-folder \"${YARN_HOME}/link\"" >> "$YARN_RC"
  echo "--cache-folder \"${YARN_HOME}/cache\"" >> "$YARN_RC"
  echo "--global-folder \"${YARN_HOME}/global\"" >> "$YARN_RC"
  sed -i "s/'--offline', /'--no-default-rc',/g" src/meson.build
}

_change_desktop_entry_name() {
  sed -i "s/profile = '.Devel'/profile = ''/g" meson.build
  sed -i "s/appstreamcli.found()/false/g" data/meson.build
  find . -type f -name "*$_flatpak_pkgname*" -exec bash -c 'mv "$0" "${0//'$_flatpak_pkgname'/muzika}"' {} \;
  find . -type f -exec sed -i "s/"$_flatpak_pkgname".Devel/muzika/g" {} +
  find . -type f -exec sed -i "s/"$_flatpak_pkgname"/muzika/g" {} +
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update

  _change_yarn_home
  _change_desktop_entry_name
}

build() {
  local meson_options=(
    -D profile=development
    -D yarnrc="$YARN_RC"
  )

  arch-meson "$_pkgname" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
