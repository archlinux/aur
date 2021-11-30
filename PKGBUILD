pkgname=gtksourceview-git
_pkgname=gtksourceview
pkgver=6690
pkgrel=1
pkgdesc='A text widget adding syntax highlighting and more to GNOME'
url='https://gitlab.gnome.org/GNOME/gtksourceview'
license=('LGPL')
arch=(x86_64 aarch64)
depends=(gtk4)
provides=(gtksourceview5=5.3.0)
conflicts=(gtksourceview5)
makedepends=(
	gobject-introspection
	gtk-doc
	meson
	vala
)
checkdepends=(xorg-server-xvfb)
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

get_version_info() {
   cd "$srcdir"/build
   local version=$(grep 'PACKAGE_VERSION' config.h | cut -d' ' -f3)
   local version_major=${version%%.*}
   local name=${_pkgname}${version_major}
   case $1 in
   name)
      echo $name
      ;;
   version)
      echo $version
      ;;
   full)
      echo $name=$version
      ;;
   esac
}

get_version_info_old() {
   cd "$srcdir"/"$_pkgname"
   local ver_line=$(grep -E '^[[:space:]]*version:[[:space:]].*,[[:space:]]*$' meson.build)
   ver_line=${ver_line#*version: \'}
   version=${ver_line%\',}
   version_major=${version%%.*}
   name=${_pkgname}${version_major}
   case $1 in
   name)
      echo $name
      ;;
   version)
      echo $version
      ;;
   full)
      echo $name=$version
      ;;
   esac
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

build() {
   cd "$srcdir"
	arch-meson gtksourceview build -D gtk_doc=true
	meson compile -C build
}

check() {
	dbus-run-session xvfb-run \
		-s '-screen 0 1920x1080x24 -nolisten local' \
		meson test -C build --print-errorlogs
}

package() {
   cd "$srcdir"
	DESTDIR="${pkgdir}" meson install -C build

   # Set Provides/Conflicts
   name=$(get_version_info name)
   version=$(get_version_info version)
   declare -g provides=($name=$version)
   declare -g conflicts=($name)
}
