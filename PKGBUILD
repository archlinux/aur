# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-git
pkgver=master.lmde3.r0.ga5bf0159
pkgrel=1
pkgdesc="Cinnamon file manager, git-version"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo"
_branch='master'
license=('GPL')
depends=('cinnamon-desktop'
    'cinnamon-translations'
    'dconf'
    'desktop-file-utils'
    'exempi'
    'gvfs'
    'libexif'
    'libnotify'
    'libxml2'
    'python'
    'xapps')
makedepends=('git'
    'gnome-common'
    'gobject-introspection'
    'gtk-doc'
    'intltool'
    'meson'
    'python-gobject'
    'python2-gobject'
    'python-polib')
optdepends=('ffmpegthumbnailer: support for video thumbnails')
conflicts=('nemo')
provides=('nemo')
options=('!emptydirs')
source=("git+https://github.com/linuxmint/nemo#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd nemo
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/nemo

  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i 's/^Name\(.*\)=.*/Name\1=Nemo/' data/nemo.desktop
}

build() {
  cd $srcdir/nemo
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  meson --buildtype plain build --prefix=/usr
  ninja -C build -j$(($(getconf _NPROCESSORS_ONLN)+1))
}

package() {
  cd $srcdir/nemo
  DESTDIR="$pkgdir" ninja -C build install
}
