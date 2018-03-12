# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

_pkgname=epiphany
pkgname=$_pkgname-pantheon-bzr
ephyver=3.27.90-1ubuntu1
ubunturel=bionic
pkgver=3.27.90.1ubuntu1.r19
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine, with Elementary OS patches"
url="http://www.gnome.org/projects/epiphany/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('webkit2gtk>=2.19.4' gcr libhttpseverywhere libdazzle)
makedepends=(meson docbook-xml startup-notification lsb-release
             gobject-introspection yelp-tools autoconf-archive appstream-glib git)
groups=(pantheon-unstable pantheon-qq)
replaces=(epiphany)
provides=(epiphany)
conflicts=(epiphany)
source=("bzr+lp:~elementary-os/elementaryos/os-patch-epiphany-browser-$ubunturel"
        "pluginsdir.diff")
sha256sums=('SKIP'
            '3e648118d7d45fc1cce04d45c7443ed0cc54e3a65aefcb4fb12ce5e01014c53e')

pkgver() {
  cd "os-patch-epiphany-browser-$ubunturel"

  echo "${ephyver/-/.}.r$(bzr revno)"
}

prepare() {
  cd "os-patch-epiphany-browser-$ubunturel"

  msg2 "Plugins Directory"
  #patch -Np1 < ../pluginsdir.diff
}

build() {
  cd "os-patch-epiphany-browser-$ubunturel"
  [ -d build ] && rm -rf build
  meson build --prefix=/usr --sysconfdir=/etc  --localstatedir=/var --libexecdir=/usr/lib/$_pkgname --buildtype=release -Denable_https_everywhere=true
  ninja -C build
}

package() {
  cd "os-patch-epiphany-browser-$ubunturel"
  DESTDIR=${pkgdir} ninja -C build install
}
