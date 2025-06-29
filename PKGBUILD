# Maintainer: Bence Hornák <bence.hornak@gmail.com>
# Maintainer: xaque <xaque at 🦆 dot com>

pkgname=dcvviewer-bin
_pkgname=dcvviewer
_majver=2024.0
_minver=8004
pkgver=${_majver}.${_minver}
pkgrel=1
pkgdesc="NICE DCV client for Linux. DCV is a desktop remotization server, with support for native as well as web-based clients."
arch=('x86_64')
url="https://www.nice-software.com/products/dcv"
license=('custom: commercial')
depends=('cairo' 'ffmpeg' 'gdk-pixbuf2' 'glib2' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good' 'gstreamer' 'gtk4' 'harfbuzz-icu' 'json-glib' 'krb5' 'libfido2' 'libjpeg6-turbo' 'libjpeg-turbo' 'libsasl' 'libsoup3' 'libx11' 'lmdb' 'lz4' 'nss' 'pcsclite' 'protobuf-c' 'sqlite' 'wayland'
)
source=(
  "https://d1uj6qtbmh3dt5.cloudfront.net/${_majver}/Clients/nice-dcv-viewer_${pkgver}-1_amd64.ubuntu2404.deb"
)
sha256sums=('c8255bc21d42decab9b12bfd2443021bd27734e8a975916eb66ac0dc99fb7e9b')
install="${_pkgname}.install"
package(){

  # Extract package data, move files to comply with Arch package guidelines
  # (https://wiki.archlinux.org/index.php/Arch_package_guidelines#Directories)
  tar -xf data.tar.zst -C "${pkgdir}" \
    --transform 's,^./usr/lib/x86_64-linux-gnu,./usr/lib,' \
    --transform 's,^./usr/share/dcvviewer/license/EULA.txt,./usr/share/licenses/dcvviewer/EULA,' \
    --transform 's,^./usr/share/dcvviewer\(/license\)\?$,.,' \
    --transform 's,^./usr/share/dcvviewer/third-party-licenses.txt,./usr/share/licenses/dcvviewer/LICENSE,' \
    --transform 's,^./usr/share/doc/nice-dcv-viewer/copyright,./usr/share/licenses/dcvviewer/COPYRIGHT,' \
    --transform 's,^./usr/share/doc\(/nice-dcv-viewer\)\?$,.,' \
    --exclude './usr/share/doc/nice-dcv-viewer/changelog.Debian.gz'

  # Update paths in launcher script
  sed -i 's|libexecdir=${basedir}/lib/x86_64-linux-gnu|libexecdir=${basedir}/lib|' "${pkgdir}/usr/bin/dcvviewer"
  sed -i 's|libdir=${basedir}/lib/x86_64-linux-gnu|libdir=${basedir}/lib|' "${pkgdir}/usr/bin/dcvviewer"

  # Fix for Wayland, force use of XWayland
  # sed -i '2 i export GDK_BACKEND=x11' "${pkgdir}/usr/bin/dcvviewer"

  # Remove libraries replaced by system ones
  
  pushd "${pkgdir}/usr/lib/${_pkgname}"
  
  ## Most runtime ##
  #rm libglib-2.0.so.0 libgmodule-2.0.so.0 libgobject-2.0.so.0 libgthread-2.0.so.0 libgio-2.0.so.0
  #rm libffi.so.* libjson-glib-1.0.so.0
  ##              ##
  
  ## Most  native ##
  mkdir keep
  mv libavcodec.so.* libavutil.so.* libdcv.so libsoup* keep
  rm *.so*
  rm gtk4-update-icon-cache glib-compile-schemas glib-compile-resources gdk-pixbuf-query-loaders
  rm -rf gtk-4.0 gstreamer-1.0
  mv keep/* .
  rmdir keep
  sed -i '/export GST_PLUGIN_SCANNER/d' "${pkgdir}/usr/bin/dcvviewer"
  sed -i '/export GST_PLUGIN_SYSTEM_PATH/d' "${pkgdir}/usr/bin/dcvviewer"
  sed -i '/export GTK_PATH/d' "${pkgdir}/usr/bin/dcvviewer"
  sed -i '/export PANGO_LIBDIR/d' "${pkgdir}/usr/bin/dcvviewer"
  #pushd sasl2
  #rm libanonymous.so libdigestmd5.so libplain.so libscram.so libcrammd5.so libsasldb.so    # libsasl
  #rm libgssapiv2.so libgs2.so    # cyrus-sasl-gssapi
  #rm libotp.so    # ?
  #popd
 ##              ##
   
  popd
}
