# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=flutter-git
pkgver=3.50.0.0.1.pre.r92145.6597889f57b
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${pkgname%-git}.io"
license=("custom" "BSD" "CCPL")
depends=("git" "glu" "java-environment" "libglvnd" "unzip")
optdepends=("android-sdk" "android-studio" "dart" "intellij-idea-community-edition" "intellij-idea-ultimate-edition" "perl" "python")
makedepends=("python")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("opt/${pkgname%-git}/packages/${pkgname%-git}_test/pubspec.yaml" "opt/${pkgname%-git}/packages/${pkgname%-git}/pubspec.yaml")
options=("!emptydirs")
install="${pkgname%-git}.install"
source=(
  "${pkgname%-git}::git+https://github.com/${pkgname%-git}/${pkgname%-git}"
  "${pkgname%-git}.sh"
  "${pkgname%-git}.csh"
)
sha256sums=('SKIP'
            '1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a'
            '7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f')

pkgver() {
  # ⚠️ 這顆原本的 `git describe --long --tags` 演算法註定卡死，不是「沒跟版」：
  #    flutter 的 release tag 打在 flutter-<ver>-candidate.N 那類分支上，master
  #    碰不到，describe 沿祖先只能退到 2024 年的 3.33.0-0.0.pre。實測同一個
  #    blobless clone 裡並排：
  #      git describe --long --tags  ->  3.33.0-0.0.pre-8027-g9cba7392c6
  #      倉內最新版本 tag            ->  3.50.0-0.1.pre
  #    所以 r 數字一直漲、前綴永久凍在 3.33。
  # 改法：取「倉內最高版本 tag」當基版號（不看可達性）＋ 自 root 的 commit 數當 r
  #    ＋ HEAD 短 hash。commit 數單調遞增；上游發新 tag 時基版號自己跳上去。
  #    pkgver 不許連字號，所以 tag 的 '-' 一律換成 '.'。
  cd "${srcdir}/${pkgname%-git}" || return 1
  local newest count hash
  newest=$(git tag --list '[0-9]*' --sort=-version:refname | head -n1)
  [ -n "$newest" ] || { echo "找不到數字版本 tag" >&2; return 1; }
  count=$(git rev-list --count HEAD) || return 1
  hash=$(git rev-parse --short=11 HEAD) || return 1
  printf '%s.r%s.%s\n' "${newest//-/.}" "$count" "$hash"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  "${srcdir}/${pkgname%-git}/bin/${pkgname%-git}" doctor
}

package() {
  rm -rf "${srcdir}/${pkgname%-git}/bin/cache" "${srcdir}/${pkgname%-git}/.pub-cache"
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/etc/profile.d/${pkgname%-git}.sh"
  install -Dm755 "${srcdir}/${pkgname%-git}.csh" "${pkgdir}/etc/profile.d/${pkgname%-git}.csh"
  install -dm755 "${pkgdir}/opt/${pkgname%-git}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${pkgname%-git}" "${pkgdir}/opt/"
  find "${pkgdir}/opt/${pkgname%-git}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${pkgname%-git}" -type f -exec chmod a+r {} +
  ln -s "/opt/${pkgname%-git}/bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
