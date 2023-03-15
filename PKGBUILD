# Maintainer: Bence Hornák <bence.hornak@gmail.com>
# Maintainer: xaque <xaque at 🦆 dot com>

pkgname=dcvviewer-bin
_pkgname=dcvviewer
_majver=2022.2
_minver=4804
pkgver=${_majver}.${_minver}
pkgrel=2
pkgdesc="NICE DCV client for Linux. DCV is a desktop remotization server, with support for native as well as web-based clients."
arch=('x86_64')
url="https://www.nice-software.com/products/dcv"
license=('custom: commercial')
depends=('cairo' 'dconf' 'desktop-file-utils' 'ffmpeg' 'gdk-pixbuf2' 'glib2' 'glibc' 'graphite' 'gst-plugins-base' 'gstreamer' 'gtk3' 'krb5' 'libepoxy' 'libjpeg6' 'libsasl' 'libsoup' 'libx11' 'lmdb' 'lz4' 'nss' 'pango' 'pcre' 'pcsclite' 'protobuf-c' 'sqlite' 'zlib'
)
source=(
  "https://d1uj6qtbmh3dt5.cloudfront.net/${_majver}/Clients/nice-dcv-viewer_${pkgver}-1_amd64.ubuntu2204.deb"
)
sha256sums=('SKIP')

package(){

  # Extract package data, move files to comply with Arch package guidelines
  # (https://wiki.archlinux.org/index.php/Arch_package_guidelines#Directories)
  tar -xf data.tar.zst -C "${pkgdir}" \
    --transform 's,^./usr/lib/x86_64-linux-gnu,./usr/lib,' \
    --transform 's,^./usr/libexec,./usr/lib,' \
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
  sed -i '2 i export GDK_BACKEND=x11' "${pkgdir}/usr/bin/dcvviewer"

  # Remove libraries replaced by system ones

  pushd "${pkgdir}/usr/lib/${_pkgname}"
  
  # Provided by glib2
  rm libglib-2.0.so.0 libgmodule-2.0.so.0 libgobject-2.0.so.0 libgthread-2.0.so.0 libgio-2.0.so.0
  # Might want to keep with same version of glib
  rm libffi.so.* libjson-glib-1.0.so.0
  # Codecs provided by ffmpeg, gst-plugins-base, lz4, zlib
  #rm libavcodec.so.* libturbojpeg.so.0 libavutil.so.* libopus.so.0 libjpeg.so.62 liblz4.so.1 libz.so.1
  #rm liblmdb.so libprotobuf-c.so.1
  #
  rm libpcre.so.1
  # Keep these ones provided by DCV Viewer. There are symbols being looked up in the provided libsoup-3 not in the system one
  #rm libsasl2.so.3 libsoup-3.0.so.0
  # libsoup deps
  #rm libnghttp2.so.14 libpsl.so.5
  
  #pushd sasl2
  #rm libanonymous.so libdigestmd5.so libplain.so libscram.so libcrammd5.so libsasldb.so
  # No replacements for these yet
  # rm libotp.so libgssapiv2.so libgs2.so
  #popd

  popd
}
