# -*- mode: pkgbuild -*-
# Maintainer  : Troplo <troplo@troplo.com>
# Contributor : Jeremy Borgman <borgman.jeremy@pm.me>
# Contributor : Mehrad Mahmoudian <m.mahmoudian@gmail.com>
# Contributor : Feresey <p.milko1999@yandex.ru>
# Contributor : j1simon <stemp@ono.com>
# Contributor : Feresey <p.milko1999@yandex.ru>
#
# Contribution Instructions:
#  0. Use this as the guide:
#       https://wiki.archlinux.org/title/PKGBUILD
#
#  1. clone the git:
#     ```sh
#     git clone https://aur.archlinux.org/flameshot-git.git
#     ```
#
#  2. Apply the changes you think are necessary to the following:
#       pkgrel=
#       depends=
#       makedepends=
#       optdepends=
#       build()
#
#  3. In terminal, naviagate to the folder you have the PKGBUILD in
#
#  4. Test the modified PKGBUILD file with `make test`, or alternatively all of the following commands
#       ```sh
#       # remove the possible builds
#       rm -f flameshot-git-r*.zst
#
#       # read this for more info about namcap: https://wiki.archlinux.org/title/Namcap
#       namcap -i PKGBUILD
#
#       # read this for more info about makepkg: https://wiki.archlinux.org/title/Makepkg
#       makepkg --syncdeps
#
#       pacman -U flameshot-git-r*.zst
#       ```
#
#  5. Fix any possible errors
#
#  6. create a patch with your modifications by `make patch` or alternatively:
#       ```sh
#       git diff --oneline --graph > my.patch
#       ```
#
#  7. copy the content of the my.patch file and post it in the discussion of
#     the AUR: https://aur.archlinux.org/packages/flameshot-git/



pkgname=flowinity-flameshot
_pkgname=flameshot
pkgver=r1965.a59c57ad
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software (Unofficial fork that adds the ability to upload to a PrivateUploader/Flowinity server.)"
arch=('i686' 'x86_64')
url="https://github.com/PrivateUploader/flameshot"
license=('GPL')
depends=(qt5-base hicolor-icon-theme qt5-svg kguiaddons5)
makedepends=(qt5-tools git cmake)
optdepends=('xdg-desktop-portal: To make Sway, Hyprland, and wlroots work'
            'xdg-desktop-portal-wlr: To make Sway, Hyprland, and wlroots work'
            'grim: To make Sway, Hyprland, and wlroots work'
            'xdg-desktop-portal-kde: For KDE Plasma')
provides=(flameshot)
conflicts=(flameshot)
source=("git+https://github.com/PrivateUploader/flameshot.git#commit=a59c57adc0dcb7e128f4a5eeed1b1d0208a7ddee")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number. Suggested in https://gitlab.archlinux.org/pacman/pacman/blob/master/proto/PKGBUILD-vcs.proto#L49
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  cmake -S ./ \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_WAYLAND_CLIPBOARD=1 \
      -DUSE_WAYLAND_GRIM=true

  make -j$(nproc --ignore 1)
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
