# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=gplay-apk-downloader-cli
pkgver=r288.6f189c10
pkgrel=1
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
optdepends=(
  'apkeditor: split APK merging (supplies APKEditor.jar; pulls in a Java runtime)'
  'android-sdk-build-tools: sign merged APKs (apksigner) + parse APK split metadata (aapt)'
  'android-tools: install APKs to device via ADB'
)
conflicts=('gplay-apk-downloader-cli-git')
# Upstream cuts no real releases (its sole tag is a takedown catalog snapshot), so we pin
# to a commit and fetch the GitHub archive tarball (~7 MB) instead of cloning the multi-GB
# history a git+ source would force. latestver() reproduces the same r<count>.<short-sha>
# scheme via the GitHub API, so autoupdate works exactly as the -git variant did.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver#*.}.tar.gz")
sha256sums=('4d21d18c511ddd63555f4189aa2b62d035bd21ee429640f398e5358c24ef4814')

latestver() {
  local repo=alltechdev/gplay-apk-downloader sha count
  sha=$(gh api "repos/${repo}/commits/main" --jq '.sha[0:8]')
  count=$(gh api "repos/${repo}/commits?sha=main&per_page=1" -i 2>/dev/null \
          | grep -i '^link:' | grep -oE 'page=[0-9]+>; rel="last"' | grep -oE '[0-9]+')
  printf 'r%s.%s' "$count" "$sha"
}

package() {
  cd "$srcdir"/gplay-apk-downloader-*/

  local _instdir="$pkgdir/usr/share/${pkgname%-cli}"

  install -Dm644 gplay-downloader.py "$_instdir/gplay-downloader.py"
  install -Dm644 device_profiles.py "$_instdir/device_profiles.py"
  install -Dm644 axml_patcher.py "$_instdir/axml_patcher.py"
  install -Dm644 profiles/*.properties -t "$_instdir/profiles/"

  # The optional split-merge feature shells out to `java -jar <this>/APKEditor.jar`.
  # Instead of vendoring upstream's committed prebuilt jar, point at the system copy
  # from the `apkeditor` package. The tool guards with an .exists() check, so this
  # symlink dangles harmlessly when that optdepend is absent.
  ln -s /usr/share/java/apkeditor/APKEditor.jar "$_instdir/APKEditor.jar"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/gplay" <<'WRAPPER'
#!/bin/sh
exec python3 /usr/share/gplay-apk-downloader/gplay-downloader.py "$@"
WRAPPER
}
