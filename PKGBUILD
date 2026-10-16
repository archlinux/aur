# 上游仓库：https://github.com/beangle/setline
# AUR 维护目录：~/aur-packages/setline（本目录）
#
# 发布新版本：上游打 tag（v0.0.4）-> 改下面 pkgver -> makepkg --printsrcinfo > .SRCINFO
# -> git add -A && git commit && git push（AUR 只接受 master 分支上的 PKGBUILD/.SRCINFO）。
#
# 版本号的唯一来源是上游 git tag（dub.json 里没有 version），所以 source 必须钉 #tag=v${pkgver}。

pkgname=setline
pkgver=0.0.4
pkgrel=1
pkgdesc="Beangle local HTTP path router and transparent proxy"
arch=('x86_64')
url='https://github.com/beangle/setline'
license=('GPL-3.0-or-later')
# 二进制在 Arch 上静态链接 druntime/Phobos（ldc 1.42 实测 readelf -d 里既没有
# libphobos2-ldc-shared 也没有 libz），所以不需要 liblphobos/zlib。
# systemd: 安装 unit/timer，且 setline-apply 靠 systemctl reload 生效
# bash:    /usr/lib/setline/setline-apply 的解释器
depends=('bash' 'systemd')
makedepends=('ldc' 'dub' 'git')
optdepends=(
  'haproxy: edge proxy setline-apply can validate and reload'
  'nginx: edge proxy setline-apply can validate and reload'
)
install=setline.install
source=(
  "git+https://github.com/beangle/setline.git#tag=v${pkgver}"
  "setline.install"
  "setline.sysusers"
  "setline.tmpfiles"
)
sha256sums=('SKIP'
            '0ee234408bc442374e5a625cb61729317aefb950411be6b48e63f79fe75d40f0'
            '56e26acdac8b69bb99a05caf720551877cacae5f442f77c6172af5e0771f13be'
            '2c7aa9cbc587e904380b2c409275abab1b370d87de48125003ec13cc5640aa22')

prepare() {
  cd setline
  dub fetch
}

build() {
  cd setline
  dub build --build=release-nobounds --compiler=ldc2
}

# 单测走内建 unittest 配置，产物是 target/beangle-setline-test-unittest，不会覆盖
# build() 产出的 target/setline（因此不必像 jstart 那样先留一份二进制）。用例只在
# 127.0.0.1 上起临时服务，chroot 受限时可整段注释。
check() {
  cd setline
  dub test --compiler=ldc2
}

package() {
  cd setline

  install -Dm755 target/setline "$pkgdir/usr/bin/setline"
  install -Dm755 scripts/package/setline-apply "$pkgdir/usr/lib/setline/setline-apply"

  # /etc/setline/setline.json 由 setline.install 首次生成、不由包跟踪（理由见该文件），
  # 包里只放模板和两份示例。
  install -Dm644 scripts/package/setline.json "$pkgdir/usr/share/setline/setline.json.default"
  install -Dm644 scripts/package/apply.conf.example "$pkgdir/usr/share/setline/apply.conf.example"
  install -Dm644 scripts/package/haproxy-setline-cfgdir.conf.example "$pkgdir/usr/share/setline/haproxy-setline-cfgdir.conf.example"

  # 文档整目录安装：unit 的 Documentation= 指向 deployment.md/agent-reload.md 等，
  # 只装其中几篇会留下打不开的死链接。
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/setline/CHANGELOG.md"
  local doc
  for doc in docs/*.md; do
    install -Dm644 "$doc" "$pkgdir/usr/share/doc/setline/${doc#docs/}"
  done

  install -Dm644 scripts/package/setline.service "$pkgdir/usr/lib/systemd/system/setline.service"
  install -Dm644 scripts/package/setline-render.service "$pkgdir/usr/lib/systemd/system/setline-render.service"
  install -Dm644 scripts/package/setline-render.timer "$pkgdir/usr/lib/systemd/system/setline-render.timer"
  install -Dm644 scripts/package/setline-apply.service "$pkgdir/usr/lib/systemd/system/setline-apply.service"
  install -Dm644 scripts/package/setline-apply.timer "$pkgdir/usr/lib/systemd/system/setline-apply.timer"

  install -Dm644 "$srcdir/setline.sysusers" "$pkgdir/usr/lib/sysusers.d/setline.conf"
  install -Dm644 "$srcdir/setline.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/setline.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
