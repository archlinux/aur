# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek
# Contributor: c0nd0r <gcesarmza@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: webjdm <web.jdm@gmail.com>
# Contributor: magedon <magedon.zt@gmail.com>

pkgname=bin32-firefox
pkgver=76.0.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - 32bit version for 64bit systems"
arch=('x86_64')
_arch=i686
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/projects/firefox"
depends=('lib32-dbus-glib' 'lib32-gtk3' 'lib32-libxt' 'lib32-nss')
optdepends=('bin32-firefox-i18n: i18n support'
            'lib32-librsvg: svg_loader.so library'
            'lib32-gtk-engines: libclearlooks.so library'
            'lib32-ffmpeg: extra codec support (x264)')
source=("https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/linux-$_arch/en-US/firefox-$pkgver.tar.bz2"
        'firefox32.desktop'
	'firefox32-safe.desktop')
sha256sums=('f355704f2ccd0bfca2b6de07613262272f37a03b90948e9d6bd5024079819004'
            'd24cf628f3fe57da81c0e36ed2ac6b615560931bc588eda2e76dfd8d93e813f2'
            'ae6ddbaa9734c3938bb809a334acc96c54195b997ad0fb43d9a9442eb80e0f16')

package() {
  # directory and files
  cd ${pkgdir}
  mkdir -p {usr/bin,usr/lib32}
  cp -r ${srcdir}/firefox usr/lib32/${pkgname}
  mv usr/lib32/${pkgname}/firefox usr/lib32/${pkgname}/firefox32
  mv usr/lib32/${pkgname}/firefox-bin usr/lib32//${pkgname}/firefox32-bin
  cat <<EOF > usr/bin/${pkgname}
#!/bin/bash
MOZ_PLUGIN_PATH="/opt/mozilla/lib/plugins:/usr/lib32/mozilla/plugins" /usr/lib32/${pkgname}/firefox32 \$*
EOF
  chmod +x usr/bin/${pkgname}

  # desktop icons
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/applications
  install -Dm644 firefox32.desktop firefox32-safe.desktop ${pkgdir}/usr/share/applications
  install -Dm644 firefox/browser/chrome/icons/default/default128.png ${pkgdir}/usr/share/pixmaps/firefox32.png
}
