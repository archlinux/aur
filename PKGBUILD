# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfburn
pkgname=${_pkgname}-git
_pkgver=0.5.5
pkgver=0.5.6dev.r1573.71e78418
pkgrel=1
pkgdesc="A simple CD/DVD burning tool based on libburnia libraries"
arch=('x86_64')
url="http://goodies.xfce.org/projects/applications/xfburn"
license=('GPL')
groups=('xfce4-goodies')
depends=('libburn' 'libisofs' 'gtk3' 'libxfce4ui' 'exo' 'gst-plugins-base-libs'
         'libgudev' 'desktop-file-utils')
makedepends=('intltool' 'git')
provides=("${_pkgname}=${pkgver%%dev*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.com/Katana-Steel/xfburn#branch=road-to-gtk3"
        "https://archive.xfce.org/src/apps/xfburn/${_pkgver%.*}/${_pkgname}-${_pkgver}.tar.bz2")
sha256sums=('SKIP'
            'aa173aa8a6c0887a4b236aee3753760e943f3e2be99af1f2d5343a6df345ade1')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.%s.%sdev.r%s.%s" \
         "$( grep -m 1 "xfburn_version_major" configure.ac.in | sed 's:.*\[\([0-9][0-9]*\)\].*:\1:' )" \
         "$( grep -m 1 "xfburn_version_minor" configure.ac.in | sed 's:.*\[\([0-9][0-9]*\)\].*:\1:' )" \
         "$( grep -m 1 "xfburn_version_micro" configure.ac.in | sed 's:.*\[\([0-9][0-9]*\)\].*:\1:' )" \
         "$( git rev-list --count HEAD )" \
         "$( git show-ref HEAD | sed -e 's:[\ ].*::' | cut -c1-8 )"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure \
    --prefix=/usr \
    --enable-gstreamer \
    --disable-debug
  cp "${srcdir}/${_pkgname}-${_pkgver}"/docs/xfburn.1 ./docs/xfburn.1
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
