# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

_gitname=pcmanfm
pkgname=$_gitname-gtk3-git
pkgver=1.2.3.r36.gde9129c
pkgrel=1
pkgdesc='Extremely fast and lightweight file manager'
arch=('i686' 'x86_64')
url='http://pcmanfm.sourceforge.net/'
license=('GPL')
depends=('gtk3' 'desktop-file-utils' 'libfm-gtk3-git' 'lxmenu-data')
makedepends=('git' 'intltool')
optdepends=('gvfs: for trash support, mounting with udisks and remote filesystems'
            'udisks: alternative for mounting volumes'
            'xarchiver: archive management')
provides=("$_gitname=$pkgver")
conflicts=("$_gitname")
install=$_gitname.install
source=($_gitname::git://git.lxde.org/git/lxde/$_gitname.git)
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd ${_gitname}

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --with-gtk=3
  make LDFLAGS="-lm ${LDFLAGS}"
}

check() {
    cd $_gitname
    make check
}

package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}" install
}
