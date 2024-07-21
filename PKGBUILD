# Maintainer: Rajdeep Malakar <rajdeepm.dev@gmail.com>

pkgname=flamewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=128.1.2
pkgrel=2
pkgdesc="A crazy fork of Firefox, focused on privacy and features."
# TODO: Add arm64 (aarch64) support, once the CI for that is done
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://flame.rajdeepm.xyz/"
depends=(gtk3 libxt startup-notification mime-types dbus
  nss ttf-font libpulse ffmpeg)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(!emptydirs)

# TODO: Change the URL once more platforms are supported, and aarch64 support is added
_base_url=https://github.com/rustdevbtw/${pkgname//-bin/""}/releases/download/${pkgver}
_uploadpath_x86_64=${_base_url}/${pkgname//-bin/""}-amd64-linux.tar.bz2
source=(
  icons.tar.gz
  flamewolf.desktop
)
source_x86_64=("${_uploadpath_x86_64}")
b2sums=('702da3a5b14a725debcf86db181b723da12e44b18914729b7512b6047b47c0a3873dccb856d39b74ff52a32d3680ee320bde5f6bdc7fbb36110f2d86f3a15e90'
        '30c82609c3de6ae39b283b04ad32c943115b1981ab0f527cfead19c4eff22a7acb281d993948a5b8c7e0ab6724ebd82b78c2e019e7a715507e214b3680d6c44e')
b2sums_x86_64=('1a5e1da3e77553dbc570757408c57db540352d41fae6ab569223e72b957315ca5c649bb24b9ad008a7384471b98e3da8bbf13cf83cfc69976beafa9e578bab32')

package() {
  # Yep, that's somewhat redundant. But it works.
  install -dm 755 ${pkgdir}/usr/lib/flamewolf
  install -dm 755 ${pkgdir}/usr/bin
  cp -r "${srcdir}"/${pkgname//-bin/""}/* "${pkgdir}"/usr/lib/flamewolf

  cd ${srcdir}/${pkgname//-bin/""}

  local distini="$pkgdir/usr/lib/${pkgname//-bin/""}/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=xyz.rajdeepm.${pkgname//-bin/""}
version=1.0
about=FlameWolf

[Preferences]
app.distributor="FlameWolf Community"
app.distributor.channel=${pkgname//-bin/""}
app.partner.flamewolf=${pkgname//-bin/""}
END

  for i in 16 22 24 32 48 64 128 256 512 1024; do
    install -Dvm644 ${srcdir}/icons/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname//-bin/""}.png"
  done

  install -Dvm644 ${srcdir}/${pkgname//-bin/""}.desktop \
    "$pkgdir/usr/share/applications/${pkgname//-bin/""}.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/${pkgname//-bin/""}" <<END
#!/bin/sh
exec /usr/lib/${pkgname//-bin/""}/flamewolf "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/${pkgname//-bin/""}" "$pkgdir/usr/lib/${pkgname//-bin/""}/flamewolf-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/${pkgname//-bin/""}/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

}
