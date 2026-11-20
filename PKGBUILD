# Maintainer: chaostone <duantihua@gmail.com>
#
# 上游仓库：https://github.com/beangle/basctl
# AUR 维护目录：~/aur-packages/basctl（本目录）
#
# 发布新版本：上游打 tag（如 v0.0.2）-> 改下面 pkgver -> updpkgsums
# -> makepkg --printsrcinfo > .SRCINFO -> makepkg -s
# -> git add -A && git commit && git push（AUR 只接受 master 分支上的 PKGBUILD/.SRCINFO）。

pkgname=basctl
pkgver=0.0.3
pkgrel=1
pkgdesc="Control-plane CLI and agent for Beangle Bas Server"
arch=('x86_64')
url='https://github.com/beangle/basctl'
license=('GPL-3.0-or-later')
# basctl/basagent 的下载走宿主 curl（namcap 的 "may not be needed" 是误报）；
# basagent 另动态链接 OpenSSL 3 与 zlib。make/start/resolve/run 需要 jstart，
# 但它不在官方仓库中，故只列为 optdepends。
depends=('bash' 'curl' 'logrotate' 'openssl' 'sudo' 'zlib')
makedepends=('ldc' 'dub' 'git')
optdepends=(
  'jstart: make/start/resolve/run'
  'jre-openjdk: run Java container instances'
  'firewalld: basctl firewall'
)
backup=('etc/logrotate.d/bas')
install=basctl.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/beangle/basctl/tar.gz/refs/tags/v${pkgver}"
  "basctl.sysusers"
  "basctl.tmpfiles"
)
sha256sums=('7c19b8b0fee7e46451b50dd1d95d386294e724880506d2df3bc7b0118f895886'
            '5f2b07b290434ed54b959fb0dc38a2b5d240a994184bf1e7753c99c2ce4dcb5c'
            '661d5917c8b3cc94d9988e32f682394373bdc46a291e81a8ab7c78a430fd1f34')

prepare() {
  cd "${pkgname}-${pkgver}"
  dub fetch
}

build() {
  cd "${pkgname}-${pkgver}"
  # FULL RELRO：加载时解析完 GOT 并置为只读。DFLAGS 是 DUB 认可的编译器/链接器
  # 参数入口；上游尚未把该标志写进 dub.json，AUR 包先固定在这里。
  export DFLAGS='-L-z -Lnow'
  dub build -c basctl --build=release-nobounds --compiler=ldc2
  dub build -c basagent --build=release-nobounds --compiler=ldc2

  # versioninfo.d 是发行版本的唯一来源；包版本偏离时不要产出安装包。
  [[ "$(./target/basctl version)" == "basctl $pkgver" ]]
  [[ "$(./target/basagent version)" == "basagent $pkgver" ]]
}

# 单测产物是 target/beangle-basctl-test-unittest，不会覆盖 build() 的两个 release
# 二进制。用例只在临时目录和 127.0.0.1 上运行，chroot 受限时可整段注释。
# DUB 1.42 generated test main conflicts with src/bas/main.d; tests run locally/CI.


package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/basctl "$pkgdir/usr/bin/basctl"
  install -Dm755 target/basagent "$pkgdir/usr/bin/basagent"

  # 控制脚本随 basctl 版本发布，安装包预置到标准 BAS_HOME；basctl init 仍可修复/覆盖。
  local script
  for script in env.sh bas.sh start.sh stop.sh restart.sh; do
    install -Dm755 "resources/bas/bin/$script" "$pkgdir/var/lib/bas/bin/$script"
  done

  install -Dm640 resources/bas/init/basctl.env \
    "$pkgdir/usr/share/bas/basctl.env"
  install -Dm644 resources/systemd/basagent.service \
    "$pkgdir/usr/lib/systemd/system/basagent.service"
  install -Dm644 resources/systemd/basproxy-apply@.service \
    "$pkgdir/usr/lib/systemd/system/basproxy-apply@.service"
  install -Dm755 resources/basproxy/basproxy-apply \
    "$pkgdir/usr/libexec/basproxy-apply"
  install -Dm440 resources/sudoers/basproxy \
    "$pkgdir/etc/sudoers.d/basproxy"
  install -Dm644 resources/logrotate/bas "$pkgdir/etc/logrotate.d/bas"

  install -Dm644 "$srcdir/basctl.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/basctl.conf"
  install -Dm644 "$srcdir/basctl.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/basctl.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
