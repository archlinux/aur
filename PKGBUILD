# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on aur/android-studio: Kordian Bruck <k@bruck.me>
# Based on aur/android-studio-canary: tilal6991 <lalitmaganti@gmail.com>, vanpra <pranavmaganti@gmail.com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>

PKGEXT='.pkg.tar'
_pkgname=android-studio
pkgname="${_pkgname}-beta"
pkgver=2021.2.1.12
pkgrel=1
pkgdesc='The Official Android IDE (Beta branch)'
arch=('i686' 'x86_64')
url='https://developer.android.com/studio/preview'
license=('APACHE')
makedepends=('unzip' 'zip')
depends=(
	'fontconfig'
	'freetype2'
	'libxrender'
	'libxtst'
	'which'
)
optdepends=(
	'lib32-gcc-libs: for aapt and mksdcard'
	'lib32-zlib: for aapt'
	'alsa-lib: emulator support'
	'dbus: emulator support'
	'expat: emulator support'
	'git: for flutter'
	'glib2: GTK+ look and feel'
	'gtk2: GTK+ look and feel'
	'gvfs: GTK+ look and feel'
	'libX11: emulator support'
	'libgl: emulator support'
	'libpulseaudio: emulator support'
	'libuuid: emulator support'
	'libxcb: emulator support'
	'libxcomposite: emulator support'
	'libxcursor: emulator support'
	'libxdamage: emulator support'
	'libxfixes: emulator support'
	'nspr: emulator support'
	'nss: emulator support'
	'systemd: emulator support'
	'xorg-setxkbmap: emulator support'
	'ncurses5-compat-libs: native gdb support'
)
options=('!strip')
source=("https://redirector.gvt1.com/edgedl/android/studio/ide-zips/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz"
        "${pkgname}.desktop"
        "license.html")
sha256sums=('f3307a7262ec177329e9c82e55f941e6830840fc0bd66317f4ffbb9273131462'
            'c4a15624eb258acbe119567b044f4a54be4ebb41f05e6f6cb4d941d130dc714f'
            'b417d7d95165598f64e8c5b76d7b152d91d764501ce65eb62d5145f98283576a')

if [ "${CARCH}" = "i686" ]; then
    depends+=('java-environment')
fi

build() {
  cd "${_pkgname}"

  # Change the product name to produce a unique WM_CLASS attribute
  mkdir -p idea
  unzip -p lib/resources.jar idea/AndroidStudioApplicationInfo.xml \
      | sed "s/\"Studio\"/\"Studio Beta\"/" > idea/AndroidStudioApplicationInfo.xml
  zip -r lib/resources.jar idea
  rm -r idea
}

package() {
  cd "${_pkgname}"

  # Install the application
  install -d "${pkgdir}"/{opt/"${pkgname}",usr/bin}
  cp -a * "${pkgdir}/opt/${pkgname}/"
  ln -s "/opt/${pkgname}/bin/studio.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Copy licenses
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${srcdir}"/license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"

  # Add the icon and desktop file.
  install -Dm644 bin/studio.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}".desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  chmod -R ugo+rX "${pkgdir}/opt"
}
