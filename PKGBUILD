# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

_pkgname=epiphany
pkgname=$_pkgname-pantheon-bzr
ephyver=3.27.90-1ubuntu1
ubunturel=bionic
pkgver=3.27.90.1ubuntu1.r20
pkgrel=5
pkgdesc="A GNOME web browser based on the WebKit rendering engine, with Elementary OS patches"
url="http://www.gnome.org/projects/epiphany/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('webkit2gtk>=2.19.4' gcr libhttpseverywhere libdazzle gst-libav)
makedepends=(meson docbook-xml startup-notification lsb-release
             gobject-introspection yelp-tools autoconf-archive appstream-glib bzr)
groups=(pantheon-unstable pantheon-qq)
replaces=(epiphany)
provides=(epiphany epiphany-sync)
conflicts=(epiphany)
source=("bzr+lp:~elementary-os/elementaryos/os-patch-epiphany-browser-${ubunturel}"
        epiphany-sync{,.service})
sha256sums=('SKIP'
            'bb8c06dadcba9c9f0ba887dc0a65283c26282f7db75c22dade209fcaa6f72f72'
            'ce1ac321d7bf9d88638634a141dfcb99119fc59ee44c4892e0874608e85006ba')

pkgver() {
  cd "os-patch-epiphany-browser-${ubunturel}"

  echo "${ephyver/-/.}.r$(bzr revno)"
}

build() {
  cd "os-patch-epiphany-browser-${ubunturel}"
  [ -d build ] && rm -rf build
  arch-meson build -Denable_https_everywhere=true
  ninja -C build
}

package() {
  cd "os-patch-epiphany-browser-$ubunturel"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 755 {"${srcdir}","${pkgdir}"/usr/bin}/epiphany-sync
  install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/epiphany-sync.service
}
