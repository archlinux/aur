pkgname=clash-party-git
_pkgname=${pkgname%-git}
_realname=mihomo-party
pkgver=1.9.4.r11.g1b96e07
pkgrel=1
pkgdesc="Another Mihomo GUI."
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-party-org/clash-party"
license=('GPL-3.0')
provides=("$_pkgname" "$_realname")
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-electron" "$_pkgname-electron-bin"
           "$_realname" "$_realname-git" "$_realname-bin" "$_realname-electron" "$_realname-electron-bin")
depends=('gtk3' 'nss' 'nspr' 'at-spi2-core')
optdepends=('libappindicator-gtk3: Allow mihomo-party to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('nodejs' 'pnpm' 'jq' 'libxcrypt-compat')
source=("git+$url.git")
sha256sums=("SKIP")
options=('!lto')

pkgver() {
  cd $srcdir/${_pkgname}
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare(){
  cd $srcdir/${_pkgname}
  sed -i "s/productName: Clash Party/productName: clash-party/" electron-builder.yml
  pnpm install --no-frozen-lockfile
}

build(){
  cd $srcdir/${_pkgname}
  pnpm build:linux deb
}

package() {
	cd $srcdir/${_pkgname}/dist
  bsdtar -xf clash-party-linux-$(jq '.version' $srcdir/${_pkgname}/package.json | tr -d 'v"')*.deb
  bsdtar -xf data.tar.xz -C "${pkgdir}/"
  chmod +x ${pkgdir}/opt/clash-party/mihomo-party
  chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo
  chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo-alpha
  chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo-smart
  sed -i '3s!/opt/clash-party/mihomo-party!mihomo-party!' "${pkgdir}/usr/share/applications/${_realname}.desktop"

  install -Dm755 /dev/null "${pkgdir}/usr/bin/${_realname}"
  cat << EOF > "${pkgdir}/usr/bin/${_realname}"
#!/usr/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f "${XDG_CONFIG_HOME}/mihomo-party-flags.conf" ]]; then
	mapfile -t MIHOMO_PARTY_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/mihomo-party-flags.conf")"
	echo "User flags:" ${MIHOMO_PARTY_USER_FLAGS[@]}
fi

# Launch
exec /opt/clash-party/mihomo-party ${MIHOMO_PARTY_USER_FLAGS[@]} "$@"
EOF

  chown -R root:root ${pkgdir}
}
