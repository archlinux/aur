# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: Mihók Martin <mihok.martin@protonmail.com>
# Contributor: FabioLolix <fabio.loli@disroot.org>
# Contributor: Niklas Wojtkowiak <aur.7xcqe@passmail.com>
_pkgname='spacedrive'
pkgname="${_pkgname}-bin"
pkgver='0.4.1'
pkgrel='2'
epoch='1'
pkgdesc="A file manager from the future."
arch=('x86_64')
url="https://spacedrive.com"
_url_source='https://github.com/spacedriveapp/spacedrive'
license=('AGPL3')
source=("${_url_source}/releases/download/${pkgver}/Spacedrive-linux-x86_64.deb"
	"desktop_patch.patch")
sha256sums=('63a1953bc377473fafa0a616601f3ba616e63724c0733aa373e22644cfb9bf6d'
            'd24fff5cc9e249dcc6fc6a4380bab6582de69fe5a9a1bd68e6f53d4fc27d161c')
depends=(gtk3 ffmpeg4.4 ffmpeg webkit2gtk openssl-1.1 glibc gcc-libs glib2 pango libsoup cairo gdk-pixbuf2 libheif onnxruntime webkit2gtk-4.1 xdotool)
provides=(spacedrive)
conflicts=(spacedrive)

package() {
  tar -xf "${srcdir}/data.tar.gz" --directory "${srcdir}"
  #temporary workaround fixes #2006
  mkdir -p "${pkgdir}/usr/lib/spacedrive/"
  ln -s "/usr/lib/libonnxruntime.so" "${pkgdir}/usr/lib/spacedrive/libonnxruntime.so"
  # patch to fix desktop file
  patch -p1 $srcdir/usr/share/applications/spacedrive.desktop $srcdir/desktop_patch.patch

  chmod -R 755 "${srcdir}/usr/share/"
  install -Dm755 "${srcdir}/usr/bin/spacedrive" "${pkgdir}/usr/bin/spacedrive"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/"
}

