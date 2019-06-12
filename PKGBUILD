# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics-base
pkgver=7.0.2.2
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System -- base"
arch=('any')
url="https://epics-controls.org"
license=('EPICS Open License')
depends=('readline' 'ncurses' 'clang' 'perl')
source=("https://github.com/epics-base/epics-base/archive/R${pkgver}.tar.gz")
md5sums=('2f222803cb62f90bc7832fb16d829646')
options=(buildflags)

#CPPFLAGS="-D_FORTIFY_SOURCE=2"
#CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong"
#CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong"
#LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro"

prepare() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  
  > configure/CONFIG_SITE.local

  # for a static build
  #printf "SHARED_LIBRARIES=NO\nSTATIC_BUILD=YES\n" >> configure/CONFIG_SITE.local
}

build() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  make
}

check() {
  cd "$srcdir/${pkgname}-R${pkgver}"

  make runtests
}

package() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  echo "FINAL_LOCATION=/usr" >> configure/CONFIG_SITE.local
  echo "INSTALL_LOCATION="${pkgdir}/usr"" >> configure/CONFIG_SITE.local
  make realclean  # TODO: figure out a way to do this where we don't build everything twice...
  make
  
  # figure out what architecture EPICS is installing for
  _ARCH=$(basename "$(find "$pkgdir/usr/bin/" -mindepth 1 -type d)")
  
  msg2 ${_ARCH}
  # link bins to where they belong
  pushd "${pkgdir}/usr/bin"
  cp --symbolic-link "${_ARCH}"/* .
  popd
  #rm -rf "${_ARCH_BIN}"
  

  # find the architecture specific library directory
  #_ARCH_LIB=$(find "$pkgdir/usr/lib/" -mindepth 1 \( -name perl -o -name pkgconfig \) -prune -o -type d -print)

  # remove the architecture specific library directory
  #pushd "${_ARCH_LIB}"
  #ln -s * ..
  #mv * ..
  #popd
  #rm -rf "${_ARCH_BIN}"

  rm "$pkgdir/usr/include/link.h" # owned by glibc
}

