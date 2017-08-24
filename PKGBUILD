# Maintainer: DATSD <DAStudio *dot* 71e6fd52 *at* gmail *dot* com>
_basename=xmake
pkgname=${_basename}-dev-git
pkgver=2.1.6.r13
pkgrel=1
pkgdesc='A make-like build utility based on Lua'
arch=('i686' 'x86_64')
url='http://xmake.io'
license=('Apache')
depends=('ccache')
makedepends=('git')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
source=("git+https://github.com/tboox/xmake.git#branch=dev")
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_basename}"
  git describe --long --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g' | cut -c2-
}

build()
{
  cd "${srcdir}/${_basename}"
  make build CC=gcc LD=gcc
}

package()
{
  cd "${srcdir}/${_basename}"
  make install prefix="${pkgdir}/usr"
  cat > "${pkgdir}/usr/bin/xmake" <<EOF
#/!bin/bash
export XMAKE_PROGRAM_DIR=/usr/share/xmake
/usr/share/xmake/xmake "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/xmake" "${pkgdir}/usr/share/xmake/xmake"
}
