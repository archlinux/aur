pkgname='linux-user-chroot'
pkgver='2012.2'
pkgrel='1'
pkgdesc='setuid helper for making bind mounts and chrooting'
url='http://git.gnome.org/browse/linux-user-chroot/tree/README'
arch=('i686' 'x86_64')
license='GPL'
depends=('glibc')
makedepends=('libxslt')
repo="git://git.gnome.org/${pkgname}"

build () {
  cd "${srcdir}"

  msg "Connecting to the ${pkgname} Git repository..."
  if [ -d "${srcdir}/${pkgname}" ] ; then
    cd "${pkgname}" && git fetch origin
    msg "The local files are updated."
  else
    git clone "${repo}" "${pkgname}"
  fi
  cd "${srcdir}/${pkgname}"

  msg2 "Checking out version v${pkgver}"
  git checkout --force "v${pkgver}"
  msg "GIT checkout done or server timeout"

  msg2 "Configuring..."
  ./autogen.sh --prefix=/usr --enable-newnet-helper
  msg2 "Compiling..."
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  msg2 "Packaging..."
  make install DESTDIR="${pkgdir}"
  chmod +s "${pkgdir}/usr/bin"/linux-user-chroot{,-newnet}
}

