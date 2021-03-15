# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: Nathan Owens <ndowens at artixlinux.org>

_pkgbase=elogind
pkgbase=elogind-git
pkgname=('elogind-git' 'libelogind-git')
pkgver=246.pre.r71.g3b9af47ff
pkgrel=1
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('i686' 'x86_64')
url="https://github.com/elogind/elogind"
license=('GPL')
makedepends=('intltool' 'libtool' 'gperf' 'gtk-doc'
	     'git' 'libcap' 'meson')
options=('!libtool')
source=("git+https://github.com/elogind/elogind")
sha256sums=('SKIP')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

pkgver() {
  cd "${srcdir}/elogind"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\:/./g'
}

build() {
  arch-meson $_pkgbase build \
	-D split-usr=true \
	-D smack=true \
	-D acl=true \
	-D pam=true \
	-D rootlibexecdir=/usr/lib
   ninja -C build
}

package_elogind-git() {
  pkgdesc="The systemd project's logind, extracted to a standalone package"
  provides=("elogind")
  depends=('libelogind' 'pam' 'acl')
  conflicts=('systemd-sysvcompat' 'consolekit')
  optdepends=('dbus-openrc: dbus initscript')
  install=elogind.install

  DESTDIR="${pkgdir}" meson install -C build
  cd "$pkgdir"

  _pick libelogind usr/lib/pkgconfig 
  _pick libelogind usr/include
  _pick libelogind usr/lib/libelogind*.so*

  rm -rf "$pkgdir"/usr/share/doc
}

package_libelogind-git(){
  pkgdesc="elogind client libraries"
  provides=('libelogind.so' "libelogind")
  depends=('libcap')

  mv libelogind/* "$pkgdir"
}
