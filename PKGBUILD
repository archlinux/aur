# Maintainer: Corey Powell <mistdragon100@gmail.com>
# Previous Maintainer: Scott Olson <scott@scott-olson.org>
pkgname=rock
pkgver=0.9.10
pkgrel=3
pkgdesc="An ooc compiler written in ooc"
arch=('i686' 'x86_64')
license=('BSD')
url="http://ooc-lang.org/"
source=("https://github.com/ooc-lang/rock/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/ooc-lang/rock/releases/download/v${pkgver}/rock-${pkgver}-bootstrap-only.tar.bz2")
makedepends=('gcc')
depends=('sh')
optdepends=('gcc: can be used as backend C compiler'
            'clang: can be used as backend C compiler'
            'tcc: can be used as backend C compiler')
md5sums=('30613c1fb1b823c545870fbbe984e933'
         'db0bf2c7692618174381424aabc4f91c')

prepare() {
  local pkg_srcdir="${srcdir}/rock-${pkgver}"
  rm -rf "${pkg_srcdir}/build"
  mv build "${pkg_srcdir}"
  cd "${pkg_srcdir}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make bootstrap
}

package() {
  local pkg_optdir="${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/rock-${pkgver}"

  install -d "${pkg_optdir}"
  cp -rt "${pkg_optdir}" .libs sdk \
    pcre.use rock.use sdk-dynlib.use sdk-net.use sdk.use
  rm -rf "${pkg_optdir}/libs/sources"

  install -D bin/rock "${pkg_optdir}/bin/rock"
  install -d "${pkgdir}/usr/bin"
  echo '#!/bin/sh' > "${pkgdir}/usr/bin/rock"
  echo 'ROCK_DIST=/opt/rock /opt/rock/bin/rock "$@"' >> "${pkgdir}/usr/bin/rock"
  chmod +x "${pkgdir}/usr/bin/rock"

  install -D docs/rock.1 "${pkgdir}/usr/share/man/man1/rock.1"
  install -D LICENSE "${pkgdir}/usr/share/licenses/rock/LICENSE"
}
