# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Karel Louwagie <karel@louwagie.net>

pkgname=toggldesktop
pkgver=7.4.24
pkgrel=1
pkgdesc="Toggl time tracking software"
arch=('x86_64')
url="https://github.com/toggl/toggldesktop"
license=('BSD')
depends=('libxss'
         'openssl'
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
        "production.patch"
        )

sha512sums=('3763f44a7364e130600edb09052132e0eef2f7d4700b661d20b0f5bdc4844504af186ce8aefc7953efb4ea9374883bad83f2e080c8f3eedc93533cff3bd0f108'
            'b694b38cf9ab0391dc6b1fc7a7e0dccf910e1edd16389d9eb8b2a893df1fddb86e6eb212bebdf008c8ec6991dc05f3dac6996ba2aa570211cd68f503879cadaa')

conflicts=('toggldesktop-bin' 'toggl-bin')

prepare() {
  cd "${srcdir}"

  # patch to build for production
  # https://github.com/toggl/toggldesktop/wiki/Building-Toggl-Desktop-from-source-for-usage-with-live-servers
  (
    cd "${pkgname}-${pkgver}"
    patch -p1 < ../production.patch
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
  make deps
  make
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

  # Copy README
  install -Dm644 src/ui/linux/README ${out}

  # Copy Bugsnag library
  install -Dm644 third_party/bugsnag-qt/build/release/libbugsnag-qt.so.1 ${out}/lib/libbugsnag-qt.so.1

  # Copy Poco libraries
  for lib in libPocoCrypto.so.31 libPocoData.so.31 libPocoDataSQLite.so.31 libPocoFoundation.so.31 libPocoJSON.so.31 libPocoNet.so.31 libPocoNetSSL.so.31 libPocoUtil.so.31 libPocoXML.so.31; do
    install -Dm644 third_party/poco/lib/Linux/x86_64/${lib} ${out}/lib/${lib}
  done

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


