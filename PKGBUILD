# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: Mihók Martin <mihok.martin@protonmail.com>
# Contributor: FabioLolix <fabio.loli@disroot.org>
# Contributor: Niklas Wojtkowiak <aur.7xcqe@passmail.com>
_pkgname='spacedrive'
pkgname="${_pkgname}-bin"
pkgver='0.3.1'
pkgrel='3'
epoch='1'
pkgdesc="A file manager from the future."
arch=('x86_64')
url="https://spacedrive.com"
_url_source='https://github.com/spacedriveapp/spacedrive'
license=('AGPL3')
source=("${_url_source}/releases/download/${pkgver}/Spacedrive-linux-x86_64.deb"
	"desktop_patch.patch")
sha256sums=('13598e3831b863305cd133d92662a0aedfdce61a792f0ccb6983e5f89e5d9e48'
            'd68c40e9a968b15a8bda43f48679bd211726d9811922b2f83169750af3574299')
depends=(gtk3 ffmpeg4.4 webkit2gtk openssl-1.1 glibc gcc-libs glib2 pango libsoup cairo gdk-pixbuf2 libheif onnxruntime webkit2gtk-4.1 xdotool)
provides=(spacedrive)
conflicts=(spacedrive)

package() {
  tar -xf "${srcdir}/data.tar.gz" --directory "${srcdir}"
  #temporary workaround fixes #2006
  mkdir -p "${pkgdir}/usr/lib/spacedrive/"
  ln -s "/usr/lib/libonnxruntime.so" "${pkgdir}/usr/lib/spacedrive/libonnxruntime.so"
  # environmental variable to fix webkit2gtk rust error
  patch -p1 $srcdir/usr/share/applications/spacedrive.desktop $srcdir/desktop_patch.patch

  chmod -R 755 "${srcdir}/usr/share/"
  install -Dm755 "${srcdir}/usr/bin/spacedrive" "${pkgdir}/usr/bin/spacedrive"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/"
}

