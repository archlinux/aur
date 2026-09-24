#shellcheck shell=bash
# Maintainer: Silvertuanzi <126318157+silvertuanzi@users.noreply.github.com>
# Contributor: Shadichy <shadichy@blisslabs.org>

_pkg=ntfsprogs-plus
pkgname=${_pkg}-main-git

_repo=ntfsprogs-plus/$_pkg
url="https://github.com/${_repo}"

pkgver=1.0.0+63+g69b4ca1
pkgrel=1

pkgdesc='NTFS filesystem utilities. Target mainline stable branch instead of dev branch. '
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('util-linux-libs' 'hwinfo')
makedepends=(
  'libgcrypt' 'git'
)
conflicts=('ntfsprogs' 'ntfs-3g' "$_pkg")
provides=('ntfsprogs' 'ntfs-3g' "$_pkg")

source=("${_pkg}::git+${url}.git" "mount.ntfs-3g-compat")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_pkg}"
  git describe --long --tags | sed 's#v##;s#-RC#.rc#;s#-#+#g'
}

prepare() {
  cd ${srcdir}/${_pkg}
  ./autogen.sh
}

build() {
  cd ${srcdir}/${_pkg}

  ./configure \
    --prefix=/usr \
    --sbin=/usr/bin \
    --includedir=/usr/include/ntfsprogs-plus \
    --mandir=/usr/share/man \
    --disable-ldconfig \
    --enable-xattr-mappings \
    --enable-posix-acls

  make
}

package() {
  cd ${srcdir}/${_pkg}

  make \
    DESTDIR="${pkgdir}" \
    rootbindir=/usr/bin \
    rootsbindir=/usr/bin \
    rootlibdir=/usr/lib \
    install

  # ntfs-3g compat
  ln -s /usr/bin/fsck.ntfs "${pkgdir}/usr/bin/ntfsfix"
  install -Dm755 "${srcdir}/mount.ntfs-3g-compat" "${pkgdir}/usr/bin/mount.ntfs-3g"
  ln -s "/usr/bin/mount.ntfs-3g" "${pkgdir}/usr/bin/mount.lowntfs-3g"

  # Upstream License
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

