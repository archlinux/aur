# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Serge Pavlyuk <flopss at gmail dot com>
# Contributor: phi-mah

pkgname=toggldesktop
pkgver=7.4.144
pkgrel=2
pkgdesc="Toggl time tracking software"
arch=('x86_64')
url="https://github.com/toggl/toggldesktop"
license=('BSD')
depends=('libxss'
         'qt5-base'
         'qt5-declarative'
         'qt5-location'
         'qt5-sensors'
         'qt5-svg'
         'qt5-webchannel'
         'qt5-webkit'
         'qt5-x11extras')
makedepends=('readline' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/toggl/toggldesktop/archive/v${pkgver}.tar.gz"
        "production.patch")

sha512sums=('08bf840dc84bf16689bebcd21f25de493d6d245b65229fb01ddad67c3c878dbdda9e66952ae86e24f5d52a30edd08576f8e1755702956223dfd6c29000365359'
            '484c6e3ba73e2f2ccbe9737424bee68624bd8d46a06735937b3ca134aa34ad9e335b260f7d22bcd3e351ae9d8b989ef048e78cf7ed52bac363bb651a7d229428')

conflicts=('toggldesktop-bin' 'toggl-bin')

prepare() {
  cd "${srcdir}"

  (
    cd "${pkgname}-${pkgver}"

    # patch to build for production
    # https://github.com/toggl/toggldesktop/wiki/Building-Toggl-Desktop-from-source-for-usage-with-live-servers
    msg2 "production patch"
    patch -p1  < ../production.patch
  )

  # make the run script
  cat << EOF > ${pkgname}
#!/bin/bash
exec /opt/${pkgname}/TogglDesktop.sh "\$@"
EOF

  # generate a desktop file
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --name "Toggl Desktop"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 deps
  make -j1
}

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 ${pkgname}  ${pkgdir}/usr/bin/${pkgname}

  cd "${pkgname}-${pkgver}"

  # license file in standard location
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  out="${pkgdir}/opt/${pkgname}"

  # Copy Toggl Desktop shared library
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so.1 ${out}/lib/libTogglDesktopLibrary.so.1

  # Copy Poco shared library
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoCrypto.so.50 ${out}/lib/libPocoCrypto.so.50
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoData.so.50 ${out}/lib/libPocoData.so.50
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoDataSQLite.so.50 ${out}/lib/libPocoDataSQLite.so.50
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoFoundation.so.50 ${out}/lib/libPocoFoundation.so.50
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoJSON.so.50 ${out}/lib/libPocoJSON.so.50
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoNet.so.50 ${out}/lib/libPocoNet.so.50
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoNetSSL.so.50 ${out}/lib/libPocoNetSSL.so.50
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoUtil.so.50 ${out}/lib/libPocoUtil.so.50
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libPocoXML.so.50 ${out}/lib/libPocoXML.so.50

  # Copy openssl shared library
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libcrypto.so.1.1 ${out}/lib/libcrypto.so.1.1
  install -Dm644 src/lib/linux/TogglDesktopLibrary/build/release/libssl.so.1.1 ${out}/lib/libssl.so.1.1

  # Copy README
  install -Dm644 src/ui/linux/README ${out}

  # Copy Bugsnag library
  install -Dm644 third_party/bugsnag-qt/build/release/libbugsnag-qt.so.1 ${out}/lib/libbugsnag-qt.so.1

  # Copy executable
  install -Dm755 src/ui/linux/TogglDesktop/build/release/TogglDesktop ${out}

  # Copy startup script
  install -Dm755 src/ui/linux/TogglDesktop.sh ${out}

  # Copy icons
  install -Dm644 src/ui/linux/TogglDesktop/icons/1024x1024/${pkgname}_gray.png ${out}/icons/1024x1024/${pkgname}_gray.png
  for res in 1024x1024 128x128 16x16 24x24 256x256 32x32 48x48 64x64 96x96; do
    install -Dm644 src/ui/linux/TogglDesktop/icons/${res}/${pkgname}.png ${out}/icons/${res}/${pkgname}.png
  done

  # Copy certificate bundle
  install -Dm644 src/ssl/cacert.pem ${out}

  # link icon for desktop file
  install -dm755 "${pkgdir}/usr/share/pixmaps/"
  ln -s "/opt/${pkgname}/icons/1024x1024/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
