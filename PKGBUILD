pkgbase=kodi-eggz
pkgname=kodi-eggz
pkgver=20.1
gittag=20.1-Nexus
gittagvfs=20.1.0-Nexus
pkgrel=2
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
  "0001-patching-the-patch-for-crossguid.patch"
  "0002-gcc13-fix-cheevos.patch"
  "0003-gcc13-fix-for-picture.patch"
  "0004-gcc13-fix-for-chararrayparser.patch"
  "0005-gcc13-fix-for-CSSUtils.patch"
  "0006-gcc13-fix-for-ColorManager.patch"
  "0007-gcc13-fix-for-VaapiEGL.patch"
  "0008-gcc13-fix-for-Filesystem.patch"
  "0009-gcc13-fix-for-StreamUtils.patch"
  "0010-gcc13-fix-for-DRMHelpers.patch"
)

sha256sums=(
'SKIP'
'SKIP'
'c5f89b5149b3f9fef7f138a0795402bcda1b6b097fe47e35b661f997fc5eebfd'
'9d803af68ba613e77490a94a20339a62eec512b96d6e8b3691dbf57a1a8e3ada'
'8ad1ff33eedb46a89210d62e788ddef68865e7cd7bcac1500e081c32bb009dcc'
'4ced2587a41d877ae76e1b6ba0b19646b4c7d4e26efa507ba0e2032b7a52dbd9'
'a49508ca05cbd31b21f5942a087ff813d99ad20af503485f55312dd74ca93f6e'
'9a8aa680d8e74cd07db434fac9a4e8b25884db44d7b393a0d7ab858f8ebbf6f0'
'dd9af3457b281e514921429972eb910b0e558efe76ef8683523c69b736c45dfd'
'538fc74c2a3712f96269dfdc747ab26c755f50a937051b87e3a6a0eaf6c221ff'
'4184379ade94fe2d220af451521556d87d524977b34ba807ea2351d2033d170e'
'5946db48a14a5bca5312a9dd2df42514872da4558b23c654ef45409006cf7435'
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
  if [ "$patch" == "" ]; then
    continue
  fi
  echo "Applying $patch"
  git apply $patch -v
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
 cmake ../xbmc -DAPP_RENDER_SYSTEM=gl -DCMAKE_INSTALL_PREFIX=/usr -DX11_RENDER_SYSTEM=gl -DENABLE_INTERNAL_LIBDISPLAYINFO=ON -DENABLE_INTERNAL_FMT=on -DENABLE_INTERNAL_FFMPEG=ON -DENABLE_INTERNAL_FSTRCMP=ON -DENABLE_INTERNAL_SPDLOG=ON -DENABLE_INTERNAL_CROSSGUID=ON -DENABLE_MYSQLCLIENT=ON -DHAVE_EGLEXTANGLE=1
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
