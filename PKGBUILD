# Maintainer: tsaitang404 <tsaitang404@users.noreply.github.com>
# Contributor: Based on AUR caddy-trojan

pkgname=caddy-trojan
pkgver=2.11.4
pkgrel=1
pkgdesc='Fast web server with automatic HTTPS and trojan proxy support'
arch=('x86_64' 'aarch64')
url='https://caddyserver.com'
license=('Apache-2.0' 'GPL-3.0-only')
depends=('glibc')
makedepends=('go' 'xcaddy')
provides=("caddy=${pkgver}")
conflicts=('caddy' 'caddy-naiveproxy-trojan' 'caddy-trojan-imgk')
backup=('etc/caddy/Caddyfile')
source=("caddy-trojan.service"
        "caddy.hook"
        "Caddyfile::https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/config/Caddyfile"
        "index.html::https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/welcome/index.html"
        "caddy-api.service::https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/init/caddy-api.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

check() {
  "${srcdir}/caddy" version > /dev/null 2>&1
}

build() {
  cd "${srcdir}"
  xcaddy build "v${pkgver}" \
    --with github.com/imgk/caddy-trojan@latest

# 如需固定版本可改为 @v0.2.11-4
}

package() {
  # 主二进制
  install -Dm755 "${srcdir}/caddy" "${pkgdir}/usr/bin/caddy"

  # Shell 补全
  "${srcdir}/caddy" completion zsh > _caddy 2>/dev/null || true
  "${srcdir}/caddy" completion bash > caddy.bash 2>/dev/null || true
  "${srcdir}/caddy" completion fish > caddy.fish 2>/dev/null || true

  install -Dm644 _caddy "${pkgdir}/usr/share/zsh/site-functions/_caddy" 2>/dev/null || true
  install -Dm644 caddy.bash "${pkgdir}/usr/share/bash-completion/completions/caddy" 2>/dev/null || true
  install -Dm644 caddy.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d" 2>/dev/null || true

  # 默认配置和欢迎页
  install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/etc/caddy/Caddyfile"
  install -Dm644 "${srcdir}/index.html" "${pkgdir}/usr/share/caddy/index.html"

  # systemd 服务
  install -Dm644 "${srcdir}/caddy-trojan.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
  install -Dm644 "${srcdir}/caddy-api.service" "${pkgdir}/usr/lib/systemd/system/caddy-api.service"

  #（无需 sysusers/tmpfiles，服务以 root 运行）

  # ALPM hook：更新后重启服务
  install -Dm644 "${srcdir}/caddy.hook" "${pkgdir}/usr/share/libalpm/hooks/caddy.hook"

  # License
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<- EOF
		This package includes:
		- Caddy (Apache 2.0): https://github.com/caddyserver/caddy
		- caddy-trojan (GPL 3.0): https://github.com/imgk/caddy-trojan
		See /usr/share/licenses/${pkgname}/ for details.
		EOF
}
