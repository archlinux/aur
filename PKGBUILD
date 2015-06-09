# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Some comments are taken from the Ubuntu packaging files

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=vivid
# vercheck-launchpad: name=${pkgname%-*}

_use_ppa=false

pkgname=compiz-ubuntu

epoch=1

_actual_ver=0.9.12.1
_extra_ver=+15.10.20150511

if [[ "${_use_ppa}" != true ]]; then
  _ubuntu_rel=0ubuntu1
  _archive_dir="compiz-${_actual_ver}${_extra_ver}"
else
  _ppa_rel=0ubuntu3\+ppa1
  _archive_dir=compiz.vivid
fi

pkgver=${_actual_ver}${_extra_ver/+/.}

pkgrel=1
pkgdesc="OpenGL window and compositing manager"
url="http://www.compiz.org/"
arch=(i686 x86_64)
license=(GPL)
depends=(boost-libs dbus fuse glibmm glu librsvg libxcomposite libxdamage
         libxinerama libxrandr libxslt libwnck3 mesa metacity
         startup-notification protobuf pygtk pyrex gsettings-desktop-schemas)
# The schemas from gnome-settings-daemon are needed
depends+=(gnome-settings-daemon)
makedepends=(boost cmake intltool)
optdepends=('gnome-control-center: GNOME Control Center'
            'unity-control-center: Unity Control Center')
groups=(unity)
options=(emptydirs)
conflicts=(compiz metacity-ubuntu)
provides=(compiz-core compiz)
install=compiz-ubuntu.install

if [[ "${_use_ppa}" != true ]]; then
  source=("https://launchpad.net/ubuntu/+archive/primary/+files/compiz_${_actual_ver}${_extra_ver}.orig.tar.gz"
          "https://launchpad.net/ubuntu/+archive/primary/+files/compiz_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff.gz")
else
  source=("https://launchpad.net/~townsend/+archive/ubuntu/compiz-nvidia-refresh-test/+files/compiz_${_actual_ver}${_extra_ver}-${_ppa_rel}.tar.gz")
fi

source+=(compiz.reset
         0001-Fix-cmake-install-directory.patch
         0002-Fix-python-install-command.patch
         0003-Use-Python-2.patch
         0004-Disable-Werror.patch
         0001-Add-metacity-3.16-support.patch
         0002-Remove-function-declarations-from-gtk-window-decorat.patch)
sha512sums=('3218acbd78f77036e60a649bff64c056681039de6e28d43e500e9ed84298435d8de98a016f9be858ed6f75474edb35a394d51ec84132e311465084f64925667d'
            '50ac0c1dd682d5bdf6ff8a51f00b99245699fe5c643da75558bc93220e300b902103f70e18299d18fb0e9e2bd09d1a16155c9d8bbf45943ae35dd34661b14e0e'
            '5f4b38c5fe3af9de0fe7897b9fdd04184dff9bf448f21ef19d9ae1b224c972061d8b183aa01cf8dcdf4fb37bb3466233ce53a6dfbbe51b0ff04f17568d2dc7ff'
            '94b139716f74cfb26276dbc0c5a73aa1d6f591e888b976210e7523de83e782a76992350d08b8054c8a04eeeb5273130cdeaaffd155ee3e9800921b7541cbdd82'
            '1107fd002e1123fd52535f0016ee241c12d719a62c0a301a97338a230a73267b43982e0d23250ecac09b3a4b0ae78710fa9e04d84d5729ee6ac7293935579706'
            '247c393a1c84becea57ccae6e1c6ed8c0eae3f874627677f3944dca0197565b6b12912357ad4f025a5a876f294338cb79d498484392aabaf4bfa22e5a2c08b24'
            '1ec09ac2bbfe242670f9b51842c58bbe9b379f7a1bfeec12157b5ba3ea3142c88eb62462968f4378c64d75fa4148dca6123583399f93e2b6990c094d386f0951'
            '4913dd84ae21514b761b2710d015ae091d5909f5ceccabb17f334afd25af3142bb4768417c549a2ab5f83bb4541fd561bd4a653ad4b2396d51a17c2d6c215c91'
            '151983a93d74aac2d5fc23042e1c352a50478f663fae9e11739e0e3ea2139f2c0dfa6307cad4074a2319f3b1ce7be7d2cf73f37633bb2e4a12619b8b85757db8')

prepare() {
  cd "${_archive_dir}"

  # Fix the directory for FindCompiz.cmake and FindCompizConfig.cmake
  patch -p1 -i ../0001-Fix-cmake-install-directory.patch

  # Compiz's build system appends --install-layout=deb to the python 2 install
  # command (for python-compizconfig and ccsm) whether or not COMPIZ_DEB_BUILD
  # is set to 1
  patch -p1 -i ../0002-Fix-python-install-command.patch

  # Use python 2
  patch -p1 -i ../0003-Use-Python-2.patch

  # Don't treat warnings as errors
  patch -p1 -i ../0004-Disable-Werror.patch

  # Add support for metacity 3.16's API
  patch -p1 -i ../0001-Add-metacity-3.16-support.patch
  patch -p1 -i ../0002-Remove-function-declarations-from-gtk-window-decorat.patch

  # Apply Ubuntu patches
  if [[ "${_use_ppa}" != true ]]; then
    patch -p1 -i ../compiz_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff
  fi

  sed -i '/100_workaround_virtualbox_hang.patch/d' debian/patches/series

  for i in $(grep -v '#' debian/patches/series); do
    msg "Applying ${i}"
    patch -p1 -i "debian/patches/${i}"
  done
}

