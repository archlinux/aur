# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Philipp Trommler <ph.trommler@gmail.com>
pkgname=valum
pkgver=v0.2.6+482+ga066e6d
pkgrel=1
pkgdesc="Web micro-framework written in Vala"
arch=("i686" "x86_64")
url="https://github.com/valum-framework/valum"
license=("LGPL3")
depends=(vala glib2 libsoup libgee ctpl fcgi)
optdepends=("libmemcached: For memcached cache storage."
            "memcached: For memcached cache storage."
            "luajit: For an embedded Lua VM.")
makedepends=(git ninja vala meson)
_commit=a066e6d40980aec02c9e1b5cadb931719541f0cc
source=("git://github.com/antono/valum.git#commit=${_commit}")
md5sums=("SKIP")

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd ${pkgname}
  [ -d build ] && rm -rf build
  mkdir build && cd build
  meson ..
  ninja
}

check() {
  cd ${pkgname}/build
  ninja test
}

package() {
  cd ${pkgname}/build
  DESTDIR=${pkgdir} ninja install

  # hack: place installation in /usr/ and not /usr/local
  cd ${pkgdir}
  for d in `ls usr/local`; do
    mv usr/local/$d usr/$d
  done
  mv usr/lib64 usr/lib
  rm -rf usr/local
  cd usr/lib/pkgconfig
  for f in `ls *pc`; do
    sed -i $f -e "s/\/local//g"
  done
  # end of hack
  cd ${srcdir}/valum

  install -Dm644 examples/app/vapi/ctpl.vapi "${pkgdir}/usr/share/vala/vapi/"
  install -Dm644 src/vsgi/servers/fcgi.{deps,vapi}  "${pkgdir}/usr/share/vala/vapi/"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
