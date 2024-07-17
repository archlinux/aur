# Maintainer: Rajdeep Malakar <rajdeepm.dev@gmail.com>

pkgname=flamewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=128.1.1
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
_uploadpath_x86_64=${_base_url}/${pkgname//-bin/""}-linux.tar.bz2
source=(
  icons.tar.gz
  flamewolf.desktop
)
source_x86_64=("${_uploadpath_x86_64}")
b2sums=('702da3a5b14a725debcf86db181b723da12e44b18914729b7512b6047b47c0a3873dccb856d39b74ff52a32d3680ee320bde5f6bdc7fbb36110f2d86f3a15e90'
  'c8c1b1d3d9d27947915ce844b549f9e1231a695c9bdf6c80e8ccead0831fc1c630b2a829e35c3c0ddbca5e914596d06e1d899254151e2dac7385cc43d2f4edb3')
b2sums_x86_64=('f047a6f7c3859eff6fb8e5cb4d0eb0b672a73d746128a23c6bab97b234ff9fb995dd52c933ddaefbd015b6080627b8e3ae3254a87578e194b752e894ca650a7c')

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
