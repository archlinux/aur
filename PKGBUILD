# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh-git
pkgver=1.7.2.r0.g7311415f
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3 vte3)
makedepends=(vala meson ninja git)
provides=(easyssh)
conflicts=(easyssh)
source=("git+https://github.com/muriloventuroso/easyssh.git"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/easyssh-files_utf8.patch")
sha256sums=('SKIP'
            'f5b4a7406b61d6f777abdfab6141cbf917ee469c49bac2445bb6d704cb82461f')

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  patch -Np1 -i ../easyssh-files_utf8.patch
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  meson build --prefix=/usr -D libunity=false -D ubuntu-bionic-patched-vte=false
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.muriloventuroso.easyssh "${pkgdir}/usr/bin/easyssh"
}
