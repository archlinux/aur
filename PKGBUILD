# -*- mode: pkgbuild -*-
# Maintainer  : Jeremy Borgman <borgman.jeremy@pm.me>
# Maintainer  : Mehrad Mahmoudian <m.mahmoudian@gmail.com>
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
#  4. Test the modified PKGBUILD file with all of the following commands
#       ```sh
#       # remove the possible builds
#       rm -f flameshot-git-r*.zst
#
#       # read this for more info about namcap: https://wiki.archlinux.org/title/Namcap
#       namcap -i PKGBUILD
#       
#       # read this for more info about makepkg: https://wiki.archlinux.org/title/Makepkg
#       makepkg
#       
#       pacman -U flameshot-git-r*.zst
#       ```
#  
#  5. Fix any possible errors
#  
#  6. create a patch with your modifications:
#       ```sh
#       git diff --oneline --graph > my.patch
#       ```
#  
#  7. copy the content of the my.patch file and post it in the discussion of
#     the AUR: https://aur.archlinux.org/packages/flameshot-git/



pkgname=flameshot-git
_pkgname=flameshot
pkgver=r1646.1cc5a262
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/flameshot-org/flameshot"
license=('GPL')
depends=(qt5-base hicolor-icon-theme qt5-svg)
makedepends=(qt5-tools git cmake kguiaddons)
optdepends=('xdg-desktop-portal: To make Sway, Hyprland, and wlroots work'
            'xdg-desktop-portal-wlr: To make Sway, Hyprland, and wlroots work'
            'grim: To make Sway, Hyprland, and wlroots work')
provides=(flameshot-git)
conflicts=(flameshot)
source=("git+https://github.com/flameshot-org/flameshot.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # # get the details of the version numbers
  # NORMAL_VERSION="$(grep -oP 'FLAMESHOT_VERSION\s\d+\.\d+\.\d+' CMakeLists.txt | cut -d ' ' -f2)"
  # ROLLING_VERSION="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  #
  # # skip the special characters in the versions
  # NORMAL_VERSION_PATTERN="$(echo ${NORMAL_VERSION} | sed 's/\./\\\./g')"
  # ROLLING_VERSION_PATTERN="$(echo ${ROLLING_VERSION} | sed 's/\./\\\./g')"
  #
  # # Replace the version number in the cmake with the combination of versions above
  # sed "s/${NORMAL_VERSION_PATTERN}/${NORMAL_VERSION_PATTERN}_${ROLLING_VERSION_PATTERN}/" CMakeLists.txt


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
