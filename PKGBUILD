# Maintainer: qie2035 <qie2035@users.noreply.github.com>
#
# 这是一个「补丁包」：不重打包 dwproton，只把 suluoMISS 构建的两个打补丁
# Wine Unix 驱动覆盖到已安装的 dwproton 里。
#   - 装完即生效（.install 的 post_install 自动应用）
#   - 卸载即还原（.install 的 pre_remove 自动还原）
#   - dwproton-bin 升级后自动重新应用（alpm hook）
#
# 为什么不直接把 .so 装进 dwproton 的目录：那些文件属于 dwproton-bin，
# pacman 会以「exists in filesystem (owned by dwproton-bin)」拒绝安装。
# 所以补丁二进制装在自己的目录，由脚本事后覆盖。

pkgname=dwproton-azur-patch
pkgver=11.0_17
pkgrel=1
pkgdesc='Wine driver overlay for dwproton: lets Azur Promilia mj_sdk (Qt/CEF) windows render and take input under Wine'
arch=('x86_64')
url='https://github.com/suluoMISS/dwproton-11.0-17-azur'
license=('LGPL-2.1-or-later')
depends=('bash' 'dwproton-bin')
install=dwproton-azur-patch.install
options=(!strip !lto)
_commit=47606b94e89b04f6a1fc770612410dc55bab2232
_base="https://raw.githubusercontent.com/suluoMISS/dwproton-11.0-17-azur/${_commit}"
source=(
  "win32u.so::${_base}/dist/win32u.so"
  "winex11.so::${_base}/dist/winex11.so"
  "UPSTREAM-README.txt::${_base}/dist/README.txt"
  "LICENSE::${_base}/LICENSE"
  'dwproton-azur-patch-apply'
  'dwproton-azur-patch-revert'
  '90-dwproton-azur-patch.hook'
)
sha256sums=('35a191d9a244b511612eb5ef9535cee38fbdef8cfa66713b2adeae775954d22d'
            'eed519b1a76748f747fcae2f567c5bbd8cd9ae4300b92a2f7acefcfac5dd6ecc'
            'a04204e9514019b3576f5d675323fcfc1a4e443fa5de419e74a555e4b549a5a9'
            'e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c'
            '80f6c32534f04e3761f5e90a6ce0a062c381cb0ff6955bc4350babf4e6a5ed62'
            'c9c85de890d9f2abaf4ebec067543858e41e8dad1bcf70aa9b73d897688ef985'
            '4fdbaeb556f172f0284cebf0778f19d3c11baea4bbfa6f1b13368990e9d67d32')
noextract=()

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 win32u.so winex11.so -t "$pkgdir/usr/share/$pkgname/"
  install -m644 UPSTREAM-README.txt -T "$pkgdir/usr/share/$pkgname/UPSTREAM-README.txt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 dwproton-azur-patch-apply "$pkgdir/usr/lib/$pkgname/apply"
  install -Dm755 dwproton-azur-patch-revert "$pkgdir/usr/lib/$pkgname/revert"
  install -Dm644 90-dwproton-azur-patch.hook \
    "$pkgdir/usr/share/libalpm/hooks/90-dwproton-azur-patch.hook"
}
