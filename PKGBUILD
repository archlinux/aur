# Maintainer: kazormia296 <kazormia296@users.noreply.github.com>
#
# Grimodex の Arch Linux バイナリパッケージ。
# GitHub Releases の Electron .deb (ubuntu-24.04 ビルド) を再パッケージする。
# このファイルはテンプレートで、pkgver=@PKGVER@ を CI が実バージョンへ置換する:
#   - release.yml の build-arch ジョブ (ローカルの .deb を使い .pkg.tar.zst を生成)
#   - aur-publish.yml (リリース公開時に AUR の grimodex-bin を更新)
# 詳細は packaging/arch/README.md を参照。

pkgname=grimodex-bin
pkgver=2.0.10
pkgrel=5
pkgdesc="AI-integrated novel writing editor (Electron + React)"
arch=('x86_64')
url="https://github.com/kazormia296/Grimodex"
license=('Elastic-2.0')
# electron-builder 26 の deb 既定dependsを Arch のパッケージ名へ対応させ、
# legacy keyring migration用の libsecret / dbus も明示する。WebKitGTKは不要。
depends=('glibc' 'gcc-libs' 'alsa-lib' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'dbus' 'hicolor-icon-theme')
makedepends=('patchelf')
provides=('grimodex')
conflicts=('grimodex')
# ビルド済みバイナリの再パッケージなので strip / debug 分離はしない
options=('!strip' '!debug')
# Elastic-2.0 は Arch の common license 外なのでライセンス本文の同梱が必須 (namcap E)。
# バージョン付き名で保存し、SRCDEST キャッシュの stale 化を防ぐ。
source=(
  "LICENSE-v${pkgver}::https://raw.githubusercontent.com/kazormia296/Grimodex/v${pkgver}/LICENSE"
  'grimodex-launcher'
  'grimodex-ime-identity.c'
)
source_x86_64=("${url}/releases/download/v${pkgver}/Grimodex-${pkgver}-linux-amd64.deb")
sha256sums=('0e90de829ce8a918b0c934e241c4f68bd49c3d0aef55649b78d6d38a64c87f85' '6600edf3ebf0cb06c8918c68104d899eb0752f3aaf087705fcd48fd15448a4fe' '1e3bd514dda0d448d89fc6d9345dec673bfcc77a454fb68586d51e69703b2e18')
sha256sums_x86_64=('4cf4acaa3cf8381aef86f21c4a856c3536a3692ca23c0fdf2acc41d09c395bda')

build() {
  cc ${CPPFLAGS} ${CFLAGS} -fPIC -shared \
    -Wl,-soname,libgrimodex-ime-identity.so \
    -o libgrimodex-ime-identity.so \
    grimodex-ime-identity.c \
    ${LDFLAGS}
}

package() {
  # makepkg が .deb (ar アーカイブ) を srcdir へ自動展開済み。
  # 中身の data.tar.* (usr/bin, usr/share, opt/Grimodex/resources) を
  # そのまま pkgdir へ展開する。
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
  # Chromiumは起動直後にLD_PRELOADを消去してrendererへ継承しないため、
  # g_get_prgname interposerをElectron ELF自身のDT_NEEDEDへ追加する。
  # 同じ実行ファイルから起動する全subprocessへ確実に適用しつつ、Mozkeyの
  # 厳密なGrimodex-only application scopeは維持する。
  mv "${pkgdir}/opt/Grimodex/grimodex" \
    "${pkgdir}/opt/Grimodex/grimodex-bin"
  install -Dm755 "${srcdir}/libgrimodex-ime-identity.so" \
    "${pkgdir}/opt/Grimodex/libgrimodex-ime-identity.so"
  patchelf --add-needed libgrimodex-ime-identity.so \
    "${pkgdir}/opt/Grimodex/grimodex-bin"
  # Native Waylandのtext-input経路はFcitxへapplication programを渡さない。
  # Arch版はXWayland経由に固定してGTK/Fcitx clientのapp scopeを有効にする。
  install -Dm755 "${srcdir}/grimodex-launcher" \
    "${pkgdir}/opt/Grimodex/grimodex"
  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/Grimodex/grimodex' "${pkgdir}/usr/bin/grimodex"
  sed -i 's#^Exec=.*#Exec=/usr/bin/grimodex %U#' \
    "${pkgdir}/usr/share/applications/grimodex.desktop"
  chmod 0755 "${pkgdir}/opt/Grimodex/chrome-sandbox"
  # .deb内の resources/package-type=deb をElectron updaterに使わせない。
  # Arch/AURはpacman経由で更新し、mainはこのmarkerを見て内蔵更新を無効化する。
  printf 'arch\n' > \
    "${pkgdir}/opt/Grimodex/resources/grimodex-package-channel"
  install -Dm644 "${srcdir}/LICENSE-v${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
