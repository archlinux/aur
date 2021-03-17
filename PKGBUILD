# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on aur/android-studio: Kordian Bruck <k@bruck.me>
# Contributor: Tad Fisher <tadfisher at gmail dot com>

_pkgname=android-studio
pkgname="${_pkgname}-beta"
pkgver=4.2.0.22
pkgrel=1
_build=202.7188722
pkgdesc='The Official Android IDE (Beta branch)'
arch=('i686' 'x86_64')
url='https://developer.android.com/studio/preview'
license=('APACHE')
makedepends=('unzip' 'zip')
depends=('alsa-lib' 'freetype2' 'libxrender' 'libxtst' 'which')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support')
options=('!strip')
source=("https://redirector.gvt1.com/edgedl/android/studio/ide-zips/${pkgver}/${_pkgname}-ide-${_build}-linux.tar.gz"
        "${pkgname}.desktop")
sha256sums=('ab67c136edad5ae269da4d06bc685ddc0436626481b5f33e272974cd429ffc57'
            '368b5287efcfd2b421bdd10e1bdd39a8bffeb84500745c4a88729609c841bcf7')

if [ "${CARCH}" = "i686" ]; then
    depends+=('java-environment')
fi

build() {
  cd "${_pkgname}"

  # Change the product name to produce a unique WM_CLASS attribute.
  mkdir -p idea
  unzip -p lib/resources.jar idea/AndroidStudioApplicationInfo.xml \
      | sed "s/\"Studio\"/\"Studio Beta\"/" > idea/AndroidStudioApplicationInfo.xml
  zip -r lib/resources.jar idea
  rm -r idea
}

package() {
  # Install the application.
  install -d "${pkgdir}"/{opt/"${pkgname}",usr/bin}
  cp -a "${_pkgname}"/* "${pkgdir}/opt/${pkgname}/"
  ln -s "/opt/${pkgname}/bin/studio.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Add the icon and desktop file.
  install -Dm644 "${_pkgname}"/bin/studio.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}".desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  chmod -R ugo+rX "${pkgdir}/opt"
}
