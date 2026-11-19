# Maintainer: VillagerTom <villager-tom at proton dot me>
# Contributor: lyj <lyj404@gmail.com>
pkgname=bettbox-bin
_pkgname=Bettbox
pkgver=1.19.8
pkgrel=3
pkgdesc="Another Better Network Toolbox"
arch=('x86_64' 'aarch64')
url="https://github.com/appshubcc/Bettbox"
license=('GPL-3.0-or-later')
conflicts=(
  'bettbox' 'bettbox-compatible' 'bettbox-compatible-bin'
  'bettbox-compatible-pre' 'bettbox-compatible-pre-bin'
  'bettbox-lite' 'bettbox-lite-bin' 'bettbox-lite-compatible'
  'bettbox-lite-compatible-bin' 'bettbox-lite-compatible-pre'
  'bettbox-lite-compatible-pre-bin' 'bettbox-lite-pre' 'bettbox-lite-pre-bin'
  'bettbox-pre' 'bettbox-pre-bin'
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libayatana-indicator'
  'libkeybinder3'
)
optdepends=('polkit: TUN 模式授权（配合 polkit 规则免密调用 resolvectl）')
options=('!strip' '!debug')
install=bettbox.install
source=("restart-bettbox.hook"
        "bettbox.install")
# Upstream names its debs by Debian architecture (amd64/arm64), which does not
# match the AUR architecture names, so both the cache name and the URL are
# spelled out per architecture. ${arch} cannot be used here: makepkg binds it
# to the *host* architecture while expanding per-arch arrays, so it would give
# both entries the same cache name.
#
# The cache name carries the *full* pkgname: every package in a CI run shares
# one SRCDEST, and makepkg reuses a cached file by name without validating it,
# so a name shared with another package makes updpkgsums hash that other
# package's file and publish its checksum here.
source_x86_64=(
    "${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
)
source_aarch64=(
    "${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb"
)
sha256sums=('25e4c72f27aeecb3499f236b20a1aac26288710e855c8f13bb526cda94b9e287'
            '40d61c873b4a66e936b05df4c2c0f5b014ca9933bfc9578dedc2571325079187')
sha256sums_x86_64=('2c522c41bd7b13a320b6a329fe3c5c56864436d30025b75251fd3cf9723f0b86')
sha256sums_aarch64=('a814e6ef74387d086c66f0b113022e60e8f8fc52ea2e25fd090c2acce2f83808')

prepare() {
  bsdtar -xf "${srcdir}/data."*

  # 安装布局与同系列其他包一致：程序和桌面项都叫 bettbox
  sed -i -e "
    s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
    s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
  " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
  # 应用主体（自 v1.19.5 起上游 desktop 已自带 StartupWMClass）
  install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
  cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* \
    "${pkgdir}/usr/lib/${pkgname%-bin}/"

  # /usr/bin 符号链接
  install -Dm755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"

  # 桌面快捷方式
  install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  # 图标
  for size in 128 256; do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname%-bin}.png"
  done

  # pacman hook: 升级后自动重启 bettbox
  install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

  # TUN 的 DNS 授权规则：自 v1.19.6 起随上游 deb 交付（PR #539 已合入），
  # 规则收窄为仅放行实际用到的 4 个 org.freedesktop.resolve1.* action，
  # 直接从 deb 内取出安装，保证与上游包逐字节一致
  install -Dm644 "${srcdir}/usr/share/polkit-1/rules.d/90-bettbox.rules" \
    "${pkgdir}/usr/share/polkit-1/rules.d/90-bettbox.rules"
}
