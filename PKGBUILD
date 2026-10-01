# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
#
# 预构建包:直接取 ffyfox/dsh-desktop-linux 的 Linux 产物(deb)重新封装,本包不构建任何东西。
# 上游 deepseek-ai/deepseek-harness 只发布 macOS/Windows 桌面版(apps/desktop/README.md:232
# 写明 "Linux is not a supported Desktop release target"),Linux 产物由该项目打补丁构建后发布。
#
# 选 deb 而非同时提供的 AppImage/rpm:AppImage 需要 FUSE 或自解压才能使用,且 electron-builder
# 在同时请求 deb 与 AppImage 时会遍历两遍根目录,导致 AppImage 的 usr/bin 步骤被丢掉;rpm 带
# JVM 专用的 LZMA 过滤,需要 rpm 特有的处理。deb 是普通的 ar 归档,载荷固定,也是三者中唯一能
# 查看自身元数据与维护者脚本的一份。
#
# 载荷里只有两个文件写着产物自己的安装前缀(.desktop 与 AppArmor profile),按原样安装、只改写
# 这一处字面路径;其余文件原封不动使用。
#
# 载荷自带 Electron 44.4.5、Node 24.21.0、CPython 3.12.14、Office Python wheels 与 pnpm,
# 运行时除下列共享库外不需要系统提供任何东西。Electron 的 Fuses 已禁用 NODE_OPTIONS 与
# ELECTRON_RUN_AS_NODE。

pkgname=dsh-desktop-linux-bin
pkgver=0.2.0rc.2
pkgrel=1
pkgdesc='Official DeepSeek Harness desktop packaging ported to Linux (prebuilt)'
arch=('x86_64')
url='https://github.com/ffyfox/dsh-desktop-linux'
license=('MIT')
# 解释器与共享库。产物在 GitHub 的 ubuntu-latest 上从上游源码树构建,其 deb control 列的是同一
# 组依赖的 Debian 名(libgtk-3-0、libnotify4、libnss3、libxss1、libxtst6、xdg-utils、
# libatspi2.0-0、libuuid1、libsecret-1-0)。alsa-lib 与 dbus 由 Debian 的传递闭包带进来,这里是
# 直接的 ldd 命中。util-linux-libs 提供 libblkid/libmount。libxcrypt-compat 提供 libcrypt.so.1,
# 捆绑 CPython 的 _crypt 模块仍然链接它。libdbusmenu-glib 是 dlopen 而非 NEEDED:缺了它托盘图标
# 还在、右键菜单是空的,即没有退出入口。
depends=('glibc' 'gtk3' 'alsa-lib' 'at-spi2-core' 'dbus' 'libdbusmenu-glib' 'libnotify'
         'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils'
         'libxcrypt-compat')
# 目录选择器在运行时查找原生对话框助手,两者都没装时回落到 Electron 自带对话框。
optdepends=('zenity: native directory dialogs on GTK desktops'
            'kdialog: native directory dialogs on Plasma')
# 与本包同上游桌面端的 deepseek-harness-desktop 会装同样的两个与包名无关的路径
# (/usr/bin/deepseek-harness 与 hicolor 的 deepseek-harness.svg),pacman 遇到已被其他包占用的
# 文件会直接拒装,声明冲突让它先提示。
conflicts=('deepseek-harness-desktop')
# 预构建载荷:不能 strip(Electron 自身的文件无法重新打包),1.1 GiB 的自带运行时也不需要 debug 包。
options=('!strip' '!debug' '!emptydirs')
install="$pkgname.install"

_debrel=v0.2.0rc2
_debname=deepseek-harness-0.2.0-rc.2-linux-amd64-unsigned.deb
# 产物自身的安装前缀,以及本包的安装前缀。
_artprefix="/opt/DeepSeek Harness"
_pkgprefix="/opt/$pkgname"

source=("$pkgname-$pkgver.tar.gz::https://github.com/ffyfox/dsh-desktop-linux/releases/download/$_debrel/$_debname"
        'LICENSE')
sha256sums=('d3f3c51855ad41c9ebeee754ebdb2a80f23282aba4b08b17956dbfc774dcaab0'
            'ebb4f09972aee8608be255debaf78451a68e95c290f55c240dec2ecfa16ea6be')

package() {
  cd "$srcdir"

  # makepkg 的 libalpm 读取器是 bsdtar,它遍历 ar 归档并把成员放到 $srcdir,所以 data.tar.xz
  # 已经在这里。只解它:载荷才是要安装的内容;control.tar.xz 是产物自己的 Debian 元数据,本包
  # 不复用(它的 .desktop 与 AppArmor profile 在下面处理,postinst 逻辑落在 .install 文件里)。
  bsdtar -xf data.tar.xz

  install -d "$pkgdir$_pkgprefix"
  cp -a "opt/DeepSeek Harness/." "$pkgdir$_pkgprefix/"

  install -d "$pkgdir/usr/bin"
  ln -s "$_pkgprefix/deepseek-harness" "$pkgdir/usr/bin/deepseek-harness"

  # 载荷里写着安装前缀的两个文件,按原样取出并改写该字面路径。从零生成会在上游下次改动入口或
  # AppArmor profile 时产生偏差。
  sed -i "s|$_artprefix|$_pkgprefix|g" "$pkgdir$_pkgprefix/resources/apparmor-profile"
  install -Dm644 "$pkgdir$_pkgprefix/resources/apparmor-profile" \
    "$pkgdir/etc/apparmor.d/deepseek-harness"
  rm -f "$pkgdir$_pkgprefix/resources/apparmor-profile"

  sed -i "s|$_artprefix|$_pkgprefix|g" "usr/share/applications/deepseek-harness.desktop"
  install -Dm644 "usr/share/applications/deepseek-harness.desktop" \
    "$pkgdir/usr/share/applications/deepseek-harness.desktop"

  install -Dm644 "usr/share/icons/hicolor/scalable/apps/deepseek-harness.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/deepseek-harness.svg"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod 0755 "$pkgdir$_pkgprefix/chrome-sandbox"
}
