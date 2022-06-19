# Maintainer: rubyowo <perhaps-you-know@what-is.ml>
pkgname=discord-canary-electron-wayland-bin
_pkgname=discord-canary
__pkgname=DiscordCanary
pkgver=0.0.135
pkgrel=3
pkgdesc="Discord (popular voice + video app) using system electron (v13) and set up for wayland"
arch=('x86_64')
provides=('discord-canary')
conflicts=('discord-canary')
url='https://canary.discord.com'
license=('custom')
depends=('electron13' 'gtk3' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'xdg-utils' 'libcups')
makedepends=('asar' 'curl' 'python-html2text')
optdepends=('libpulse: Pulseaudio support'
  'xdg-utils: Open files'
  'noto-fonts-emoji: Google font for emoji support.'
  'ttf-symbola: Font for emoji support.'
  'noto-fonts-cjk: Font for special characters such as /shrug face.')
source=("https://dl-canary.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
  'LICENSE.html::https://discord.com/terms'
  'OSS-LICENSES.html::https://discord.com/licenses')

sha512sums=('954ef83265edbe5ff9db001836830ddb0e63fb66cc89a0f680c6b964392b37116b507f52cd0bfd8abd6495ba019ab5465c67c42e93dadf5839feb5918487cf1a'
  'SKIP'
  'SKIP')
prepare() {
  # create launcher script
  cat >>"$srcdir"/"$_pkgname" <<'EOF'
#!/bin/sh

if [ "$(loginctl show-session "$XDG_SESSION_ID" -p Type --value)" = wayland ]; then
	# Using wayland
	exec electron13 --enable-features=UseOzonePlatform \
		--ozone-platform=wayland /usr/lib/discord-canary/resources/app.asar \$@
else
	# Using x11
	exec electron13 /usr/lib/discord-canary/resources/app.asar \$@
fi
EOF

  # fix the .desktop file
  sed -i "s|Exec=.*|Exec=/usr/bin/discord-canary|" "$__pkgname"/discord-canary.desktop

  # create the license files
  curl https://discord.com/terms | html2text >"$srcdir"/LICENSE.md
  curl https://discord.com/licenses | html2text >"$srcdir"/OSS-LICENSES.md

  # use system electron version 13
  asar e "$__pkgname"/resources/app.asar "$__pkgname"/resources/app
  rm "$__pkgname"/resources/app.asar
  sed -i "s|process.resourcesPath|'/usr/lib/discord-canary/resources'|" "$__pkgname"/resources/app/app_bootstrap/buildInfo.js
  sed -i "s|exeDir,|'/usr/share/pixmaps',|" "$__pkgname"/resources/app/app_bootstrap/autoStart/linux.js
  asar p "$__pkgname"/resources/app "$__pkgname"/resources/app.asar
  rm -rf "$__pkgname"/resources/app
}

package() {
  # create necessary directories
  install -d "$pkgdir"/usr/{lib/discord-canary,bin}
  install -d "$pkgdir"/usr/share/{pixmaps,applications,licenses/discord}

  # copy relevant data
  cp -r "$__pkgname"/resources "$pkgdir"/usr/lib/discord-canary/
  # install the binary
  install -Dm 755 "$_pkgname" "$pkgdir"/usr/bin/discord-canary

  cp "$__pkgname"/discord.png \
    "$pkgdir"/usr/share/pixmaps/discord.png
  cp "$__pkgname"/discord-canary.desktop \
    "$pkgdir"/usr/share/applications/discord-canary.desktop

  # license
  install -Dm 644 LICENSE.md "$pkgdir"/usr/share/licenses/discord/
  install -Dm 644 OSS-LICENSES.md "$pkgdir"/usr/share/licenses/discord/
}
