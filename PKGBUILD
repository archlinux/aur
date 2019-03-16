# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
_pkgname=k3d
pkgname=${_pkgname}-git
pkgver=r3544.17ef1bf0
pkgrel=2
pkgdesc="A free 3D modelling and animation software"
arch=('x86_64' 'i686')
url="http://www.k-3d.org"
license=('GPL')
depends=('ftgl' 'cairomm' 'dbus-glib' 'freetype2' 'glibmm' 'gtkglext' 'gtkmm'
         'gtksourceview2' 'gts' 'imagemagick' 'openexr' 'libglvnd' 'glew' 'zlib'
         'libpng' 'python2' 'libsigc++' 'expat' 'boost-libs' 'graphviz'
         'opencollada')
optdepends=('aqsis: Rendering engine')
makedepends=('asciidoc'
             'boost'
             'cmake'
             'doxygen'
	     'git'
             'graphviz'
             'libxslt'
             'icoutils'
             'gendesk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/K-3D/${_pkgname}.git"
        "k3d.appdata.xml"
        "workaround.xml"
        # patches from fedora
        "https://src.fedoraproject.org/rpms/k3d/raw/master/f/0103-Use-usr-bin-python2-instead-of-usr-bin-python.patch")
md5sums=('SKIP'
         '2018b7e8e1258aa0aa86494032b0a74a'
         'e93406cc28c4ed55c9640c09d447c53d'
         'b08d2fc3e331f732623f6188be800949')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  patch -p1 -i "${srcdir}"/0103-Use-usr-bin-python2-instead-of-usr-bin-python.patch
  sed -i -e "s/K3D_BOOST_COMPONENTS python)/K3D_BOOST_COMPONENTS python27)/" CMakeLists.txt
}

build() {
  mkdir -p "${_pkgname}-build"
  cd "${_pkgname}-build"
  cmake "${srcdir}/${_pkgname}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBoost_PYTHON_LIBRARY=/usr/lib/libboost_python27.so \
      -DPYTHON_EXECUTABLE=/usr/bin/python2 \
      -Wno-dev
  make
}

package() {
  # For some reason the file generation fails for this one:
  cp "${srcdir}"/workaround.xml "${_pkgname}-build"/lib/k3d/plugins/k3d-imagemagick-io.module.proxy

  cd "${_pkgname}-build"
  make DESTDIR="${pkgdir}/" install

  # metadata
  install -Dm644 "${srcdir}"/k3d.appdata.xml "${pkgdir}"/usr/share/metainfo/k3d.appdata.xml

  # create launcher
  cd "${pkgdir}"/usr/share/applications
  gendesk -f -n \
      --pkgname="k3d" \
      --name="K-3D" \
      --genericname="3D modelling and animation" \
      --comment="view and create 3D modells and animations" \
      --startupnotify=True \
      --exec=k3d \
      --categories='Graphics;3DGraphics;GTK'

  # cut icons
  for size in 22 24 32 36 64 72 96 128 192 256 384
  do
    case $size in
      *)
        mkdir -p "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps
        ;;&
    384)
        convert -crop 384x384+10+10 \
           "${srcdir}"/k3d/share/k3d/icons/k3d_large.png \
           "${pkgdir}"/usr/share/icons/hicolor/384x384/apps/k3d.png
        ;;
      *)
        convert -crop 377x377+13+14 -resize ${size}x${size} \
           "${srcdir}"/k3d/share/k3d/icons/k3d_large.png \
           "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/k3d.png
        ;;
    esac
  done
}

post_install() {
  update-desktop-database -q
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}
