# Maintainer: tobias

pkgname=feishu
pkgver=7.50.14
pkgrel=1
_pkgtyp=stable

pkgdesc="Linux client of Feishu (Lark) from Bytedance (repacked from official .deb)"
arch=('x86_64')
url="https://www.feishu.cn/"
license=('custom:proprietary')

depends=(
  'ca-certificates'
  'gtk3'
  'nss'
  'libx11'
  'libxcb'
  'libxext'
  'xdg-utils'
  'libpulse'
  'dnsmasq'
)

optdepends=(
  'libu2f-host: U2F security key support'
  'vulkan-icd-loader: Vulkan support'
)

provides=('bytedance-feishu' 'feishu-bin' 'bytedance-feishu-stable')
conflicts=('feishu-bin' 'bytedance-feishu-stable-bin' 'bytedance-feishu-stable')
replaces=('feishu-bin' 'bytedance-feishu-stable-bin')

options=('!strip' '!emptydirs')

_pkghash_x86_64="e91d15e2"

source_x86_64=(
  "Feishu-linux_x64-${pkgver}.deb::https://sf3-cn.feishucdn.com/obj/ee-appcenter/${_pkghash_x86_64}/Feishu-linux_x64-${pkgver}.deb"
)

md5sums_x86_64=('3660717a2e15ba21867d9a21b966acf9')

prepare() {
  cd "$srcdir"
  bsdtar -xf "Feishu-linux_x64-${pkgver}.deb"
}

package() {
  cd "$srcdir"

  bsdtar -xf data.tar.xz -C "$pkgdir"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/feishu" <<'EOF'
#!/bin/bash
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f "$XDG_CONFIG_HOME/feishu-flags.conf" ]]; then
  FEISHU_USER_FLAGS="$(grep -v '^\s*#' "$XDG_CONFIG_HOME/feishu-flags.conf")"
fi

exec /usr/bin/bytedance-feishu-stable $FEISHU_USER_FLAGS "$@"
EOF

  if [[ -f "$pkgdir/usr/share/applications/bytedance-feishu.desktop" ]]; then
    sed -i 's|Exec=/usr/bin/bytedance-feishu-stable|Exec=/usr/bin/feishu|g' \
      "$pkgdir/usr/share/applications/bytedance-feishu.desktop"

    grep -q '^StartupWMClass=' "$pkgdir/usr/share/applications/bytedance-feishu.desktop" \
      || echo 'StartupWMClass=feishu' >> "$pkgdir/usr/share/applications/bytedance-feishu.desktop"
  fi

  find "$pkgdir" -type d -exec chmod 755 {} +
}

