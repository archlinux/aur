# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=upwork
pkgver=5.8.0.41
pkgrel=4
_hashver='f0de03505cc349f2'
pkgdesc='Track your time for Hourly Payment Protection. Stay connected.'
arch=('x86_64')
url='https://www.upwork.com/ab/downloads/?os=linux'
license=('LicenseRef-Upwork-EULA')
_electron='electron36'
depends=(
  "$_electron"
  'libxcrypt-compat' # electron-builder needs libcrypt.so.1
  'libxss' # Upwork's uta_native.node needs libXss.so.1
)
makedepends=('asar' 'curl')
optdepends=(
  'firefox: Upwork needs a web browser to login'
  'epiphany: Upwork needs a web browser to login'
  'konqueror: Upwork needs a web browser to login'
  'upwork-wayland: Allows screenshot to work in Wayland'
  'libappindicator: For system notifications'
  'gnome-shell-extension-appindicator: To show tray icon in GNOME'
)
conflicts=('upwork-beta')
source=(
  "https://upwork-usw2-desktopapp.upwork.com/binaries/v${pkgver//./_}_$_hashver/upwork_${pkgver}_amd64.deb"
  'upwork-team-software-license-agreement-1-1.pdf::https://upwork.pactsafe.io/versions/6887e5128f84f23a737bf6bb.pdf'
  'upwork.sh.in')
# See https://upwork-usw2-desktopapp.upwork.com/binaries/v5_8_0_41_f0de03505cc349f2/upwork_5.8.0.41_amd64.deb.sha256
sha256sums=('b2ed1ff34cfcc09cfa9ff472e39443aa999dd773867a57aef6f50798fb257239'
            '1d2db24cd1364f79d11b8683c15274f4e5c7ed9a3e46a5938b55c6e9ca56937f'
            '2c0d3d540933d4d5af57ab3021a2f37a2e855b43c1255dffccb333fd172ac5dd')

# These are the headers that Upwork 5.8.0.33 Electron use to download the update file without restriction.
# Notice that we are using the headers from an older Upwork version.
# This is because Upwork's update codes download the .deb file only when it is outdated.
# From the eyes of the WAF it will be weird that the latest user-agent is downloading an update.
# Hence, we use the older user-agent to simulate Upwork's update routine.
_headers=(
  'sec-fetch-site: none'
  'sec-fetch-mode: no-cors'
  'sec-fetch-dest: empty'
  'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Upwork/5.8.0 Chrome/100.0.4896.160 Electron/18.3.15 Safari/537.36'
  'accept-encoding: gzip, deflate, br'
  'accept-language: en-US'
)
# DLAGENTS seem to have problem accepting arguments with spaces and so escape all of them
DLAGENTS=("https::/usr/bin/curl $(printf -- "-H %s " "${_headers[@]// /\\ }") -qfL -b '' -C - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
  bsdtar -xf data.tar.xz -C ./

  # Change Electron executable
  sed -i "s|@ELECTRON@|$_electron|" upwork.sh.in

  # Change the upwork wrapper path to /usr/bin/upwork
  sed -i 's|Exec=/opt/Upwork/upwork|Exec=/usr/bin/upwork|' ./usr/share/applications/upwork.desktop
  sed -i 's|/opt/Upwork/upwork|/usr/bin/upwork|' ./opt/Upwork/resources/apparmor-profile

  # Extract app.asar so we can modify main.js
  cd ./opt/Upwork/resources
  asar e app.asar ./out
  cd ./out/out/main

  # Not needed
  rm main.compiled.jsc

  # In AUR/upwork the addons are in /usr/lib/upwork instead of /opt/Upwork
  sed -i 's|(process.execPath),"uta_native.node"|("/usr/lib/upwork/uta_native.node"),"uta_native.node"|' main.js
  sed -i -E 's|join\([^,]+,"cmon"\)|join("/usr/lib/upwork/","cmon")|' main.js

  # Disable updates
  sed -i 's|UpdateBinaryInitiate(|UpdateBinaryInitiate(a,b,c){}xxx(|' main.js

  # Pack app.asar again
  cd "$srcdir/opt/Upwork/resources"
  asar p ./out app.asar
}

package() {
  # 1. COPY THE BINARIES
  install -Dm755 upwork.sh.in "$pkgdir/usr/bin/upwork"
  install -Dm755 -t "$pkgdir/usr/lib/upwork/" ./opt/Upwork/{cmon,uta_native.node}
  install -Dm644 -t "$pkgdir/usr/lib/upwork/" ./opt/Upwork/resources/app.asar

  # 2. COPY THE REST OF THE /usr/share/* from deb file
  mkdir -p "$pkgdir/usr/share"
  cp -dr --no-preserve=ownership ./usr/share/* "$pkgdir/usr/share"
  install -Dm644 -t "$pkgdir/usr/share/licenses/upwork/" upwork-team-software-license-agreement-1-1.pdf

  # 3. COPY APPARMOR PROFILE
  install -Dm644 ./opt/Upwork/resources/apparmor-profile "$pkgdir/etc/apparmor.d/upwork"
}
