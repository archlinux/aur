# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter <craven@gmx.net>
pkgname=rscheme
pkgver=0.7.3.4b7
pkgrel=1
epoch=
pkgdesc="RScheme is an open-source (and freely redistributable) implementation of the Scheme language with lots of extensions and additional features beyond the core language."
arch=(x86_64 i686)
url=""
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.rscheme.org/rs/b/0.7.3.4/7/rs-0.7.3.4-b7.tar.gz" "rscheme-chroot-make.sh")
md5sums=('398f5cdeb314a6c8303ada6faa611aef'
         'c6b5138893cd2941c702f73a1d53338e')
noextract=()
validpgpkeys=()

build() {
  _ME=$(whoami)
  _MEGROUP=$(groups ${_ME} | cut -d ' ' -f1)
  echo Setting up OverlayFS to install rscheme
  sudo rm -Rf "${srcdir}/overlay" "${srcdir}/work" "${srcdir}/combined"
  mkdir -p ${srcdir}/work
  mkdir -p ${srcdir}/overlay
  mkdir -p ${srcdir}/combined
  mkdir -p ${srcdir}/overlay/tmp
  chmod ugo+rwx ${srcdir}/overlay/tmp
  cp -R rs-0.7.3.4-b7 ${srcdir}/overlay/tmp/
  cp rscheme-chroot-make.sh ${srcdir}/overlay/tmp/
  sudo mount -t overlay -o lowerdir=/,upperdir=${srcdir}/overlay,workdir=${srcdir}/work overlay ${srcdir}/combined
  echo "Building inside chroot"
  sudo chroot ${srcdir}/combined "/tmp/rscheme-chroot-make.sh"
  echo "Unmounting OverlayFS"
  sudo umount ${srcdir}/combined
  echo "Setting all file-ownership to current user"
  sudo chown -R ${_ME}:${_MEGROUP} ${srcdir}
  rm -Rf ${srcdir}/overlay/tmp/
  rm -Rf ${srcdir}/overlay/dev/
  rm -Rf ${srcdir}/overlay/root/
}

package() {
  echo "Packaging files from OverlayFS"
  cp -arf "${srcdir}/overlay/usr" "${pkgdir}/"
  install -d ${pkgdir}/usr/bin
  ln -s "/usr/share/rs/0.7.3.4-b7u/bin/rs" "${pkgdir}/usr/bin/rs"
  ln -s "/usr/share/rs/0.7.3.4-b7u/bin/rsc" "${pkgdir}/usr/bin/rsc"
  ln -s "/usr/share/rs/0.7.3.4-b7u/bin/lssctl" "${pkgdir}/usr/bin/lssctl"
  ln -s "/usr/share/rs/0.7.3.4-b7u/bin/fshell" "${pkgdir}/usr/bin/fshell"
}
