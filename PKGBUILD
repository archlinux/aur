# Maintainer: Chartic <contact@ch45.c01.kr>
pkgname=modlist-org-app
pkgver=0.4.7
pkgrel=3
pkgdesc="Mod manager and installer for A Dance of Fire and Ice (ADOFAI) and other games"
arch=('x86_64')
url="https://github.com/modlist-org/modlist_org_app"
license=('GPL-3.0-only')
depends=('gtk3' 'glib2')
makedepends=('flutter' 'git' 'cmake' 'ninja' 'clang' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/modlist-org/modlist_org_app/archive/refs/tags/v${pkgver}.tar.gz"
        "modlist-org-app.desktop")
sha256sums=('90297bf0b7e995c44d142a48756a95f78d8ff7022d4b3a763ff31236fde1b290'
            '82402151c4037ddfdeb7827efef0215335b4b5268e90b967c3620a6960ee2238')

build() {
  cd "modlist_org_app-${pkgver}"
  flutter config --enable-linux-desktop
  flutter pub get
  flutter build linux --release
}

package() {
  cd "modlist_org_app-${pkgver}"

  # 실행 파일 및 번들 자원 설치
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}/"

  # /usr/bin 심볼릭 링크 생성
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/modlist_org_app" "${pkgdir}/usr/bin/modlist-org-app"

  # .desktop 파일 설치
  install -Dm644 "${srcdir}/modlist-org-app.desktop" "${pkgdir}/usr/share/applications/modlist-org-app.desktop"

  # 아이콘 파일 설치 (Flutter 기본 아이콘 위치 탐색)
  if [ -f "linux/runner/resources/app_icon.png" ]; then
    install -Dm644 "linux/runner/resources/app_icon.png" "${pkgdir}/usr/share/pixmaps/modlist-org-app.png"
  elif [ -f "assets/icon.png" ]; then
    install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/pixmaps/modlist-org-app.png"
  fi
}
