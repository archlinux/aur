# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on aur/android-studio: Kordian Bruck <k@bruck.me>
# Based on aur/android-studio-canary: tilal6991 <lalitmaganti@gmail.com>, vanpra <pranavmaganti@gmail.com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>

_pkgname=android-studio
pkgname="${_pkgname}-beta"
pkgver=2020.3.1.17
pkgrel=1
pkgdesc='The Official Android IDE (Beta branch)'
arch=('i686' 'x86_64')
url='https://developer.android.com/studio/preview'
license=('APACHE')
makedepends=('unzip' 'zip')
depends=('alsa-lib' 'freetype2' 'libxrender' 'libxtst' 'which')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support')
options=('!strip')
source=("https://redirector.gvt1.com/edgedl/android/studio/ide-zips/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz"
        "${pkgname}.desktop"
        "license.html")
sha256sums=('5f3ecef20176ba4dbd955edc5340b535150ac088b7eae839ffc22017e41e99f6'
            'c4a15624eb258acbe119567b044f4a54be4ebb41f05e6f6cb4d941d130dc714f'
            '9a7563f7fb88c9a83df6cee9731660dc73a039ab594747e9e774916275b2e23e')

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
