# Maintainer: Hunter Grey <grey@huntergrey.cn>
# Contributor: level666 <lev3l666@gmail.com>

pkgname=zeppossimulator
pkgver=2.1.2
pkgrel=1
pkgdesc="Simulator for developing Zepp OS mini programs and watchfaces"
arch=('x86_64')
url="https://zeppos.com/developer/simulator/"
# Proprietary Zepp EULA, which upstream does not ship in the .deb - only the
# Electron and Chromium notices are there, and those are what land in
# /usr/share/licenses. Terms live at the url above.
license=('LicenseRef-custom')
options=('!strip' '!debug')

# Taken from the NEEDED entries of every ELF in the .deb, mapped to the package
# that owns each soname. glibc and gcc-libs are implicit and left out.
depends=(
  # Electron
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gdk-pixbuf2' 'glib2'
  'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
  'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango'

  # bundled qemu-system-arm
  'gnutls' 'libaio' 'libepoxy' 'libjpeg-turbo' 'libpng' 'libsasl' 'numactl'
  'pixman' 'sdl2-compat' 'vte3' 'zlib'

  # dlopened by name, so they have no NEEDED entry to be found by
  'libnotify' 'libsecret' 'xdg-utils'
)
optdepends=('libappindicator-gtk3: tray icon support')

# Upstream files every build under the date it was published, so the directory
# changes with each release. The download table is rendered client side at
# https://docs.zepp.com/docs/guides/tools/simulator/download/ ; the machine
# readable copy is docs/guides/tools/simulator/download.md in
# https://github.com/zepp-health/zeppos-docs
_date=20260717
_deb="simulator_${pkgver}_linux_amd64.deb"
source=("https://upload-cdn.zepp.com/zepp-applet-and-wechat-applet/${_date}/${_deb}")
noextract=("$_deb")
sha256sums=('ab9b35c04ae5b016965fe7d051507b5b5a2eb7b5c0f85059294c1004d2be9aa0')

# Every fixup in package() rests on an assumption about upstream's layout, and
# `rm -f` on a path that moved is how a silently broken package ships. 2.1.2
# already dropped the bogus 0x0 icon directory that 2.1.1 needed rescuing from,
# so this is not hypothetical. Assert first and let the build fail loudly.
# exit rather than return, so a missing path aborts regardless of errexit,
# and print by hand rather than borrowing makepkg's error(), which is internal.
_die() { printf '==> ERROR: %s\n' "$*" >&2; exit 1; }
_expect() { [[ -e $1 ]] || _die "upstream layout changed: $1 is gone"; }

package() {
  bsdtar -xOf "$_deb" data.tar.xz | bsdtar -xJf - -C "$pkgdir"

  local _app="$pkgdir/opt/simulator"
  local _fw="$_app/resources/firmware"

  # The .deb ships these 0644; upstream's postinst papered over it with a
  # blanket `chmod 777 -R /opt/simulator`. Nothing writes into /opt at runtime
  # (state lives in ~/.zepp), so keep the tree read-only and just fix the modes.
  _expect "$_fw/qemu_linux/qemu-system-arm"
  _expect "$_fw/start_qemu.sh"
  chmod 755 "$_fw/qemu_linux/qemu-system-arm" "$_fw/start_qemu.sh"

  # Arch ships cyrus-sasl 2.1.28 as libsasl2.so.3; Debian ships the same
  # version with its soname frozen at .2. start_qemu.sh already puts this
  # directory on LD_LIBRARY_PATH, so the shim stays out of /usr/lib. Guarded,
  # because once upstream rebuilds qemu against a current sasl this symlink
  # would just be a dangling file nobody notices.
  if readelf -d "$_fw/qemu_linux/qemu-system-arm" | grep -q 'libsasl2\.so\.2'; then
    ln -s /usr/lib/libsasl2.so.3 "$_fw/qemu_linux/lib/libsasl2.so.2"
  else
    _die "qemu no longer links libsasl2.so.2 - drop this shim and libsasl"
  fi

  # Prefer the system libjpeg over the vendored copy, which is otherwise
  # shadowed onto qemu via that same LD_LIBRARY_PATH and never gets updates.
  _expect "$_fw/qemu_linux/lib/libjpeg.so.8"
  rm "$_fw/qemu_linux/lib/libjpeg.so.8"

  # https://github.com/electron/electron/issues/17972
  _expect "$_app/chrome-sandbox"
  chmod 4755 "$_app/chrome-sandbox"

  # apt-get script, useless on Arch and misleading if anyone runs it
  _expect "$_fw/setup_for_linux.sh"
  rm "$_fw/setup_for_linux.sh"

  # Mach-O binary vendored by term-size. Its index.js only reaches for it under
  # process.platform === 'darwin', so on linux it is dead weight.
  local _termsize="$_app/resources/app.asar.unpacked/node_modules/term-size/vendor"
  _expect "$_termsize"
  rm -r "$_termsize"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/simulator/simulator "$pkgdir/usr/bin/simulator"

  # 2.1.1 filed a single 512x512 PNG under a bogus 0x0 size directory; 2.1.2
  # ships eight real sizes, so there is nothing left to rescue - but say so if
  # that ever regresses rather than shipping an icon the theme cannot find.
  _expect "$pkgdir/usr/share/icons/hicolor/512x512/apps/simulator.png"
  if [[ -d $pkgdir/usr/share/icons/hicolor/0x0 ]]; then
    _die "the bogus 0x0 icon directory is back; restore the 2.1.1 workaround"
  fi

  # Upstream's .desktop still lists MimeType twice, still uses the deprecated
  # "Application" category - which buries it in a catch-all menu section - and
  # still names the app a lowercase "simulator", which is also the only word
  # anyone can find it by.
  local _desktop="$pkgdir/usr/share/applications/simulator.desktop"
  _expect "$_desktop"
  sed -i -e 's/^Name=.*/Name=Zepp OS Simulator/' \
         -e 's|^MimeType=.*|MimeType=x-scheme-handler/zepp;|' \
         -e 's/^Categories=.*/Categories=Development;/' \
         "$_desktop"
  cat >> "$_desktop" <<'EOF'
GenericName=Smartwatch Simulator
Keywords=zepp;zeppos;amazfit;smartwatch;wearable;watchface;simulator;
EOF

  install -Dm644 "$_app/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$_app/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

  _expect "$pkgdir/usr/share/doc/simulator"
  mv "$pkgdir/usr/share/doc/simulator" "$pkgdir/usr/share/doc/$pkgname"
}
