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
#
#
# To make the life easier, we have provided a makefile. You can use it to do the steps above:
#  1. "make deps"
#  2. apply the changes you think necessary
#  3. "make build"
#  4. fix possible errors and repleat step 3 and 4 until there is no error
#  5. "make test"
#  6. fix possible errors and repleat step 5 and 6 until there is no error
#  7. "make patch" to create the patch, and then submit it for maintainers



pkgname=flameshot-git
_pkgname=flameshot
pkgver=r2181.1e182887
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/flameshot-org/flameshot"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'hicolor-icon-theme' 'kguiaddons' 'kdsingleapplication')
makedepends=('git' 'qt6-tools' 'cmake' 'ninja')
optdepends=('xdg-desktop-portal: To make Sway, Hyprland, and wlroots work'
            'xdg-desktop-portal-wlr: To make Sway, Hyprland, and wlroots work'
            'xdg-desktop-portal-kde: For KDE Plasma'
            'grim: To make Sway, Hyprland, and wlroots work'
            'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
            'qt6-imageformats: for additional export image formats (e.g. tiff, webp, and more)'
           )
provides=(flameshot)
conflicts=(flameshot)
source=("git+https://github.com/flameshot-org/flameshot.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # Get the version number. Suggested in https://gitlab.archlinux.org/pacman/pacman/blob/master/proto/PKGBUILD-vcs.proto#L49
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    cmake -GNinja -B build -S . \
          -DCMAKE_BUILD_TYPE=None \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUSE_WAYLAND_CLIPBOARD=1 \
          -DDISABLE_UPDATE_CHECKER=1 \
          -DUSE_BUNDLED_KDSINGLEAPPLICATION=0

    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"
    
    DESTDIR="${pkgdir}" cmake --install build
}
