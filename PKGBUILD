# Maintainer: jiangjie <kero_jiang at 126 dot com>

pkgname=workdaddy-bin
pkgver=1.2.22
pkgrel=6
pkgdesc='WorkBuddy desktop enhancement assistant (WorkDaddy, official Linux DEB repack)'
arch=('x86_64' 'aarch64')
url='https://github.com/babygoton/WorkDaddy'
license=('AGPL-3.0-or-later')
depends=('bash' 'ca-certificates' 'curl' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'procps-ng' 'util-linux' 'xdg-utils')
optdepends=('workbuddy: WorkBuddy desktop client enhanced by WorkDaddy'
            'workbuddy-agent: alternative WorkBuddy client; conflicts with workbuddy, install either one'
            'zenity: graphical launcher dialogs (channel menu, restart confirmation, wallpaper folder picker)')
provides=('workdaddy')
conflicts=('workdaddy')
options=('!strip' '!debug')
_dl='https://github.com/babygoton/WorkDaddy/releases/download'
source=('LICENSE.upstream')
source_x86_64=("WorkDaddy_${pkgver}_amd64.deb::${_dl}/${pkgver}/WorkDaddy_${pkgver}_amd64.deb")
source_aarch64=("WorkDaddy_${pkgver}_arm64.deb::${_dl}/${pkgver}/WorkDaddy_${pkgver}_arm64.deb")
sha256sums=('5e28b0607630f125776a775a76e4c96453d593451a0c65be832ef1282b89c4b5')
sha256sums_x86_64=('5b2fe8a44ce5ca1bd869bd1e27701f0a89f951719b0e29d80d826f5918b7b39c')
sha256sums_aarch64=('adb63b440c29d23dfc36c453ece6477735c3a4efcbc428e21bd8e5831c211428')

package() {
  case "$CARCH" in
    x86_64)  _deb="WorkDaddy_${pkgver}_amd64.deb" ;;
    aarch64) _deb="WorkDaddy_${pkgver}_arm64.deb" ;;
  esac

  # Official .deb is an ar archive with only ./control in control.tar.xz,
  # i.e. no maintainer scripts to emulate. Extract the payload verbatim.
  bsdtar -xf "$srcdir/$_deb" -C "$srcdir" data.tar.xz
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  # Two small in-tree tweaks, applied with sed only (no `patch` executable /
  # base-devel dependency, no extra source files to verify).
  #
  # 1) Default icon: upstream install-desktop-linux.sh falls back to the icon
  #    name "workbuddy" (WorkBuddy's own icon). Point it at "workdaddy" so the
  #    launcher shows WorkDaddy's own artwork, matching the system .desktop.
  #    Step 3 below installs that name into indexed hicolor directories.
  local _launcher="$pkgdir/opt/workdaddy/scripts/install-desktop-linux.sh"
  sed -i \
    -e 's|# 图标：优先用自带 PNG；缺失时退回系统已有的 workbuddy 图标名|# 图标：优先用自带 PNG；缺失时退回系统 hicolor 中的 workdaddy 图标（由官方 DEB 提供）|' \
    -e 's|ICON_VALUE="workbuddy"|ICON_VALUE="workdaddy"|' \
    "$_launcher"

  # 2) Exit guard: upstream daemon is started with setsid nohup and keeps
  #    running after WorkBuddy exits. Insert a guard next to the existing
  #    startClientRunningMonitor() call that reuses clientRunningState.
  local _snippet="$srcdir/workdaddy-exit-guard.snippet"
  cat > "$_snippet" << 'GUARD'
// [AUR tweak: exit-guard] WorkBuddy 退出后 daemon 完全退出。
// 复用 clientRunningState（由 startClientRunningMonitor 周期探测 WorkBuddy 进程）：
//   - 宽限期内不判定：给「先启动后台服务、稍后打开应用」与官方自动更新器的
//     自行重启留出时间，避免把正常启动窗口误判为退出
//   - 连续 EXIT_GUARD_CONFIRM 次 false 才退出，单次误报不会触发
//   - value=null（探测失败/未就绪）不计数；value=true 立即清零
//   - 退出走 SIGTERM，复用下方统一的清理流程（unwatchFile / 释放锁）
// 环境变量：WORKDADDY_EXIT_GUARD=0 关闭守卫；
//   WORKDADDY_EXIT_GUARD_GRACE_MS / WORKDADDY_EXIT_GUARD_INTERVAL_MS 调整阈值。
if (process.env.WORKDADDY_EXIT_GUARD !== '0') {
  const EXIT_GUARD_GRACE_MS = Number(process.env.WORKDADDY_EXIT_GUARD_GRACE_MS) || 300000;
  const EXIT_GUARD_INTERVAL_MS = Number(process.env.WORKDADDY_EXIT_GUARD_INTERVAL_MS) || 15000;
  const EXIT_GUARD_CONFIRM = 4;
  const EXIT_GUARD_STALE_MS = EXIT_GUARD_INTERVAL_MS * 4;
  const exitGuardStartedAt = Date.now();
  let exitGuardMisses = 0;
  const exitGuardTimer = setInterval(() => {
    const { value, checkedAt } = clientRunningState;
    if (value === true) { exitGuardMisses = 0; return; }
    if (value !== false) return; // null = 未知（探测失败/未就绪），不判定
    if (Date.now() - checkedAt > EXIT_GUARD_STALE_MS) return; // 探测数据过旧，不判定
    if (Date.now() - exitGuardStartedAt < EXIT_GUARD_GRACE_MS) return; // 宽限期内不判定
    exitGuardMisses += 1;
    if (exitGuardMisses >= EXIT_GUARD_CONFIRM) {
      log(`[exit-guard] WorkBuddy 已退出（连续 ${EXIT_GUARD_CONFIRM} 次探测确认），WorkDaddy 守护进程随之退出`);
      try { process.kill(process.pid, 'SIGTERM'); } catch (_) { process.exit(0); }
    }
  }, EXIT_GUARD_INTERVAL_MS);
  if (exitGuardTimer && typeof exitGuardTimer.unref === 'function') exitGuardTimer.unref();
}
GUARD
  sed -i -e "/^startClientRunningMonitor();$/r $_snippet" \
    "$pkgdir/opt/workdaddy/scripts/daemon.js"

  # 3) Make the "workdaddy" icon name actually resolvable. The official DEB
  #    ships ONLY 1024x1024/apps/workdaddy.png, but hicolor's index.theme does
  #    not declare a 1024x1024 directory (it ends at 512x512 + scalable), so
  #    Icon=workdaddy resolves to nothing on KDE/Gtk. Reuse the artwork already
  #    inside the payload in indexed locations -- pure file copies, no image
  #    tooling and no new makedepends.
  install -Dm644 "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/workdaddy.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/workdaddy.png"
  install -Dm644 "$pkgdir/opt/workdaddy/scripts/assets/workdaddy-app-icon-source.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/workdaddy.svg"

  install -Dm644 "$srcdir/LICENSE.upstream" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
