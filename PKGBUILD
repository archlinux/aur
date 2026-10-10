# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-shell
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop shell for Niri with bars, panels and settings"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-shell"
license=('BSD-3-Clause' 'GPL-3.0-only' 'MIT' 'Apache-2.0' 'Unicode-3.0')
depends=('niri' 'systemd' 'inter-font' 'sysc-clipboard' 'sysc-notify' 'sysc-tray' 'sysc-lock')
optdepends=('sysc-terminal: live terminal-art wallpapers' 'sysc-plugins-git: official plugins' 'gslapper: video wallpapers' 'swaybg: static wallpapers' 'matugen: wallpaper-derived colors' 'wl-clipboard: plugin clipboard access' 'wireplumber: volume controls' 'networkmanager: network controls' 'bluez: Bluetooth controls' 'git: install plugins from source catalogs')
makedepends=('go>=1.26.4')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-shell/archive/refs/tags/v${pkgver}.tar.gz"
  'config.example.json'
  'first-run.md'
  'niri-bindings.kdl')
sha256sums=('222a12444b405fe67adf8cc9ec8d855dbc6aade14e0847319ad9ed65a3b0cef1' '57389e844b9d71c50f6bc9907042fab411f3152b17b4161ad7ad48438fd62724' '325af3045e0781c5c71affef3024fafbb7c2a6d32a52d4c74dcb0d9f112fa8b9' 'cb1fbdb2f11eceaaa73fd7ce5a6a0866554e1d87014170290be58b8c97b9e09b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOTOOLCHAIN=local
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_ENABLED=0
  go build -buildvcs=false -o "${pkgname}" "./cmd/${pkgname}"
  go build -buildvcs=false -o sysc-plugin-weather ./cmd/sysc-plugin-weather
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 packaging/systemd/sysc-shell.service "${pkgdir}/usr/lib/systemd/user/sysc-shell.service"
  sed -i 's|%h/.local/bin/|/usr/bin/|g' "${pkgdir}/usr/lib/systemd/user/sysc-shell.service"
  sed -i '/After=graphical-session.target/a Wants=sysc-notify.service sysc-tray.service sysc-clipboard.service sysc-lock-session.service\nAfter=sysc-notify.service sysc-tray.service sysc-clipboard.service sysc-lock-session.service' "${pkgdir}/usr/lib/systemd/user/sysc-shell.service"
  # Seed only a missing user config; systemd runs these commands as the session user.
  sed -i '/Type=simple/a ExecStartPre=/usr/bin/mkdir -p %E/sysc-shell\nExecStartPre=/usr/bin/cp --update=none /usr/share/doc/sysc-shell/config.example.json %E/sysc-shell/config.json' "${pkgdir}/usr/lib/systemd/user/sysc-shell.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 internal/emoji/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNICODE"
  install -Dm644 internal/render/icons/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/icons-MIT"
  install -Dm644 internal/render/icons/material/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/material-Apache-2.0"
  install -Dm644 "$(go list -m -f '{{.Dir}}' github.com/Nomadcxx/sysc-launch)/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/sysc-launch-GPL-3.0"
  install -Dm644 plugins/reference/weather/manifest.json "${pkgdir}/usr/share/sysc-shell/plugins/org.sysc.weather/manifest.json"
  install -Dm755 sysc-plugin-weather "${pkgdir}/usr/share/sysc-shell/plugins/org.sysc.weather/bin/sysc-plugin-weather"
  install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
  install -Dm644 "${srcdir}/first-run.md" "${pkgdir}/usr/share/doc/${pkgname}/first-run.md"
  install -Dm644 "${srcdir}/niri-bindings.kdl" "${pkgdir}/usr/share/doc/${pkgname}/niri-bindings.kdl"
}
