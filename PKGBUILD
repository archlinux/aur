pkgbase=kodi-eggz
pkgname=kodi-eggz
pkgver=20.0rc2
gittag=20.0rc2-Nexus
gittagvfs=20.1.0-Nexus
pkgrel=1
arch=('x86_64')
url="https://kodi.tv"
license=('GPL2')
depends=('libcec' 'tinyxml' 'shairplay')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'python-pycryptodomex' 'python-pillow' 'python-pybluez' 'python-simplejson'
  'shairplay' 'smbclient' 'taglib' 'tinyxml' 'swig'
  'upower' 'giflib' 'rapidjson' 'ghostscript' 'git' 'meson' 'gtest'
  'fstrcmp' 'spdlog' 'flatbuffers'
)

source=(
  "git+https://github.com/xbmc/xbmc.git#tag=$gittag"
  "git+https://github.com/xbmc/vfs.rar.git#tag=$gittagvfs"
  "Fix-eglextchromium.patch"
)

sha256sums=(
'SKIP'
'SKIP'
'faff047172c3b1cccd62aa6e30fd81e97eac7dd964ac19649755600cfe820b1f'
)

pkgver() {
  echo $pkgver
}

prepare() {
 export PATH="$srcdir/path:$PATH"
 msg "Getting thread count"
 threads=$(lscpu | grep ^'CPU(s):' | awk '{print $NF}')

 msg "Making vfs system addon first"
 msg2 "init & pivot to vfs builddir"
 cd vfs.rar && mkdir build && cd build
 msg2 "Prebuilding vfs.rar system addon"
 cmake -DADDONS_TO_BUILD=vfs.rar -DADDON_SRC_PREFIX=../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../../xbmc/kodi-build/addons -DPACKAGE_ZIP=1 ../../xbmc/cmake/addons
 make -j $threads || exit 2

 msg "Prepare Kodi"
 msg2 "pivot to xbmc builddir"
 cd ${srcdir}/xbmc
 msg2 "Patching Kodisource"
 while read patch; do
  echo "Applying $patch"
  git apply $patch
 done <<< $(ls ../../*.patch)
}

build() {
 export PATH="$srcdir/path:$PATH"
 msg2 "pivot to kodi git dir"
 cd ${srcdir}/xbmc
 mkdir ${srcdir}/kodi-build
 cd ${srcdir}/kodi-build
 msg2 "cmake configure phase"
 export APP_RENDER_SYSTEM=gl
 cmake ../xbmc -DCMAKE_INSTALL_PREFIX=/usr -DX11_RENDER_SYSTEM=gl -DENABLE_INTERNAL_FMT=on -DENABLE_INTERNAL_FFMPEG=ON -DENABLE_INTERNAL_CROSSGUID=ON -DENABLE_INTERNAL_FSTRCMP=ON -DENABLE_INTERNAL_SPDLOG=ON -DENABLE_MYSQLCLIENT=ON -DHAVE_EGLEXTANGLE=1
 msg2 "cmake build phase"
 cmake --build . -- #VERBOSE=1

 msg "make install phase (prepackaging)"
 mkdir ${srcdir}/kodi-install && make install DESTDIR=${srcdir}/kodi-install
}

package() {
 pkgdesc="Latest stable-ish kodi build with VFS automaticly installed"
 cd ${srcdir}/kodi-build
 msg2 "Packaging kodi core"
 cp -r ${srcdir}/kodi-install/* ${pkgdir}

 msg2 "Injecting Kodi VFS System addon"
 #VFS Part 1: /usr/lib/kodi/addons/vfs.rar
 mkdir -p ${pkgdir}/usr/lib/kodi/addons/vfs.rar && cp -r ${srcdir}/xbmc/kodi-build/addons/vfs.rar/vfs.rar.so* ${pkgdir}/usr/lib/kodi/addons/vfs.rar/.
 #VFS Part 2: /usr/share/kodi/addons/vfs.rar/addon.xml
 mkdir -p ${pkgdir}/usr/share/kodi/addons/vfs.rar && cp ${srcdir}/xbmc/kodi-build/addons/vfs.rar/addon.xml ${pkgdir}/usr/share/kodi/addons/vfs.rar/.
 #VFS Part 3: resources
 cp -r ${srcdir}/xbmc/kodi-build/addons/vfs.rar/resources ${pkgdir}/usr/share/kodi/addons/vfs.rar/.
}
