# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=gplay-apk-downloader-cli-git
pkgver=r287.5ab3c6ee
pkgrel=2
pkgdesc='CLI tool to download APKs from Google Play Store with split APK merging and ADB install'
arch=('any')
url='https://github.com/alltechdev/gplay-apk-downloader'
license=('GPL-3.0-only')
depends=(
  'python'
  'python-cloudscraper'
  'python-gpapi'
  'python-requests'
)
makedepends=('git')
optdepends=(
  'apkeditor: split APK merging (supplies APKEditor.jar; pulls in a Java runtime)'
  'android-sdk-build-tools: sign merged APKs (apksigner) + parse APK split metadata (aapt)'
  'android-tools: install APKs to device via ADB'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/alltechdev/gplay-apk-downloader.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  local _instdir="$pkgdir/usr/share/${pkgname%-cli-git}"

  install -Dm644 gplay-downloader.py "$_instdir/gplay-downloader.py"
  install -Dm644 device_profiles.py "$_instdir/device_profiles.py"
  install -Dm644 axml_patcher.py "$_instdir/axml_patcher.py"
  install -Dm644 profiles/*.properties -t "$_instdir/profiles/"

  # The optional split-merge feature shells out to `java -jar <this>/APKEditor.jar`.
  # Instead of vendoring upstream's committed prebuilt jar, point at the system
  # copy from the `apkeditor` package. The tool guards with a .exists() check, so
  # this symlink dangles harmlessly when that optdepend is absent.
  ln -s /usr/share/java/apkeditor/APKEditor.jar "$_instdir/APKEditor.jar"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/gplay" <<'WRAPPER'
#!/bin/sh
exec python3 /usr/share/gplay-apk-downloader/gplay-downloader.py "$@"
WRAPPER
}
