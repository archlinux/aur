# Maintainer: 空必聪 <dba_aywdiw@163.com>
# Contributor: Yao0454 (original author)
# PKGBUILD for feng_calendar - AI-powered schedule & todo assistant
# Upstream: https://github.com/Yao0454/feng_calendar

pkgname=feng_calendar-git
pkgver=1.0.1.r0.gecb401f
pkgrel=2
options=('!debug')
pkgdesc="枫枫子的备忘录 - AI-powered schedule/todo extraction app with chat planning, user profiling, and arXiv daily reports (git version)"
arch=('x86_64')
url="https://github.com/Yao0454/feng_calendar"
license=('custom:unknown')
depends=(
    'gtk3'
    'libgl'
)
makedepends=(
    'flutter'
    'clang'
    'cmake'
    'ninja'
    'pkg-config'
)
optdepends=(
    'python-fastapi: run local backend server'
    'ollama: run local AI model for extraction'
)
provides=("${pkgname%-git}" 'feng_calendar')
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/Yao0454/feng_calendar.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags 2>/dev/null | sed 's/^v//; s/\([^-]*\)-\([^-]*\)-\(.*\)/\1.r\2.\3/' || \
    printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  # Enable Linux desktop (no analytics overlay)
  flutter config --enable-linux-desktop --no-analytics 2>/dev/null

  # Flutter pub get
  flutter pub get

  # Build release
  flutter build linux --release
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install bundled app
  local bundle_dir="${pkgdir}/usr/lib/feng_calendar"
  mkdir -p "${bundle_dir}"
  cp -r build/linux/x64/release/bundle/* "${bundle_dir}/"

  # Binary symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/feng_calendar/feng_calendar" "${pkgdir}/usr/bin/feng_calendar"

  # Icon
  install -Dm644 assets/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/feng_calendar.png"

  # Desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/feng_calendar.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=枫枫子的备忘录
Name[en]=Feng Calendar
Comment=从文字、截图、文件中自动提取日程和待办事项
Comment[en]=Extract schedules and todos from text, images, and files with AI
Exec=feng_calendar
Icon=feng_calendar
Categories=Office;Utility;
Terminal=false
StartupWMClass=feng_calendar
EOF
}
