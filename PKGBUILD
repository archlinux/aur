# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

_reponame=boinc-client
_pkgbase=boinc-client-next
pkgbase=$_pkgbase-git
pkgname=(boinc-client-next-git boinc-client-next-nox-git)
pkgver=r29418.cbe330c
pkgrel=1
arch=('i686' 'x86_64')
url="http://boinc.berkeley.edu/"
license=('LGPL')
makedepends=('libxslt' 'perl-xml-sax' 'git' 'libxss' 'libnotify' 'wxgtk' 'webkitgtk2' 'sqlite3'
             'curl' 'inetutils' 'libxmu' 'freeglut' 'glu' 'mesa' 'rsync')
install=$_pkgbase.install
options=('!staticlibs')
source=("git+https://github.com/boinc-next/$_reponame.git"
         $_reponame.bash
         $_reponame.desktop
         $_reponame.service
         $_reponame.sysusers
         boinc-next.png)
md5sums=('SKIP'
         '4d00e1aa4090a3f51feb20f5a541b9ee'
         'f56c83d2d8decb5171f37b817a189c15'
         '3fe0bd4126119b1e35cdf26eb2332143'
         '240f952d38c5814cc3d8cd1668fe2154'
         '0777ed584fa868e28cd30317bc485c21')

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_reponame

  autoreconf -i

  mkdir -p ${srcdir}/${_reponame}-nox
  rsync -r ${srcdir}/${_reponame}/* ${srcdir}/${_reponame}-nox --exclude=.git

  # Don't force xss
  sed -i 's/^  enable_xss="yes"$/  enable_xss="no"/' "$srcdir"/${_reponame}-nox/configure
}

build() {
  cd "$srcdir"/$_reponame
  LDLAGS='-lX11' ./configure \
    --prefix=/usr \
    --enable-libraries \
    --enable-unicode \
    --enable-shared \
    --enable-dynamic-client-linkage \
    --enable-client \
    --enable-manager \
    --disable-static \
    --with-ssl \
    --with-x \
    --with-wxdir=/usr/lib \
    --with-wx-config=$(which wx-config)
  make

  # Build boinc-nox
  cd ${srcdir}/${_reponame}-nox
  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    --prefix=/usr \
    --enable-libraries \
    --enable-unicode \
    --enable-shared \
    --enable-dynamic-client-linkage \
    --enable-client \
    --disable-static \
    --disable-manager \
    --with-ssl \
    --without-wxdir \
    --without-x
  make
}

package_boinc-client-next-git() {
  pkgdesc="Next generation BOINC client for desktop"
  depends=("libxss" "libnotify" "wxgtk" "webkitgtk2" "curl" "sqlite3")
  provides=("boinc")
  conflicts=("boinc")

  cd ${_reponame}

  make DESTDIR="$pkgdir" install

  #install systemd unit
  install -Dm644 "${srcdir}/boinc-client.service" "${pkgdir}/usr/lib/systemd/system/boinc.service"

  #install sysusers conf
  install -Dm644 "${srcdir}/boinc-client.sysusers" "${pkgdir}/usr/lib/sysusers.d/boinc.conf"

  #install bash-completion
  install -Dm644 "${srcdir}/boinc-client.bash" "${pkgdir}/usr/share/bash-completion/completions/boinc-client"

  #install .desktop File
  install -Dm644 "${srcdir}/boinc-client.desktop" "${pkgdir}/usr/share/applications/boinc-client.desktop"

  #install icons
  install -Dm644 "${srcdir}/boinc-next.png" "${pkgdir}/usr/share/pixmaps/boinc-next.png"

  #remove initscripts stuff
  rm -rf "$pkgdir/etc"
}

package_boinc-client-next-nox-git() {
  pkgdesc="Next generation BOINC client for desktop without Xorg dependencies"
  depends=("curl" "libjpeg-turbo")
  provides=("boinc")
  conflicts=("boinc" "boinc-client-next")

  cd ${_reponame}-nox

  make DESTDIR="$pkgdir" install

  #install systemd unit
  install -Dm644 "${srcdir}/boinc-client.service" "${pkgdir}/usr/lib/systemd/system/boinc.service"

  #install sysusers conf
  install -Dm644 "${srcdir}/boinc-client.sysusers" "${pkgdir}/usr/lib/sysusers.d/boinc.conf"

  #install bash-completion
  install -Dm644 "${srcdir}/boinc-client.bash" "${pkgdir}/usr/share/bash-completion/completions/boinc"

  #remove initscripts stuff
  rm -rf "$pkgdir/etc"
}
