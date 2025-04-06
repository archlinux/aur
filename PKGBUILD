# Maintainer: alcalino alanhumber333@gmail.com
pkgname='pacmanagergui-git' # '-bzr', '-git', '-hg' or '-svn'
pkgdir='pacmanager' #Name of the actual git repo used for cd
pkgver=r63.7f8f05e
pkgrel=2
pkgdesc="Simple GUI wrapper for the pacman package manager"
arch=('x86_64')
url="https://github.com/alcalino-git/pacmanager"
license=('MIT-0')
depends=('gtk4' 'pacman' 'boost' 'glibc' 'glib2' 'meson')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
install=
source=('pacmanager::git+https://github.com/alcalino-git/pacmanager.git')
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
        cd pacmanager
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
        cd pacmanager
        meson setup build
        meson compile -C build
}

package() {
        cd pacmanager
        install -Dm755 ./build/pacmanager "$pkgdir/usr/bin/pacmanager"
        mv ./logo.svg "$HOME/.local/share/icons/pacmanager.svg"

        mkdir -p "$pkgdir/usr/share/applications"
        cat > "$pkgdir/usr/share/applications/pacmanager.desktop" <<EOF
[Desktop Entry]
Name=PacManager
Comment=Simple GUI wrapper for the pacman package manager
Exec=/usr/bin/pacmanager
Icon=~/.local/share/icons/pacmanager.svg
Terminal=false
Type=Application
Categories=System;PackageManager;
EOF
}
