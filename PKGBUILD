# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Ian Brunelli (brunelli) <ian@brunelli.me>

pkgname=lollypop-git
_gitname=lollypop
pkgdesc='Lollypop is a new GNOME music playing application.'
pkgver=0.9.244.r67.ga77dff23
pkgrel=1
url='https://gnumdk.github.io/lollypop-web/'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('meson' 'ninja')
depends=(
  'appstream-glib' 'desktop-file-utils' 'gobject-introspection' 'gst-python'
  'gstreamer' 'gtk3' 'itstool' 'python-cairo' 'python-dbus' 'python-gobject'
  'python-pylast' 'totem-plparser'
)
optdepends=(
  'easytag: tag editing'
  'flatpak: Flatpak Portal'
  'gst-libav: FFmpeg plugin for GStreamer'
  'kid3-qt: Store covers in tags'
  'libsecret: Last.FM support'
  'python-wikipedia: Wikipedia support'
  'youtube-dl: YouTube playback'
)
conflicts=("${_gitname}")
provides=("${_gitname}")
source=(
  "git://github.com/gnumdk/${_gitname}.git"
  "git://github.com/gnumdk/${_gitname}-help.git"
  "git://github.com/gnumdk/${_gitname}-po.git"
  "git://github.com/gnumdk/${_gitname}-portal.git"
  
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${_gitname}"

  git describe --tags --long \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"

  local submodules=(
  'lollypop-help'
  'lollypop-po'
  )

  for module in "${submodules[@]}"; do
    local submodule="subprojects/${module/lollypop-/}"
    git submodule init "${submodule}"
    git config "submodule.${submodule}.url" "${srcdir}/${module}"
    git submodule update "${submodule}"
  done
  
  cd "${srcdir}/${_gitname}"

  if [[ -d build ]]; then
    # This should be removed when 'meson [OPTIONS] ..' can be run
    # repeatedly without generating an error.
    rm -rf build
  fi

  cd "${srcdir}/${_gitname}-portal"

  if [[ -d build ]]; then
    # This should be removed when 'meson [OPTIONS] ..' can be run
    # repeatedly without generating an error.
    rm -rf build
  fi
}

build() {
  cd "${srcdir}/${_gitname}"

  meson build --prefix=/usr
  
  cd "${srcdir}/${_gitname}-portal"

  meson build --prefix=/usr
}

package() {
  cd "${srcdir}/${_gitname}"

	DESTDIR="$pkgdir" ninja -C build install
	
  cd "${srcdir}/${_gitname}-portal"

	DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et:
