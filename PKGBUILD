# Maintainer: kazormia296 <kazormia296@users.noreply.github.com>
#
# Grimodex の Arch Linux バイナリパッケージ。
# GitHub Releases の Electron .deb (ubuntu-24.04 ビルド) を再パッケージする。
# このファイルはテンプレートで、pkgver=@PKGVER@ を CI が実バージョンへ置換する:
#   - release.yml の build-arch ジョブ (ローカルの .deb を使い .pkg.tar.zst を生成)
#   - aur-publish.yml (リリース公開時に AUR の grimodex-bin を更新)
# 詳細は packaging/arch/README.md を参照。

pkgname=grimodex-bin
pkgver=2.0.8
pkgrel=1
pkgdesc="AI-integrated novel writing editor (Electron + React)"
arch=('x86_64')
url="https://github.com/kazormia296/Grimodex"
license=('Elastic-2.0')
# electron-builder 26 の deb 既定dependsを Arch のパッケージ名へ対応させ、
# legacy keyring migration用の libsecret / dbus も明示する。WebKitGTKは不要。
depends=('glibc' 'gcc-libs' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'dbus' 'hicolor-icon-theme')
provides=('grimodex')
conflicts=('grimodex')
# ビルド済みバイナリの再パッケージなので strip / debug 分離はしない
options=('!strip' '!debug')
# Elastic-2.0 は Arch の common license 外なのでライセンス本文の同梱が必須 (namcap E)。
# バージョン付き名で保存し、SRCDEST キャッシュの stale 化を防ぐ。
source=("LICENSE-v${pkgver}::https://raw.githubusercontent.com/kazormia296/Grimodex/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/Grimodex-${pkgver}-linux-amd64.deb")
sha256sums=('0e90de829ce8a918b0c934e241c4f68bd49c3d0aef55649b78d6d38a64c87f85')
sha256sums_x86_64=('594a725185fd49310ef2e4375e55d801a2195a0cb0b6a5bde06ad1f4b40503b7')

package() {
  # makepkg が .deb (ar アーカイブ) を srcdir へ自動展開済み。
  # 中身の data.tar.* (usr/bin, usr/share, opt/Grimodex/resources) を
  # そのまま pkgdir へ展開する。
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
  # Debian postinst は /usr/bin link と sandbox mode を作るが、再pack時は
  # control archiveを使わないためpayload側で同じ起動契約を明示する。
  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/Grimodex/grimodex' "${pkgdir}/usr/bin/grimodex"
  chmod 0755 "${pkgdir}/opt/Grimodex/chrome-sandbox"
  # .deb内の resources/package-type=deb をElectron updaterに使わせない。
  # Arch/AURはpacman経由で更新し、mainはこのmarkerを見て内蔵更新を無効化する。
  printf 'arch\n' > \
    "${pkgdir}/opt/Grimodex/resources/grimodex-package-channel"
  install -Dm644 "${srcdir}/LICENSE-v${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
