# Maintainer: Swift Geek
# Contributor: c0nd0r <gcesarmza@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: webjdm <web.jdm@gmail.com>
# Contributor: magedon <magedon.zt@gmail.com>

pkgname=bin32-firefox
pkgver=39.0
pkgrel=1
pkgdesc="Firefox 32bit for Arch 64 bit (en-US)"
arch=('x86_64')
_arch=i686
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/projects/firefox"
depends=('lib32-dbus-glib' 'lib32-gtk2' 'lib32-libxt' 'lib32-alsa-lib' 'lib32-nss' 'lib32-xcb-util')
optdepends=('bin32-firefox-i18n: i18n support'
            'lib32-flashplugin: flash support'
            'bin32-acroread: adobe reader plugin'
            'bin32-icedtea-web: java plugin'
            'lib32-librsvg: svg_loader.so library'
            'lib32-gtk-engines: libclearlooks.so library')
source=("https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/linux-$_arch/en-US/firefox-$pkgver.tar.bz2"
        'firefox32.desktop' 'firefox32-safe.desktop' 'mozplugin.patch')
md5sums=('5018deec1f7e992deb251a8fc5f0ffd3'
         '467b7e46030ee36d7a0e0752d0fa5480'
         '9957b560418ad4baf6c6a0d015df2b15'
         '8ef4b2a15b9d5e9d5bd5df323dbf012f')
package() {
  # directory and files
  cd ${pkgdir}
  mkdir -p {usr/bin,usr/lib32}
  cp -r ${srcdir}/firefox usr/lib32/${pkgname}
  mv usr/lib32/${pkgname}/firefox usr/lib32/${pkgname}/firefox32
  mv usr/lib32/${pkgname}/firefox-bin usr/lib32//${pkgname}/firefox32-bin
  cat <<EOF > usr/bin/${pkgname}
#!/bin/bash
/usr/lib32/${pkgname}/run-mozilla.sh /usr/lib32/${pkgname}/firefox32 \$*
EOF
  chmod +x usr/bin/${pkgname}

  # desktop icons
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/applications
  install -Dm644 firefox32.desktop firefox32-safe.desktop ${pkgdir}/usr/share/applications
  install -Dm644 firefox/browser/icons/mozicon128.png ${pkgdir}/usr/share/pixmaps/firefox32.png

  # set MOZ_PLUGIN_PATH variable
  cd ${pkgdir}/usr/lib32/${pkgname}
  patch -Np0 -i ${srcdir}/mozplugin.patch
}
