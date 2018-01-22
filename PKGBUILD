# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Serge Pavlyuk <flopss at gmail dot com>

pkgname=toggldesktop
pkgver=7.4.90
pkgrel=1
pkgdesc="Toggl time tracking software"
arch=('x86_64')
url="https://github.com/toggl/toggldesktop"
license=('BSD')
depends=('libxss'
         'openssl'
         'poco'
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
        "systemlibs.patch")

sha512sums=('be9fa6de6516fc55cbb616a358b8fc636fce38a430e2609cf314439da1625134be1986a2ef19cc3b2ffcea065d8a578fdc321f708f5ddb88524f3d6d9bfcc806'
            '484c6e3ba73e2f2ccbe9737424bee68624bd8d46a06735937b3ca134aa34ad9e335b260f7d22bcd3e351ae9d8b989ef048e78cf7ed52bac363bb651a7d229428'
            'e2084ecaf7ba3d3c630597450f5aff6bb65844002f2f7332a01228f0f0f0a2c8dae7b7af5f28063db63c5ce10dcd0b21d92adfb5fd8e25677e94eaa0c578c34d')

conflicts=('toggldesktop-bin' 'toggl-bin')

prepare() {
  cd "${srcdir}"

  (
    cd "${pkgname}-${pkgver}"

    # patch to build for production
    # https://github.com/toggl/toggldesktop/wiki/Building-Toggl-Desktop-from-source-for-usage-with-live-servers
    msg2 "production patch"
    patch -p1  < ../production.patch

    # patch to use sytem openssl and poco libs
    msg2 "systmlibs patch"
    patch -p1  < ../systemlibs.patch
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