build() {
  cd "${_archive_dir}"

  # Fix build on i686
  export CXXFLAGS+=" -lc"

  # Disable '-Bsymbolic-functions' if present so libcompiz_core won't be
  # loaded once per plugin
  export LDFLAGS="$(echo ${LDFLAGS} | sed 's/-B[ ]*symbolic-functions//')"

  # Disable rpath in Python 2 bindings
  export COMPIZ_DISABLE_RPATH=1

  # Compiz will segfault if the CMake built target is set to 'Release'
  # Disable tests since they can't run on a headless build server

  [[ -d build ]] && rm -rvf build/
  mkdir build/
  cd build/
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMPIZ_BUILD_WITH_RPATH=FALSE \
    `# -DCMAKE_BUILD_TYPE=RelWithDebInfo` \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCOMPIZ_PACKAGING_ENABLED=TRUE \
    -DUSE_GSETTINGS=ON \
    -DUSE_GCONF=OFF \
    -DCOMPIZ_DISABLE_GS_SCHEMAS_INSTALL=OFF \
    -DCOMPIZ_BUILD_TESTING=OFF \
    -DCOMPIZ_DISABLE_PLUGIN_KDE=ON \
    -DUSE_KDE4=OFF \
    `# Necessary for new versions of Compiz` \
    `# https://bugs.launchpad.net/compiz/+bug/1070211` \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -Dlibdir=/usr/lib \
    -Dlibcompizconfig_libdir=/usr/lib

  make
}

package() {
  cd "${_archive_dir}/build"
  make install DESTDIR="${pkgdir}"

  # Stupid findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  #make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' \
    | awk -F\" '{print $2}')
  install -dm755 "${pkgdir}${CMAKE_DIR}/Modules/"
  install -m644 ../cmake/FindCompiz.cmake \
    "${pkgdir}${CMAKE_DIR}/Modules/"

  # Install documentation
  install -dm755 "${pkgdir}/usr/share/doc/compiz/"
  install ../{AUTHORS,NEWS,README} \
    "${pkgdir}/usr/share/doc/compiz/"

  # Install Ubuntu's files
  install -dm755 "${pkgdir}/usr/share/man/man1/"
  install -dm755 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -dm755 "${pkgdir}/etc/compizconfig/upgrades/"
  install -dm755 "${pkgdir}/usr/share/gnome/wm-properties/"

  # Install manual pages
  install -m644 ../debian/{ccsm,compiz,gtk-window-decorator}.1 \
    "${pkgdir}/usr/share/man/man1/"

  # Window manager desktop file for GNOME
  install -m644 \
    "${pkgdir}/usr/share/applications/compiz.desktop" \
    "${pkgdir}/usr/share/gnome/wm-properties/"

  # Install X11 startup script
  install -m755 ../debian/65compiz_profile-on-session \
    "${pkgdir}/etc/X11/xinit/xinitrc.d/"

  # Unity Compiz profile configuration file
  install -m644 ../debian/unity.ini "${pkgdir}/etc/compizconfig/"

  # Install Compiz profile configuration file
  install -m644 ../debian/compizconfig "${pkgdir}/etc/compizconfig/config"

  # Compiz profile upgrade helper files for ensuring smooth upgrades from older
  # configuration files
  pushd ../debian/profile_upgrades/
  find . -type f -name '*.upgrade' -exec \
    install -m644 {} "${pkgdir}"/etc/compizconfig/upgrades/{} \;
  popd

  install -dm755 "${pkgdir}/usr/lib/compiz/migration/"
  pushd ../postinst/convert-files/
  find . -type f -name '*.convert' -exec \
    install -m644 {} "${pkgdir}"/usr/lib/compiz/migration/{} \;
  popd

  # Install keybinding files
  install -dm755 "${pkgdir}/usr/share/gnome-control-center/keybindings/"
  install -dm755 "${pkgdir}/usr/share/unity-control-center/keybindings/"
  find ../*/gtk/gnome/ -name *.xml -exec install {} \
    "${pkgdir}/usr/share/gnome-control-center/keybindings/" \;
  find ../*/gtk/gnome/ -name *.xml -exec install {} \
    "${pkgdir}/usr/share/unity-control-center/keybindings/" \;

  # Default GSettings settings
  install -m644 ../debian/compiz-gnome.gsettings-override \
    "${pkgdir}/usr/share/glib-2.0/schemas/10_compiz-ubuntu.gschema.override"

  # Install script for resetting all of Compiz's settings
  install "${srcdir}/compiz.reset" "${pkgdir}/usr/bin/compiz.reset"

  # Remove GConf schemas
  rm -rv "${pkgdir}/usr/share/gconf/"

  # Don't disable gnomecompat plugin
  rm "${pkgdir}/etc/compizconfig/upgrades/com.canonical.unity.unity.07.upgrade"
  sed -ri '/s0_active_plugins/s/$/;gnomecompat/g' \
    "${pkgdir}/etc/compizconfig/unity.ini"
}
