# Maintainer: Emiya173 <emiyazero173@gmail.com>
#
# AUR 包:luvtter-desktop-git
# 从 GitHub HEAD 拉源码,本机用 Gradle 跑 :composeApp:createDistributable 自构。
# 适合追新 / 验证开发版。
#
# pkgver() 从 git 描述生成形如 0.1.0.r5.gabcdef0 的滚动版本(最近 tag.r提交数.g短SHA)。
# 没有 tag 时回退成 r<count>.g<sha>,符合 AUR -git 包惯例。
#
# 注意:Gradle 首次构建会下载所有依赖,需要数分钟 + 良好网络。
# 输出在 composeApp/build/compose/binaries/main/app/letter-app/,布局同 -bin 包。

pkgname=luvtter-desktop-git
_pkgname=luvtter-desktop
pkgver=0.0.1b.r0.g4c0082f
pkgrel=1
pkgdesc="Luvtter — slow-mail letter writing client (Compose Desktop, built from git HEAD)"
arch=('x86_64')
url="https://github.com/Emiya173/luvtter"
license=('MIT')
depends=(
  'fontconfig'
  'freetype2'
  'libxrender'
  'libxtst'
  'libxi'
)
makedepends=(
  'git'
  'jdk17-openjdk'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'luvtter-desktop-bin')
options=(!strip !debug)
source=("$_pkgname::git+${url}.git"
        "luvtter-desktop.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # 形如 vX.Y.Z-N-gSHA → X.Y.Z.rN.gSHA(去 v 前缀,把第一个 - 换成 .r,第二个换成 .)
  # 无 tag 时回退成 r<count>.g<sha>。set -o pipefail 让 git 失败能被 || 捕获。
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
  ) || printf "r%s.g%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  # Gradle wrapper 已入库,直接用;关 daemon 避免 makepkg 退出后留进程
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  export GRADLE_OPTS="-Dorg.gradle.daemon=false -Dorg.gradle.workers.max=2"

  ./gradlew :composeApp:createDistributable --no-daemon --stacktrace
}

package() {
  cd "$srcdir/$_pkgname"

  local app_dir="composeApp/build/compose/binaries/main/app/letter-app"
  if [[ ! -d "$app_dir" ]]; then
    echo "::error:: createDistributable output not found at $app_dir"
    exit 1
  fi

  install -d "$pkgdir/opt/luvtter-desktop"
  cp -a "$app_dir/." "$pkgdir/opt/luvtter-desktop/"

  install -d "$pkgdir/usr/bin"
  ln -sf /opt/luvtter-desktop/bin/letter-app "$pkgdir/usr/bin/luvtter-desktop"

  install -Dm644 "$srcdir/luvtter-desktop.desktop" \
    "$pkgdir/usr/share/applications/luvtter-desktop.desktop"
}
